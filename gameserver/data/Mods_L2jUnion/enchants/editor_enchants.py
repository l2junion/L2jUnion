import os
import sys
from tkinter import ttk, messagebox, filedialog
import xml.etree.ElementTree as ET
from xml.dom import minidom
import tkinter as tk

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

class EnchantEditor:
    def __init__(self, root):
        self.root = root
        self.root.title("✨ Editor de Enchants XML ✨")
        self.root.geometry("1400x900")
        self.root.configure(bg='#121212')
        
        # Variables
        self.filename = "enchantConfig.xml"
        self.tree = None
        self.current_enchant = None
        self.original_id = None
        self.max_level = 15  # Nivel máximo de encantamiento permitido
        
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
        self.style.configure('small.TButton', font=('Segoe UI', 8), padding=2)
    
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
        
        # Frame principal con scrollbar vertical
        detail_main_frame = ttk.Frame(detail_panel)
        detail_main_frame.pack(fill=tk.BOTH, expand=True)
        
        canvas = tk.Canvas(detail_main_frame, bg=self.bg_color, highlightthickness=0)
        scrollbar = ttk.Scrollbar(detail_main_frame, orient="vertical", command=canvas.yview)
        scrollable_frame = ttk.Frame(canvas)
        
        scrollable_frame.bind(
            "<Configure>",
            lambda e: canvas.configure(
                scrollregion=canvas.bbox("all")
            )
        )
        
        canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")
        canvas.configure(yscrollcommand=scrollbar.set)
        
        canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")
        
        # Formulario de edición
        self.create_form(scrollable_frame)
        
        # Panel de probabilidades
        self.create_probability_panel(scrollable_frame)
        
        # Panel de comportamiento
        self.create_behavior_panel(scrollable_frame)
        
        # Botón de guardar
        self.create_save_button(scrollable_frame)
        
        # Panel de información
        self.create_info_panel(scrollable_frame)
    
    def create_form(self, parent):
        """Crea el formulario de edición"""
        form_frame = ttk.Frame(parent)
        form_frame.pack(fill=tk.X, pady=5)
        
        # Campos del formulario básico
        fields = [
            ("🆔 ID:", "id_entry", None),
            ("⚔ Tipo:", "type_combobox", ["weapon", "armor"]),
            ("⭐ Grade:", "grade_combobox", ["D", "C", "B", "A", "S"]),
            ("🙏 Bendito:", "blessed_combobox", ["true", "false"]),
            ("💎 Crystal:", "crystal_combobox", ["true", "false"])
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
        prob_frame = ttk.LabelFrame(parent, text="🎲 Probabilidades por Nivel", padding=10)
        prob_frame.pack(fill=tk.X, pady=10)
        
        # Frame para los controles de niveles
        controls_frame = ttk.Frame(prob_frame)
        controls_frame.pack(fill=tk.X, pady=5)
        
        ttk.Button(
            controls_frame, 
            text="➕ Agregar Nivel", 
            command=self.add_level,
            style='small.TButton'
        ).pack(side=tk.LEFT, padx=2)
        
        ttk.Button(
            controls_frame, 
            text="➖ Quitar Nivel", 
            command=self.remove_level,
            style='small.TButton'
        ).pack(side=tk.LEFT, padx=2)
        
        # Frame para el canvas y scrollbar
        canvas_frame = ttk.Frame(prob_frame)
        canvas_frame.pack(fill=tk.BOTH, expand=True)
        
        # Canvas con scrollbar horizontal
        self.prob_canvas = tk.Canvas(
            canvas_frame,
            bg=self.secondary_color,
            highlightthickness=0
        )
        
        h_scrollbar = ttk.Scrollbar(canvas_frame, orient=tk.HORIZONTAL, command=self.prob_canvas.xview)
        h_scrollbar.pack(side=tk.BOTTOM, fill=tk.X)
        
        self.prob_canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
        self.prob_canvas.configure(xscrollcommand=h_scrollbar.set)
        
        # Frame interno para las entradas de probabilidad
        self.prob_inner_frame = ttk.Frame(self.prob_canvas)
        self.prob_canvas.create_window((0, 0), window=self.prob_inner_frame, anchor=tk.NW)
        
        # Configurar el scroll del canvas
        self.prob_inner_frame.bind(
            "<Configure>",
            lambda e: self.prob_canvas.configure(
                scrollregion=self.prob_canvas.bbox("all")
            )
        )
        
        # Lista para almacenar las entradas de probabilidad
        self.prob_entries = []
        self.prob_labels = []
        
        # Crear niveles iniciales (0-8)
        self.create_level_entries(9)
    
    def create_behavior_panel(self, parent):
        """Crea el panel para el comportamiento del scroll"""
        behavior_frame = ttk.LabelFrame(parent, text="⚙️ Comportamiento", padding=10)
        behavior_frame.pack(fill=tk.X, pady=10)
        
        # Campos de comportamiento
        behavior_fields = [
            ("💥 Puede romper:", "breaks_combobox", ["true", "false"]),
            ("🛡 Mantiene nivel:", "maintain_combobox", ["true", "false"])
        ]
        
        for label_text, var_name, values in behavior_fields:
            frame = ttk.Frame(behavior_frame)
            frame.pack(fill=tk.X, pady=5)
            
            ttk.Label(frame, text=label_text, width=15).pack(side=tk.LEFT)
            
            combobox = ttk.Combobox(frame, width=30, values=values)
            combobox.pack(side=tk.LEFT, padx=5)
            setattr(self, var_name, combobox)
    
    def create_level_entries(self, count):
        """Crea las entradas para los niveles de encantamiento"""
        # Limpiar entradas existentes
        for widget in self.prob_inner_frame.winfo_children():
            widget.destroy()
        self.prob_entries.clear()
        self.prob_labels.clear()
        
        # Crear nuevas entradas
        for i in range(count):
            frame = ttk.Frame(self.prob_inner_frame)
            frame.pack(side=tk.LEFT, padx=5, pady=5)
            
            label = ttk.Label(frame, text=f"+{i}:")
            label.pack()
            self.prob_labels.append(label)
            
            entry = ttk.Entry(frame, width=5)
            entry.pack()
            self.prob_entries.append(entry)
        
        # Actualizar el canvas
        self.prob_inner_frame.update_idletasks()
        self.prob_canvas.config(scrollregion=self.prob_canvas.bbox("all"))
    
    def add_level(self):
        """Agrega un nuevo nivel de encantamiento"""
        if len(self.prob_entries) >= self.max_level:
            messagebox.showwarning("Advertencia", f"No se pueden agregar más de {self.max_level} niveles")
            return
        
        # Agregar nuevo nivel
        new_level = len(self.prob_entries)
        frame = ttk.Frame(self.prob_inner_frame)
        frame.pack(side=tk.LEFT, padx=5, pady=5)
        
        label = ttk.Label(frame, text=f"+{new_level}:")
        label.pack()
        self.prob_labels.append(label)
        
        entry = ttk.Entry(frame, width=5)
        entry.pack()
        self.prob_entries.append(entry)
        
        # Si hay un enchant cargado, agregar un valor por defecto al nuevo nivel
        if self.current_enchant:
            chances = self.current_enchant.find('chances')
            if chances is not None:
                last_chance = chances.find(f'enchant[@level="{new_level-1}"]')
                default_value = last_chance.get('chance', '50') if last_chance is not None else '50'
                entry.insert(0, default_value)
            else:
                entry.insert(0, '50')
        
        # Actualizar el canvas
        self.prob_inner_frame.update_idletasks()
        self.prob_canvas.config(scrollregion=self.prob_canvas.bbox("all"))
    
    def remove_level(self):
        """Elimina el último nivel de encantamiento"""
        if len(self.prob_entries) <= 1:  # Al menos debe haber un nivel
            messagebox.showwarning("Advertencia", "Debe haber al menos un nivel de encantamiento")
            return
            
        # Eliminar el último nivel
        last_frame = self.prob_entries[-1].master
        last_frame.destroy()
        
        self.prob_entries.pop()
        self.prob_labels.pop()
        
        # Actualizar el canvas
        self.prob_inner_frame.update_idletasks()
        self.prob_canvas.config(scrollregion=self.prob_canvas.bbox("all"))
    
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
            "🔹 Normal: breaks=true, maintain=false, blessed=false, crystal=false",
            "🔸 Blessed: breaks=false, maintain=true, blessed=true, crystal=false",
            "🔮 Crystal: breaks=false, maintain=true, blessed=false, crystal=true"
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
            
            # Verificar estructura del XML
            root = self.tree.getroot()
            if root.tag != 'enchantConfig':
                messagebox.showerror("Error", "El archivo XML no tiene la estructura esperada (root debe ser 'enchantConfig')")
                return
            
            scrolls = root.find('scrolls')
            if scrolls is None:
                messagebox.showerror("Error", "El archivo XML no contiene la sección 'scrolls'")
                return
            
            self.update_enchant_list()
            messagebox.showinfo("Éxito", f"Archivo {self.filename} cargado correctamente")
        except FileNotFoundError:
            # Si no existe, crear un nuevo árbol XML vacío
            root = ET.Element('enchantConfig')
            scrolls = ET.SubElement(root, 'scrolls')
            self.tree = ET.ElementTree(root)
            messagebox.showwarning("Archivo no encontrado", f"Se creará un nuevo archivo al guardar")
        except ET.ParseError:
            messagebox.showerror("Error", "El archivo no es un XML válido")
            root = ET.Element('enchantConfig')
            scrolls = ET.SubElement(root, 'scrolls')
            self.tree = ET.ElementTree(root)
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo cargar el archivo: {str(e)}")
            root = ET.Element('enchantConfig')
            scrolls = ET.SubElement(root, 'scrolls')
            self.tree = ET.ElementTree(root)
    
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
        """Guarda el archivo XML con formato correcto"""
        if self.tree is None:
            messagebox.showerror("Error", "No hay datos para guardar")
            return
            
        try:
            # Primero asegurarnos de que todos los cambios están guardados
            if self.current_enchant:
                self.save_changes()
            
            # Obtener el XML como string
            xml_str = ET.tostring(self.tree.getroot(), encoding='unicode')
            
            # Parsear el XML para formatearlo
            dom = minidom.parseString(xml_str)
            
            # Configuración especial para el formato
            pretty_xml = dom.toprettyxml(indent="    ")
            
            # Eliminar líneas vacías adicionales que agrega minidom
            pretty_xml = '\n'.join([line for line in pretty_xml.split('\n') 
                                  if line.strip() != ''])
            
            # Escribir el archivo
            with open(self.filename, 'w', encoding='utf-8') as f:
                f.write(pretty_xml)
            
            # Feedback visual
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
            initialfile="enchantConfig.xml"
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
        scrolls = root.find('scrolls')
        
        if scrolls is None:
            scrolls = ET.SubElement(root, 'scrolls')
        
        for scroll in scrolls.findall('scroll'):
            scroll_id = scroll.get('id')
            scroll_type = scroll.get('type', 'weapon')
            grade = scroll.get('grade', '?')
            blessed = "🙏" if scroll.get('blessed') == "true" else ""
            crystal = "💎" if scroll.get('crystal') == "true" else ""
            
            type_icon = "⚔" if scroll_type == "weapon" else "🛡"
            
            self.enchant_list.insert(tk.END, f"{type_icon}{blessed}{crystal} G{grade} (ID:{scroll_id})")
    
    def on_enchant_select(self, event):
        """Maneja la selección de un enchant de la lista"""
        if not self.enchant_list.curselection():
            return
            
        index = self.enchant_list.curselection()[0]
        root = self.tree.getroot()
        scrolls = root.find('scrolls')
        
        if scrolls is None:
            scrolls = ET.SubElement(root, 'scrolls')
        
        scroll_list = scrolls.findall('scroll')
        
        if index < len(scroll_list):
            self.current_enchant = scroll_list[index]
            self.original_id = self.current_enchant.get('id', '')  # Guardar ID original
            
            # Llenar campos básicos
            self.id_entry.delete(0, tk.END)
            self.id_entry.insert(0, self.original_id)
            
            self.type_combobox.set(self.current_enchant.get('type', 'weapon'))
            self.grade_combobox.set(self.current_enchant.get('grade', ''))
            self.blessed_combobox.set(self.current_enchant.get('blessed', 'false'))
            self.crystal_combobox.set(self.current_enchant.get('crystal', 'false'))
            
            # Llenar comportamiento
            behavior = self.current_enchant.find('behavior')
            if behavior is not None:
                self.breaks_combobox.set(behavior.get('breaks', 'true'))
                self.maintain_combobox.set(behavior.get('maintain', 'false'))
            
            # Llenar probabilidades
            chances = self.current_enchant.find('chances')
            if chances is not None:
                # Determinar el número máximo de niveles
                max_level = max([int(chance.get('level', '0')) for chance in chances.findall('enchant')] + [8]) + 1
                self.create_level_entries(max_level)
                
                for i, entry in enumerate(self.prob_entries):
                    entry.delete(0, tk.END)
                    chance = chances.find(f'enchant[@level="{i}"]')
                    if chance is not None:
                        entry.insert(0, chance.get('chance', ''))
            else:
                # Si no hay chances, crear 9 niveles por defecto
                self.create_level_entries(9)
    
    def add_enchant(self):
        """Agrega un nuevo enchant a la lista"""
        # Crear un nuevo scroll con valores por defecto
        new_scroll = ET.Element('scroll')
        new_scroll.set('id', '0')
        new_scroll.set('type', 'weapon')
        new_scroll.set('grade', 'D')
        new_scroll.set('blessed', 'false')
        new_scroll.set('crystal', 'false')
        
        # Agregar comportamiento por defecto
        behavior = ET.SubElement(new_scroll, 'behavior')
        behavior.set('breaks', 'true')
        behavior.set('maintain', 'false')
        
        # Agregar chances por defecto (9 niveles)
        chances = ET.SubElement(new_scroll, 'chances')
        for i in range(9):
            ET.SubElement(chances, 'enchant', {'level': str(i), 'chance': '50'})
        
        # Agregar al árbol XML
        root = self.tree.getroot()
        scrolls = root.find('scrolls')
        if scrolls is None:
            scrolls = ET.SubElement(root, 'scrolls')
        scrolls.append(new_scroll)
        
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
        scrolls = root.find('scrolls')
        if scrolls is not None:
            scrolls.remove(self.current_enchant)
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
            # Validar campos básicos
            new_id = self.id_entry.get()
            if not new_id.isdigit():
                raise ValueError("El ID debe ser un número")
            
            # Verificar si el ID ha cambiado
            if new_id != self.original_id:
                # Verificar si el nuevo ID ya existe
                root = self.tree.getroot()
                scrolls = root.find('scrolls')
                if scrolls is not None:
                    for scroll in scrolls.findall('scroll'):
                        if scroll != self.current_enchant and scroll.get('id') == new_id:
                            raise ValueError(f"El ID {new_id} ya existe en otro enchant")
                
            if self.type_combobox.get() not in ["weapon", "armor"]:
                raise ValueError("Selecciona un tipo válido (weapon o armor)")
                
            if self.grade_combobox.get() not in ["D", "C", "B", "A", "S"]:
                raise ValueError("Selecciona un grade válido (D, C, B, A, S)")
                
            if self.blessed_combobox.get() not in ["true", "false"]:
                raise ValueError("Selecciona un valor válido para 'Bendito'")
                
            if self.crystal_combobox.get() not in ["true", "false"]:
                raise ValueError("Selecciona un valor válido para 'Crystal'")
                
            # Validar comportamiento
            if self.breaks_combobox.get() not in ["true", "false"]:
                raise ValueError("Selecciona un valor válido para 'Puede romper'")
                
            if self.maintain_combobox.get() not in ["true", "false"]:
                raise ValueError("Selecciona un valor válido para 'Mantiene nivel'")
            
            # Validar probabilidades
            for i, entry in enumerate(self.prob_entries):
                if not entry.get().isdigit():
                    raise ValueError(f"La probabilidad para +{i} debe ser un número")
                if not 0 <= int(entry.get()) <= 100:
                    raise ValueError(f"La probabilidad para +{i} debe estar entre 0 y 100")
            
            # Actualizar el scroll
            self.current_enchant.set('id', new_id)
            self.current_enchant.set('type', self.type_combobox.get())
            self.current_enchant.set('grade', self.grade_combobox.get())
            self.current_enchant.set('blessed', self.blessed_combobox.get())
            self.current_enchant.set('crystal', self.crystal_combobox.get())
            
            # Actualizar comportamiento
            behavior = self.current_enchant.find('behavior')
            if behavior is None:
                behavior = ET.SubElement(self.current_enchant, 'behavior')
            behavior.set('breaks', self.breaks_combobox.get())
            behavior.set('maintain', self.maintain_combobox.get())
            
            # Actualizar probabilidades
            chances = self.current_enchant.find('chances')
            if chances is None:
                chances = ET.SubElement(self.current_enchant, 'chances')
            
            # Limpiar chances existentes
            for chance in chances.findall('enchant'):
                chances.remove(chance)
            
            # Agregar nuevas chances
            for i, entry in enumerate(self.prob_entries):
                if entry.get().isdigit():
                    ET.SubElement(chances, 'enchant', {'level': str(i), 'chance': entry.get()})
            
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
        self.type_combobox.set('')
        self.grade_combobox.set('')
        self.blessed_combobox.set('')
        self.crystal_combobox.set('')
        self.breaks_combobox.set('')
        self.maintain_combobox.set('')
        self.create_level_entries(9)  # Resetear a 9 niveles
        self.original_id = None

if __name__ == "__main__":
    try:
        root = tk.Tk()
        app = EnchantEditor(root)
        root.mainloop()
    except Exception as e:
        messagebox.showerror("Error fatal", f"Se produjo un error inesperado: {str(e)}")