package model;

public class Aeropuerto {

    private Integer codArepuerto;
    private String nombreAerpuerto;
    private String localidad;
    private String pais;
    public Aeropuerto() {
    }

    public Aeropuerto(Integer codArepuerto, String nombreAerpuerto, String localidad, String pais) {
        this.codArepuerto = codArepuerto;
        this.nombreAerpuerto = nombreAerpuerto;
        this.localidad = localidad;
        this.pais = pais;
    }

    public Integer getCodArepuerto() {
        return codArepuerto;
    }

    public void setCodArepuerto(Integer codArepuerto) {
        this.codArepuerto = codArepuerto;
    }

    public String getNombreAerpuerto() {
        return nombreAerpuerto;
    }

    public void setNombreAerpuerto(String nombreAerpuerto) {
        this.nombreAerpuerto = nombreAerpuerto;
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
