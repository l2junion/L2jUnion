import os
import sys

# Solución para el error de Tk data directory al compilar con PyInstaller
def resource_path(relative_path):
    """Obtiene la ruta absoluta al recurso, funciona para desarrollo y para PyInstaller"""
    try:
        # PyInstaller crea una carpeta temporal y almacena la ruta en _MEIPASS
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(".")

    return os.path.join(base_path, relative_path)

# Configurar la variable de entorno ANTES de importar tkinter
os.environ['TKDATA'] = resource_path('_tk_data')

# Ahora importamos tkinter y demás dependencias
import tkinter as tk
from tkinter import ttk, messagebox, filedialog
import xml.etree.ElementTree as ET
from xml.dom import minidom

class EnchantEditor:
    def __init__(self, root):
        self.root = root
        self.root.title("✨ Editor de Enchants XML ✨")
        self.root.geometry("1000x750")
        self.root.configure(bg='#121212')
        
        # Variables
        self.filename = "enchants.xml"
        self.tree = None
        self.current_enchant = None
        self.original_id = None  # Para guardar el ID original antes de editar
        
        # Configurar estilos
        self.configure_styles()
        
        # Crear interfaz
        self.create_widgets()
        
        # Intentar cargar el archivo por defecto
        self.load_file()
    
    def configure_styles(self):
        """Configura los estilos visuales de la aplicación"""
        self.style = ttk.Style()
        self.style.theme_use('clam')
        
        # Configurar colores
        self.bg_color = '#121212'
        self.fg_color = '#ffffff'
        self.accent_color = '#4CAF50'
        self.secondary_color = '#333333'
        self.highlight_color = '#4A6FA5'
        self.error_color = '#F44336'
        self.success_color = '#2E7D32'
        
        # Configurar estilos base
        self.style.configure('.', background=self.bg_color, foreground=self.fg_color)
        self.style.configure('TFrame', background=self.bg_color)
        self.style.configure('TLabel', background=self.bg_color, foreground=self.fg_color, font=('Segoe UI', 10))
        self.style.configure('Header.TLabel', font=('Segoe UI', 12, 'bold'), foreground=self.accent_color)
        self.style.configure('TButton', font=('Segoe UI', 10), padding=5, 
                           background=self.secondary_color, foreground=self.fg_color)
        self.style.map('TButton', 
                      background=[('active', self.highlight_color), ('pressed', self.highlight_color)],
                      foreground=[('active', self.fg_color), ('pressed', self.fg_color)])
        self.style.configure('TEntry', fieldbackground=self.secondary_color, foreground=self.fg_color, 
                            insertcolor=self.fg_color, font=('Segoe UI', 10), padding=5)
        self.style.configure('TCombobox', fieldbackground=self.secondary_color, foreground=self.fg_color, 
                           selectbackground=self.highlight_color, font=('Segoe UI', 10), padding=5)
        self.style.configure('TListbox', background=self.secondary_color, foreground=self.fg_color, 
                           selectbackground=self.highlight_color, font=('Segoe UI', 10))
        self.style.configure('TLabelframe', background=self.bg_color, foreground=self.fg_color)
        self.style.configure('TLabelframe.Label', background=self.bg_color, foreground=self.accent_color)
        
        # Estilos especiales
        self.style.configure('success.TButton', background=self.success_color, foreground='white')
        self.style.configure('error.TLabel', foreground=self.error_color)
    
    def create_widgets(self):
        """Crea todos los elementos de la interfaz gráfica"""
        # Frame principal
        main_frame = ttk.Frame(self.root, padding="15")
        main_frame.pack(fill=tk.BOTH, expand=True)
        
        # Header
        self.create_header(main_frame)
        
        # Contenido principal
        content_frame = ttk.Frame(main_frame)
        content_frame.pack(fill=tk.BOTH, expand=True)
        
        # Panel izquierdo (lista)
        self.create_list_panel(content_frame)
        
        # Panel derecho (detalles)
        self.create_detail_panel(content_frame)
    
    def create_header(self, parent):
        """Crea la barra superior con título y botones"""
        header_frame = ttk.Frame(parent)
        header_frame.pack(fill=tk.X, pady=(0, 15))
        
        # Título
        ttk.Label(header_frame, text="✨ Editor de Enchants XML ✨", style='Header.TLabel').pack(side=tk.LEFT)
        
        # Botones de archivo
        file_buttons = ttk.Frame(header_frame)
        file_buttons.pack(side=tk.RIGHT)
        
        btn_style = {'style': 'TButton', 'width': 12}
        ttk.Button(file_buttons, text="📂 Cargar", command=self.load_file_dialog, **btn_style).pack(side=tk.LEFT, padx=5)
        ttk.Button(file_buttons, text="💾 Guardar", command=self.save_file, **btn_style).pack(side=tk.LEFT, padx=5)
        ttk.Button(file_buttons, text="🔖 Guardar Como", command=self.save_file_as, **btn_style).pack(side=tk.LEFT, padx=5)
    
    def create_list_panel(self, parent):
        """Crea el panel izquierdo con la lista de enchants"""
        list_panel = ttk.Frame(parent, width=350)
        list_panel.pack(side=tk.LEFT, fill=tk.Y, padx=(0, 15))
        
        ttk.Label(list_panel, text="📜 Lista de Enchants", style='Header.TLabel').pack(anchor=tk.W, pady=(0, 10))
        
        # Listbox con scrollbar
        list_container = ttk.Frame(list_panel)
        list_container.pack(fill=tk.BOTH, expand=True)
        
        scrollbar = ttk.Scrollbar(list_container)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        
        self.enchant_list = tk.Listbox(
            list_container, 
            height=25, 
            width=40, 
            font=('Segoe UI', 10),
            bg=self.secondary_color,
            fg=self.fg_color,
            selectbackground=self.highlight_color,
            yscrollcommand=scrollbar.set,
            relief=tk.FLAT
        )
        self.enchant_list.pack(fill=tk.BOTH, expand=True)
        scrollbar.config(command=self.enchant_list.yview)
        self.enchant_list.bind('<<ListboxSelect>>', self.on_enchant_select)
        
        # Botones de lista
        list_buttons = ttk.Frame(list_panel)
        list_buttons.pack(fill=tk.X, pady=(10, 0))
        
        ttk.Button(list_buttons, text="➕ Agregar", command=self.add_enchant).pack(side=tk.LEFT, expand=True, padx=2)
        ttk.Button(list_buttons, text="➖ Eliminar", command=self.delete_enchant).pack(side=tk.LEFT, expand=True, padx=2)
    
    def create_detail_panel(self, parent):
        """Crea el panel derecho con los detalles del enchant"""
        detail_panel = ttk.Frame(parent)
        detail_panel.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        
        ttk.Label(detail_panel, text="🔍 Detalles del Enchant", style='Header.TLabel').pack(anchor=tk.W, pady=(0, 15))
        
        # Formulario de edición
        self.create_form(detail_panel)
        
        # Panel de probabilidades
        self.create_probability_panel(detail_panel)
        
        # Botón de guardar
        self.create_save_button(detail_panel)
        
        # Panel de información
        self.create_info_panel(detail_panel)
    
    def create_form(self, parent):
        """Crea el formulario de edición"""
        form_frame = ttk.Frame(parent)
        form_frame.pack(fill=tk.X, pady=5)
        
        # Campos del formulario
        fields = [
            ("🆔 ID:", "id_entry", None),
            ("⭐ Grade:", "grade_combobox", ["1", "2", "3", "4", "5"]),
            ("⚔ Tipo:", "type_combobox", ["Arma", "Armadura"]),
            ("💥 Puede romper:", "break_combobox", ["True", "False"]),
            ("🛡 Mantiene nivel:", "maintain_combobox", ["True", "False"])
        ]
        
        for label_text, var_name, values in fields:
            frame = ttk.Frame(form_frame)
            frame.pack(fill=tk.X, pady=5)
            
            ttk.Label(frame, text=label_text, width=15).pack(side=tk.LEFT)
            
            if values:  # Es un combobox
                combobox = ttk.Combobox(frame, width=30, values=values)
                combobox.pack(side=tk.LEFT, padx=5)
                setattr(self, var_name, combobox)
            else:  # Es un entry
                entry = ttk.Entry(frame, width=33)
                entry.pack(side=tk.LEFT, padx=5)
                setattr(self, var_name, entry)
    
    def create_probability_panel(self, parent):
        """Crea el panel para editar probabilidades"""
        prob_frame = ttk.Frame(parent)
        prob_frame.pack(fill=tk.X, pady=15)
        
        ttk.Label(prob_frame, text="🎲 Probabilidades (separadas por ;):").pack(anchor=tk.W)
        
        self.prob_entry = ttk.Entry(prob_frame)
        self.prob_entry.pack(fill=tk.X, pady=5)
        
        # Etiqueta de ejemplo
        example_label = ttk.Label(prob_frame, text="Ejemplo: 100;100;100;95;90;85;80;75", style='TLabel')
        example_label.pack(anchor=tk.W)
    
    def create_save_button(self, parent):
        """Crea el botón de guardar cambios"""
        save_btn_frame = ttk.Frame(parent)
        save_btn_frame.pack(fill=tk.X, pady=15)
        
        self.save_btn = ttk.Button(
            save_btn_frame, 
            text="💾 Guardar Cambios", 
            command=self.save_changes,
            style='TButton'
        )
        self.save_btn.pack(fill=tk.X, ipady=5)
    
    def create_info_panel(self, parent):
        """Crea el panel de información"""
        info_panel = ttk.LabelFrame(
            parent, 
            text="ℹ️ Tipos de Scrolls", 
            padding=15
        )
        info_panel.pack(fill=tk.X, pady=10)
        
        info_texts = [
            "🔹 Normal: break=True, maintain=False",
            "🔸 Blessed: break=False, maintain=False",
            "🔮 Crystal: break=False, maintain=True"
        ]
        
        for text in info_texts:
            ttk.Label(info_panel, text=text).pack(anchor=tk.W, pady=2)
    
    def load_file(self, filename=None):
        """Carga el archivo XML"""
        if filename:
            self.filename = filename
        
        try:
            self.tree = ET.parse(self.filename)
            self.root.title(f"✨ Editor de Enchants XML - {self.filename}")
            self.update_enchant_list()
            messagebox.showinfo("Éxito", f"Archivo {self.filename} cargado correctamente")
        except FileNotFoundError:
            # Si no existe, crear un nuevo árbol XML vacío
            self.tree = ET.ElementTree(ET.Element('list'))
            messagebox.showwarning("Archivo no encontrado", f"Se creará un nuevo archivo al guardar")
        except ET.ParseError:
            messagebox.showerror("Error", "El archivo no es un XML válido")
            self.tree = ET.ElementTree(ET.Element('list'))
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo cargar el archivo: {str(e)}")
            self.tree = ET.ElementTree(ET.Element('list'))
    
    def load_file_dialog(self):
        """Abre el diálogo para seleccionar archivo"""
        filename = filedialog.askopenfilename(
            title="Seleccionar archivo XML",
            filetypes=[("XML files", "*.xml"), ("Todos los archivos", "*.*")],
            initialdir="."
        )
        if filename:
            self.load_file(filename)
    
    def save_file(self):
        """Guarda el archivo XML"""
        if self.tree is None:
            messagebox.showerror("Error", "No hay datos para guardar")
            return
            
        try:
            # Formatear el XML antes de guardar
            xml_str = ET.tostring(self.tree.getroot(), encoding='unicode')
            dom = minidom.parseString(xml_str)
            pretty_xml = dom.toprettyxml(indent="  ")
            
            with open(self.filename, 'w', encoding='utf-8') as f:
                f.write(pretty_xml)
            
            # Efecto visual al guardar
            self.show_save_feedback()
            
            messagebox.showinfo("Éxito", f"Archivo {self.filename} guardado correctamente")
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo guardar el archivo: {str(e)}")
    
    def save_file_as(self):
        """Guarda el archivo con un nombre diferente"""
        if self.tree is None:
            messagebox.showerror("Error", "No hay datos para guardar")
            return
            
        filename = filedialog.asksaveasfilename(
            title="Guardar como...",
            defaultextension=".xml",
            filetypes=[("XML files", "*.xml"), ("Todos los archivos", "*.*")],
            initialfile="enchants.xml"
        )
        if filename:
            self.filename = filename
            self.save_file()
    
    def update_enchant_list(self):
        """Actualiza la lista de enchants"""
        if self.tree is None:
            return
            
        self.enchant_list.delete(0, tk.END)
        root = self.tree.getroot()
        
        for enchant in root.findall('enchant'):
            item_id = enchant.get('id')
            grade = enchant.get('grade')
            weapon = "⚔ Arma" if enchant.get('weapon') == "True" else "🛡 Armadura"
            self.enchant_list.insert(tk.END, f"ID: {item_id} (G{grade}, {weapon})")
    
    def on_enchant_select(self, event):
        """Maneja la selección de un enchant de la lista"""
        if not self.enchant_list.curselection():
            return
            
        index = self.enchant_list.curselection()[0]
        root = self.tree.getroot()
        enchants = root.findall('enchant')
        
        if index < len(enchants):
            self.current_enchant = enchants[index]
            self.original_id = self.current_enchant.get('id', '')  # Guardar ID original
            
            # Llenar campos con los datos del enchant seleccionado
            self.id_entry.delete(0, tk.END)
            self.id_entry.insert(0, self.original_id)
            
            self.grade_combobox.set(self.current_enchant.get('grade', ''))
            
            weapon = self.current_enchant.get('weapon', 'True')
            self.type_combobox.set("Arma" if weapon == "True" else "Armadura")
            
            self.break_combobox.set(self.current_enchant.get('break', ''))
            self.maintain_combobox.set(self.current_enchant.get('maintain', ''))
            
            self.prob_entry.delete(0, tk.END)
            self.prob_entry.insert(0, self.current_enchant.get('chance', ''))
    
    def add_enchant(self):
        """Agrega un nuevo enchant a la lista"""
        # Crear un nuevo enchant con valores por defecto
        new_enchant = ET.Element('enchant')
        new_enchant.set('id', '0')
        new_enchant.set('grade', '1')
        new_enchant.set('weapon', 'True')
        new_enchant.set('break', 'True')
        new_enchant.set('maintain', 'False')
        new_enchant.set('chance', '100;100;100;95;90;85;80;75')
        
        # Agregar al árbol XML
        root = self.tree.getroot()
        root.append(new_enchant)
        
        # Actualizar lista
        self.update_enchant_list()
        
        # Seleccionar el nuevo enchant
        last_index = self.enchant_list.size() - 1
        self.enchant_list.selection_clear(0, tk.END)
        self.enchant_list.selection_set(last_index)
        self.enchant_list.activate(last_index)
        self.on_enchant_select(None)
    
    def delete_enchant(self):
        """Elimina el enchant seleccionado"""
        if not self.current_enchant:
            messagebox.showwarning("Advertencia", "No hay ningún enchant seleccionado")
            return
            
        if not messagebox.askyesno("Confirmar", "¿Estás seguro de que quieres eliminar este enchant?"):
            return
            
        root = self.tree.getroot()
        root.remove(self.current_enchant)
        self.current_enchant = None
        self.original_id = None
        self.update_enchant_list()
        self.clear_fields()
    
    def save_changes(self):
        """Guarda los cambios en el enchant actual"""
        if not self.current_enchant:
            messagebox.showwarning("Advertencia", "No hay ningún enchant seleccionado")
            return
            
        try:
            # Validar campos
            new_id = self.id_entry.get()
            if not new_id.isdigit():
                raise ValueError("El ID debe ser un número")
            
            # Verificar si el ID ha cambiado
            if new_id != self.original_id:
                # Verificar si el nuevo ID ya existe
                root = self.tree.getroot()
                for enchant in root.findall('enchant'):
                    if enchant != self.current_enchant and enchant.get('id') == new_id:
                        raise ValueError(f"El ID {new_id} ya existe en otro enchant")
                
            if not self.grade_combobox.get().isdigit() or int(self.grade_combobox.get()) not in range(1, 6):
                raise ValueError("El grade debe ser un número entre 1 y 5")
                
            if self.type_combobox.get() not in ["Arma", "Armadura"]:
                raise ValueError("Selecciona un tipo válido")
                
            if self.break_combobox.get() not in ["True", "False"]:
                raise ValueError("Selecciona un valor válido para 'Puede romper'")
                
            if self.maintain_combobox.get() not in ["True", "False"]:
                raise ValueError("Selecciona un valor válido para 'Mantiene nivel'")
                
            # Validar probabilidades
            probs = self.prob_entry.get().split(';')
            if not all(p.isdigit() for p in probs):
                raise ValueError("Las probabilidades deben ser números separados por ';'")
                
            # Actualizar el enchant
            self.current_enchant.set('id', new_id)
            self.current_enchant.set('grade', self.grade_combobox.get())
            self.current_enchant.set('weapon', "True" if self.type_combobox.get() == "Arma" else "False")
            self.current_enchant.set('break', self.break_combobox.get())
            self.current_enchant.set('maintain', self.maintain_combobox.get())
            self.current_enchant.set('chance', self.prob_entry.get())
            
            # Actualizar el ID original
            self.original_id = new_id
            
            # Actualizar lista
            self.update_enchant_list()
            
            # Mostrar feedback visual
            self.show_save_feedback()
            
            messagebox.showinfo("Éxito", "Cambios guardados correctamente")
        except ValueError as e:
            messagebox.showerror("Error", str(e))
    
    def show_save_feedback(self):
        """Muestra feedback visual al guardar"""
        original_style = self.save_btn['style']
        self.save_btn.configure(style='success.TButton')
        self.root.after(1000, lambda: self.save_btn.configure(style=original_style))
    
    def clear_fields(self):
        """Limpia todos los campos de edición"""
        self.id_entry.delete(0, tk.END)
        self.grade_combobox.set('')
        self.type_combobox.set('')
        self.break_combobox.set('')
        self.maintain_combobox.set('')
        self.prob_entry.delete(0, tk.END)
        self.original_id = None

if __name__ == "__main__":
    try:
        root = tk.Tk()
        app = EnchantEditor(root)
        root.mainloop()
    except Exception as e:
        messagebox.showerror("Error fatal", f"Se produjo un error inesperado: {str(e)}")