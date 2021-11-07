package model;

public class Aviones {

    private int codAvion;
    private int num_plazas;
    private Aeropuerto cod_aeropuerto;

    public Aviones() {
    }

    public Aviones(int codAvion, int num_plazas, Aeropuerto cod_aeropuerto) {
        this.codAvion = codAvion;
        this.num_plazas = num_plazas;
        this.cod_aeropuerto = cod_aeropuerto;
    }

    public int getCodAvion() {
        return codAvion;
    }

    public void setCodAvion(int codAvion) {
        this.codAvion = codAvion;
    }

    public int getNum_plazas() {
        return num_plazas;
    }

    public void setNum_plazas(int num_plazas) {
        this.num_plazas = num_plazas;
    }

    public Aeropuerto getCod_aeropuerto() {
        return cod_aeropuerto;
    }

    public void setCod_aeropuerto(Aeropuerto cod_aeropuerto) {
        this.cod_aeropuerto = cod_aeropuerto;
    }
}
