package model;

public class Aeropuerto {

    private Integer codAeropuerto;
    private String nombreAeropuerto;
    private String localidad;
    private String pais;
    public Aeropuerto() {
    }

    public Aeropuerto(Integer codArepuerto, String nombreAerpuerto, String localidad, String pais) {
        this.codAeropuerto = codArepuerto;
        this.nombreAeropuerto = nombreAerpuerto;
        this.localidad = localidad;
        this.pais = pais;
    }

    public Integer getCodAeropuerto() {
        return codAeropuerto;
    }

    public void setCodAeropuerto(Integer codArepuerto) {
        this.codAeropuerto = codArepuerto;
    }

    public String getNombreAeropuerto() {
        return nombreAeropuerto;
    }

    public void setNombreAeropuerto(String nombreAerpuerto) {
        this.nombreAeropuerto = nombreAerpuerto;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

}
