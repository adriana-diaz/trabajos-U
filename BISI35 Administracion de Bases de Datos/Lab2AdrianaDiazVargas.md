# 🧾 Laboratorio 2 – Instalación y Configuración de Entorno de Base de Datos

## 🖥️ Objetivo del laboratorio:
Instalar un entorno funcional para administrar bases de datos en un sistema virtualizado, incluyendo:

- Sistema Operativo (SO)
- SQL Server como SGBD
- SQL Server Management Studio (SSMS)
- Restauración de respaldo de base de datos

---

## 📌 Paso 1: Crear una nueva máquina virtual en VirtualBox

**Descripción:**  
VirtualBox permite simular un computador dentro de tu PC físico.

**Instrucciones:**
1. Abrí VirtualBox.
2. Clic en “Nueva”.
3. Asigná un nombre (ej. `VM_SQLServer`).
4. Tipo: `Microsoft Windows`.
5. Versión: según ISO disponible, por ejemplo `Windows 10 (64-bit)`.
6. Asigná memoria RAM (mínimo 4096 MB recomendado).
7. Creá un disco duro virtual de al menos 50 GB.

---

## 📌 Paso 2: Instalar el sistema operativo (Windows)

**Descripción:**  
Es necesario un sistema operativo base para ejecutar SQL Server y SSMS.

**Instrucciones:**
1. Montá el archivo `.ISO` de Windows en la VM (Configuración > Almacenamiento).
2. Iniciá la VM.
3. Seguí el asistente de instalación.
4. Iniciá sesión una vez completado.

---

## 📌 Paso 3: Instalar SQL Server (SGBD)

**¿Qué es SQL Server?**  
Es un **Sistema Gestor de Base de Datos (SGBD)** que permite almacenar, procesar y consultar datos estructurados.

**Instrucciones:**
1. Descargá el instalador desde: [SQL Server Express](https://www.microsoft.com/es-es/sql-server/sql-server-downloads).
2. Elegí “Basic” o “Custom”.
3. Completá la instalación.
4. Tomá nota del nombre de la **instancia** (por defecto `SQLEXPRESS`).

> 💡 **Diferencia clave:**  
> - **SGBD:** El programa que gestiona bases de datos (ej. SQL Server).
> - **Instancia:** Una instalación específica y activa del SGBD. Se pueden tener múltiples en un solo equipo.

---

## 📌 Paso 4: Crear instancia de base de datos – `LabAdminBD`

**Instrucciones:**
1. Abrí SQL Server Management Studio (SSMS).
2. Conectate a la instancia.
3. En Object Explorer, clic derecho en “Databases”.
4. Seleccioná “New Database”.
5. Escribí `LabAdminBD` y hacé clic en OK.

---

## 📌 Paso 5: Instalar SQL Server Management Studio (SSMS)

**¿Qué es SSMS?**  
Es una herramienta gráfica para administrar bases de datos, escribir consultas y gestionar usuarios, respaldos, etc.

**Instrucciones:**
1. Descargá desde: [SSMS Download](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
2. Ejecutá el instalador.
3. Abrí SSMS y conectate a la instancia.

---

## 📌 Paso 6: Restaurar respaldo de base de datos `lab1.bak`

**Instrucciones:**
1. Copiá `lab1.bak` a la VM.
2. En SSMS:
   - Clic derecho en “Databases” > “Restore Database…”.
   - Elegí "Device" y seleccioná el archivo `.bak`.
   - Confirmá el nombre de la base de datos.
   - Hacé clic en OK para restaurar.

📸 **Captura:** Mensaje de restauración exitosa.

---

## 🧠 Conceptos clave del laboratorio:

| Concepto              | Descripción                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **SGBD**              | Programa como SQL Server que gestiona bases de datos.                      |
| **Instancia**         | Instalación activa del SGBD con su propia configuración y bases de datos.  |
| **SSMS**              | Interfaz visual para trabajar con SQL Server.                              |
| **Backup (.bak)**     | Archivo que contiene una copia de seguridad de una base de datos.          |
| **Restaurar**         | Proceso de recuperar una base desde un backup `.bak`.                      |

---
