/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Aeropuerto;
import model.Embarque;

/**
 *
 * @author jorgi
 */
public class EmbarqueDao {

    Conexion conn = new Conexion();

    public boolean insert(Embarque e) {
        String sql = "INSERT INTO embarque values(?,?,?)";
        try {
            String[] generatedColumns = {"tarjeta_embarque"};
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, e.getTarjetaEmbarque());
            ps.setInt(2, e.getAsiento());
            ps.setString(3, e.getClase());
            //ps.setInt(4, e.getPlanta());
//            ResultSet rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                e.setTarjetaEmbarque(rs.getInt(1));
//            }
            ps.executeUpdate();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean update(Embarque e) {
        String sql = "update embarque set asiento=?, clase=? where tarjeta_embarque=?";
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, e.getAsiento());
            ps.setString(2, e.getClase());
            //ps.setInt(3, e.getPlanta());
            ps.setInt(3, e.getTarjetaEmbarque());
            ps.executeUpdate();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public List<Embarque> findAll() {
        String sql = "select * from embarque";
        List<Embarque> eList = new ArrayList<>();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Embarque a = new Embarque();
                a.setTarjetaEmbarque(rs.getInt("tarjeta_embarque"));
                a.setAsiento(rs.getInt("asiento"));
                a.setClase(rs.getString("clase"));
                //a.setPlanta(rs.getInt("planta"));
                eList.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return eList;
    }

    public Embarque findById(int id) {
        String sql = "select * from embarque where tarjeta_embarque=?";
        Embarque a = new Embarque();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a.setTarjetaEmbarque(rs.getInt("tarjeta_embarque"));
                a.setAsiento(rs.getInt("asiento"));
                a.setClase(rs.getString("clase"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }

    public boolean delete(int id) {
        String sql = "delete from embarque where tarjeta_embarque=?";
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
