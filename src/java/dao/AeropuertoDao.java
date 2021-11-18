package dao;

import Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Aeropuerto;

public class AeropuertoDao {

    Conexion conn = new Conexion();

    public boolean insert(Aeropuerto a) {
        String sql = "INSERT INTO aeropuerto values(?,?,?,?)";
        try {
            String[] generatedColumns = {"Cod_aeropuerto"};
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setString(2, a.getNombreAeropuerto());
            ps.setString(3, a.getLocalidad());
            ps.setString(4, a.getPais());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(Aeropuerto a) {
        String sql = "update aeropuerto set nombre_aeropuerto=?, localidad=?, pais=? where Cod_aeropuerto=?";
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setString(1, a.getNombreAeropuerto());
            ps.setString(2, a.getLocalidad());
            ps.setString(3, a.getPais());
            ps.setInt(4, a.getCodAeropuerto());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Aeropuerto> findAll() {
        String sql = "select * from aeropuerto";
        List<Aeropuerto> aeroList = new ArrayList<>();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Aeropuerto a = new Aeropuerto();
                a.setCodAeropuerto(rs.getInt("Cod_aeropuerto"));
                a.setNombreAeropuerto(rs.getString("nombre_aeropuerto"));
                a.setLocalidad(rs.getString("localidad"));
                a.setPais(rs.getString("pais"));
                aeroList.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aeroList;
    }

    public Aeropuerto findById(int id) {
        String sql = "select * from aeropuerto where Cod_aeropuerto=?";
        Aeropuerto a = new Aeropuerto();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                a.setCodAeropuerto(rs.getInt("Cod_aeropuerto"));
                a.setNombreAeropuerto(rs.getString("nombre_aeropuerto"));
                a.setLocalidad(rs.getString("localidad"));
                a.setPais(rs.getString("pais"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    public boolean delete(int id){
    String sql= "delete from aeropuerto where Cod_aeropuerto=?";
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
