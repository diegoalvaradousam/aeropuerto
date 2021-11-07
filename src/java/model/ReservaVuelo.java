package model;

public class ReservaVuelo {

    private int codReserva;
    private String fechaSalida;
    private String fechaLlegada;
    private Aeropuerto aeropuertoSalida;
    private Aeropuerto aeropuertoLlegada;
    private Clientes dniCliente;
    private Aviones codAvion;

    public ReservaVuelo() {
    }

    public ReservaVuelo(int codReserva, String fechaSalida, String fechaLlegada, Aeropuerto aeropuertoSalida, Aeropuerto aeropuertoLlegada, Clientes dniCliente, Aviones codAvion) {
        this.codReserva = codReserva;
        this.fechaSalida = fechaSalida;
        this.fechaLlegada = fechaLlegada;
        this.aeropuertoSalida = aeropuertoSalida;
        this.aeropuertoLlegada = aeropuertoLlegada;
        this.dniCliente = dniCliente;
        this.codAvion = codAvion;
    }

    public int getCodReserva() {
        return codReserva;
    }

    public void setCodReserva(int codReserva) {
        this.codReserva = codReserva;
    }

    public String getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(String fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public String getFechaLlegada() {
        return fechaLlegada;
    }

    public void setFechaLlegada(String fechaLlegada) {
        this.fechaLlegada = fechaLlegada;
    }

    public Aeropuerto getAeropuertoSalida() {
        return aeropuertoSalida;
    }

    public void setAeropuertoSalida(Aeropuerto aeropuertoSalida) {
        this.aeropuertoSalida = aeropuertoSalida;
    }

    public Aeropuerto getAeropuertoLlegada() {
        return aeropuertoLlegada;
    }

    public void setAeropuertoLlegada(Aeropuerto aeropuertoLlegada) {
        this.aeropuertoLlegada = aeropuertoLlegada;
    }

    public Clientes getDniCliente() {
        return dniCliente;
    }

    public void setDniCliente(Clientes dniCliente) {
        this.dniCliente = dniCliente;
    }

    public Aviones getCodAvion() {
        return codAvion;
    }

    public void setCodAvion(Aviones codAvion) {
        this.codAvion = codAvion;
    }

}
