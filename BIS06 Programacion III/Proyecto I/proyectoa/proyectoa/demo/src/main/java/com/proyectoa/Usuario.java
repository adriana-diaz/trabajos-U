package com.proyectoa;
// atributos
public class Usuario {
    private int idusuario;
    private String Nombre;
    private String Apellido;
    private String Email;
    private String Descripcion;
    private String prioridad;
    private String fechadevencimiento;

    //el contructor lleno de los atributos
    public Usuario(int idusuario, String nombre, String apellido, String email, String descripcion, String prioridad,
            String fechadevencimiento) {
        this.idusuario = idusuario;
        this.Nombre = nombre;
        this.Apellido = apellido;
        this.Email = email;
        this.Descripcion = descripcion;
        this.prioridad = prioridad;
        this.fechadevencimiento = fechadevencimiento;
    }
    //los metodos necesarios para la clase
    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String apellido) {
        Apellido = apellido;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getFechadevencimiento() {
        return fechadevencimiento;
    }
    //
    public void setFechadevencimiento(String fechadevencimiento) {
        this.fechadevencimiento = fechadevencimiento;
    }
    @Override
    //se usa para crear los usurarios
    public String toString() {
        return "Usuario [idusuario=" + idusuario + ", Nombre=" + Nombre + ", Apellido=" + Apellido + ", Email=" + Email
                + ", Descripcion=" + Descripcion + ", prioridad=" + prioridad + ", fechadevencimiento="
                + fechadevencimiento + "]";
    }
    @Override
    public int hashCode() {
        final int prime = 31; // Número primo que se utiliza en el cálculo del hash
        int result = 1;// Valor inicial para el resultado del hash
         // Multiplicar el resultado actual por el número primo y sumar el hash de cada atributo
        result = prime * result + idusuario;
        result = prime * result + ((Nombre == null) ? 0 : Nombre.hashCode());
        result = prime * result + ((Apellido == null) ? 0 : Apellido.hashCode());
        result = prime * result + ((Email == null) ? 0 : Email.hashCode());
        result = prime * result + ((Descripcion == null) ? 0 : Descripcion.hashCode());
        result = prime * result + ((prioridad == null) ? 0 : prioridad.hashCode());
        result = prime * result + ((fechadevencimiento == null) ? 0 : fechadevencimiento.hashCode());
        return result;
    }
    @Override
    public boolean equals(Object obj) {
        //se identifican los aticulos nulos
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Usuario other = (Usuario) obj;
        // Comparar cada atributo individualmente
        if (idusuario != other.idusuario)
            return false;
        if (Nombre == null) {
            if (other.Nombre != null)
                return false;
        } else if (!Nombre.equals(other.Nombre))
            return false;
        if (Apellido == null) {
            if (other.Apellido != null)
                return false;
        } else if (!Apellido.equals(other.Apellido))
            return false;
        if (Email == null) {
            if (other.Email != null)
                return false;
        } else if (!Email.equals(other.Email))
            return false;
        if (Descripcion == null) {
            if (other.Descripcion != null)
                return false;
        } else if (!Descripcion.equals(other.Descripcion))
            return false;
        if (prioridad == null) {
            if (other.prioridad != null)
                return false;
        } else if (!prioridad.equals(other.prioridad))
            return false;
        if (fechadevencimiento == null) {
            if (other.fechadevencimiento != null)
                return false;
        } else if (!fechadevencimiento.equals(other.fechadevencimiento))
            return false;
        return true;
    }
    
    //
    

    
}
