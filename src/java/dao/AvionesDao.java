package dao;

import Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Aeropuerto;
import model.Aviones;

public class AvionesDao {

    Conexion conn = new Conexion();
    AeropuertoDao adao = new AeropuertoDao();

    public boolean insert(Aviones a) {
        String sql = "INSERT INTO aviones values(?,?,?)";
        try {

            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setInt(2, a.getNum_plazas());
            ps.setInt(3, a.getCod_aeropuerto().getCodAeropuerto());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(Aviones a) {
        String sql = "update aviones set num_plazas=?, Cod_aeropuerto=? where Cod_avion=?";
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, a.getNum_plazas());
            ps.setInt(2, a.getCod_aeropuerto().getCodAeropuerto());
            ps.setInt(3, a.getCodAvion());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Aviones> findAll() {
        String sql = "select * from aviones";
        List<Aviones> aList = new ArrayList<>();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Aviones a = new Aviones();
                a.setCodAvion(rs.getInt("Cod_avion"));
                a.setNum_plazas(rs.getInt("num_plazas"));
                int aeroId = rs.getInt("Cod_aeropuerto");
                a.setCod_aeropuerto(adao.findById(aeroId));
                aList.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return aList;
    }

    public Aviones findById(int id) {
        String sql = "select * from aviones where Cod_avion=?";
        Aviones a = new Aviones();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a.setCodAvion(rs.getInt("Cod_avion"));
                a.setNum_plazas(rs.getInt("num_plazas"));
                int aeroId = rs.getInt("Cod_aeropuerto");
                a.setCod_aeropuerto(adao.findById(aeroId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }

    public boolean delete(int id) {
        String sql = "delete from aviones where Cod_avion=?";
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
