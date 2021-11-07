/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author jorgi
 */
public class Embarque {

    private int tarjetaEmbarque;
    private int asiento;
    private String columna;
    private int planta;

    public Embarque() {
    }

    public Embarque(int tarjetaEmbarque, int asiento, String columna, int planta) {
        this.tarjetaEmbarque = tarjetaEmbarque;
        this.asiento = asiento;
        this.columna = columna;
        this.planta = planta;
    }

    public int getTarjetaEmbarque() {
        return tarjetaEmbarque;
    }

    public void setTarjetaEmbarque(int tarjetaEmbarque) {
        this.tarjetaEmbarque = tarjetaEmbarque;
    }

    public int getAsiento() {
        return asiento;
    }

    public void setAsiento(int asiento) {
        this.asiento = asiento;
    }

    public String getColumna() {
        return columna;
    }

    public void setColumna(String columna) {
        this.columna = columna;
    }

    public int getPlanta() {
        return planta;
    }

    public void setPlanta(int planta) {
        this.planta = planta;
    }

}
