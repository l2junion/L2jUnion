import os
import subprocess
import customtkinter as ctk
from tkinter import filedialog, messagebox
import traceback
import shutil
import threading

ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

class GitHubUploaderApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.title("Actualizador GitHub")
        self.geometry("600x470")
        self.resizable(False, False)

        # Variables
        self.repo_url = ctk.StringVar()
        self.folder_path = ctk.StringVar()

        # Widgets
        ctk.CTkLabel(self, text="🔗 URL del Repositorio GitHub:", font=("Arial", 14)).pack(pady=10)
        ctk.CTkEntry(self, textvariable=self.repo_url, width=500).pack()

        ctk.CTkLabel(self, text="📁 Carpeta a subir:", font=("Arial", 14)).pack(pady=10)
        ctk.CTkEntry(self, textvariable=self.folder_path, width=500).pack()
        ctk.CTkButton(self, text="Seleccionar Carpeta", command=self.select_folder).pack(pady=5)

        ctk.CTkButton(self, text="🚀 Subir a GitHub", command=self.subir_en_hilo, fg_color="green").pack(pady=15)

        self.log_box = ctk.CTkTextbox(self, width=560, height=180, font=("Consolas", 12))
        self.log_box.pack(pady=5)
        self.log("🔧 Listo para comenzar...\n")

    def log(self, message):
        self.log_box.insert("end", f"{message}\n")
        self.log_box.see("end")

    def select_folder(self):
        folder = filedialog.askdirectory()
        if folder:
            self.folder_path.set(folder)

    def verificar_git(self):
        git_path = shutil.which("git")
        if git_path is None:
            self.log("❌ Git no está instalado o no se encuentra en el PATH del sistema.")
            messagebox.showerror("Error", "Git no está instalado o no está en el PATH.\nInstalalo desde:\nhttps://git-scm.com/")
            return False
        else:
            self.log(f"🧠 Git detectado en: {git_path}")
            return True

    def run_command(self, command, show_output=True, check=False):
        try:
            self.log(f"📤 Ejecutando: {' '.join(command)}")
            result = subprocess.run(command, check=check, capture_output=True, text=True)
            if result.stdout.strip():
                self.log("✔ STDOUT:\n" + result.stdout.strip())
            if result.stderr.strip():
                self.log("⚠ STDERR:\n" + result.stderr.strip())
            return result
        except subprocess.CalledProcessError as e:
            self.log(f"❌ Error al ejecutar: {' '.join(command)}")
            if e.stdout:
                self.log("🟡 STDOUT:\n" + e.stdout.strip())
            if e.stderr:
                self.log("🔴 STDERR:\n" + e.stderr.strip())
            raise
        except Exception as e:
            self.log("🔥 Excepción inesperada al ejecutar comando:")
            self.log(traceback.format_exc())
            raise

    def verificar_conexion(self, url):
        self.log("🔍 Verificando conexión con el repositorio...")
        try:
            result = self.run_command(["git", "ls-remote", url], check=False)
            if "Authentication failed" in result.stderr:
                raise Exception("Error de autenticación")
            if "fatal: repository not found" in result.stderr:
                raise Exception("Repositorio no encontrado")
            self.log("✅ Conexión verificada correctamente")
            return True
        except Exception as e:
            self.log(f"❌ Error al verificar conexión: {str(e)}")
            raise Exception(f"No se pudo conectar al repositorio: {str(e)}")

    def configurar_credenciales(self):
        self.log("🔑 Configurando credenciales...")
        try:
            self.run_command(["git", "config", "--global", "credential.helper", "store"], check=False)
            self.log("✅ Configuración de credenciales completada")
        except Exception as e:
            self.log(f"⚠ No se pudo configurar el helper de credenciales: {e}")

    def subir_en_hilo(self):
        threading.Thread(target=self.upload_to_github, daemon=True).start()

    def upload_to_github(self):
        if not self.verificar_git():
            return

        url = self.repo_url.get().strip()
        folder = self.folder_path.get().strip()

        self.log("\n======================================")
        self.log("🚀 INICIANDO PROCESO DE ACTUALIZACIÓN")
        self.log("======================================")

        if not url or not folder:
            messagebox.showerror("Error", "Debes completar ambos campos.")
            self.log("❗ Faltan campos obligatorios.")
            return

        try:
            # Verificar conexión antes de continuar
            self.verificar_conexion(url)
            self.configurar_credenciales()

            self.log(f"📂 Cambiando a la carpeta: {folder}")
            os.chdir(folder)

            # Eliminar index.lock si existe
            lock_file = os.path.join(folder, ".git", "index.lock")
            if os.path.exists(lock_file):
                self.log("🔒 Se detectó un archivo de bloqueo Git: index.lock")
                try:
                    os.remove(lock_file)
                    self.log("🧹 index.lock eliminado automáticamente.")
                except Exception as e:
                    self.log("❌ No se pudo eliminar index.lock:")
                    self.log(str(e))
                    messagebox.showerror("Error", "No se pudo eliminar el archivo .git/index.lock.\nHazlo manualmente y vuelve a intentar.")
                    return

            if not os.path.exists(".git"):
                self.log("🧪 Inicializando repositorio Git...")
                self.run_command(["git", "init"], check=True)

            self.log("🔄 Configurando remoto origin...")
            self.run_command(["git", "remote", "remove", "origin"], check=False)
            self.run_command(["git", "remote", "add", "origin", url], check=True)

            self.log("📥 Agregando cambios...")
            self.run_command(["git", "add", "."], check=True)

            self.log("📝 Realizando commit...")
            result_commit = self.run_command(["git", "commit", "-m", "Actualización automática"], check=False)
            if "nothing to commit" in result_commit.stdout.lower():
                self.log("ℹ️ No hay cambios para commitear, creando commit vacío...")
                self.run_command(["git", "commit", "--allow-empty", "-m", "Commit vacío para crear rama main"], check=True)
            else:
                self.log("✔ Commit realizado.")

            self.log("📌 Estableciendo rama principal...")
            self.run_command(["git", "branch", "-M", "main"], check=False)

            # Intentar hacer pull con rebase primero
            self.log("🔄 Sincronizando con el repositorio remoto...")
            try:
                pull_result = self.run_command(["git", "pull", "origin", "main", "--rebase"], check=False)
                if "conflict" in pull_result.stderr.lower():
                    raise Exception("Conflicto detectado al hacer pull. Resuelve los conflictos manualmente.")
            except Exception as e:
                self.log(f"⚠ No se pudo sincronizar con el remoto: {e}")
                self.log("⏩ Continuando con push forzado...")

            self.log("📤 Subiendo a GitHub...")
            push_result = self.run_command(["git", "push", "-u", "origin", "main", "--force"], check=False)
            
            if push_result.returncode != 0:
                error_msg = "Error al subir los cambios:\n"
                if "permission denied" in push_result.stderr.lower():
                    error_msg += "\n🔒 Error de permisos: Verifica que tienes acceso de escritura al repositorio"
                elif "protected branch" in push_result.stderr.lower():
                    error_msg += "\n🛡️ La rama está protegida: No puedes hacer push forzado a esta rama"
                elif "authentication failed" in push_result.stderr.lower():
                    error_msg += "\n🔑 Error de autenticación: Verifica tus credenciales"
                else:
                    error_msg += push_result.stderr
                
                raise Exception(error_msg)

            self.log("✅ ¡Subida completada exitosamente!")
            messagebox.showinfo("Éxito", "Los cambios se subieron correctamente a GitHub")

        except Exception as e:
            self.log("\n❗❗❗ ERROR CRÍTICO ❗❗❗")
            self.log(f"🔴 {str(e)}")
            
            error_msg = f"Ocurrió un error al subir los cambios:\n\n{str(e)}\n\n"
            error_msg += "Posibles soluciones:\n"
            error_msg += "1. Verifica que tienes permisos para escribir en el repositorio\n"
            error_msg += "2. Si usas HTTPS, asegúrate de que tu token de acceso es válido\n"
            error_msg += "3. Si la rama está protegida, desactiva la protección temporalmente\n"
            error_msg += "4. Verifica que no hay conflictos con el repositorio remoto"
            
            messagebox.showerror("Error", error_msg)

if __name__ == "__main__":
    app = GitHubUploaderApp()
    app.mainloop()