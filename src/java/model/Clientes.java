package model;

public class Clientes {

    private int dni;
    private Embarque tarjetaEmbarque;
    private String nombre;
    private String apellido;
    private String direccion;
    private String telefono;
    private String usuario;
    private String clave;
    private String tarjetaCredito;

    public Clientes() {
    }

    public Clientes(int dni, Embarque tarjetaEmbarque, String nombre, String apellido, String direccion, String telefono, String usuario, String clave, String tarjetaCredito) {
        this.dni = dni;
        this.tarjetaEmbarque = tarjetaEmbarque;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.telefono = telefono;
        this.usuario = usuario;
        this.clave = clave;
        this.tarjetaCredito = tarjetaCredito;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

   
    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public Embarque getTarjetaEmbarque() {
        return tarjetaEmbarque;
    }

    public void setTarjetaEmbarque(Embarque tarjetaEmbarque) {
        this.tarjetaEmbarque = tarjetaEmbarque;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTarjetaCredito() {
        return tarjetaCredito;
    }

    public void setTarjetaCredito(String tarjetaCredito) {
        this.tarjetaCredito = tarjetaCredito;
    }

}
