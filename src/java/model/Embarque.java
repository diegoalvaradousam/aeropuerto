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
    private String clase;

    public Embarque() {
    }

    public Embarque(int tarjetaEmbarque, int asiento,String clase) {
        this.tarjetaEmbarque = tarjetaEmbarque;
        this.asiento = asiento;
        this.clase=clase;
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

    public String getClase() {
        return clase;
    }

    public void setClase(String clase) {
        this.clase = clase;
    }
}
