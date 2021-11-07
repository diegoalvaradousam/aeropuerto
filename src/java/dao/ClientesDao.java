package dao;

import Conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Aeropuerto;
import model.Clientes;

public class ClientesDao {

    Conexion conn = new Conexion();
    EmbarqueDao edao = new EmbarqueDao();

    public Clientes insert(Clientes c) {
        String sql = "INSERT INTO clientes values(?,?,?,?,?,?,?)";
        try {
            String[] generatedColumns = {"DNI"};
            PreparedStatement ps = conn.conectar().prepareStatement(sql, generatedColumns);
            ps.setInt(1, 1);
            ps.setInt(2, c.getTarjetaEmbarque().getTarjetaEmbarque());
            ps.setString(3, c.getNombre());
            ps.setString(4, c.getApellido());
            ps.setString(5, c.getDireccion());
            ps.setString(6, c.getTelefono());
            ps.setString(7, c.getTarjetaCredito());
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                c.setDni(rs.getInt(1));
            }
            return c;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Clientes update(Clientes c) {
        String sql = "update clientes set tarjeta_embarque=?, nombre=?, apellido=?,direccion=?, telefono=?, tarjeta_credito=? where Cod_aeropuerto=?";
        try {
            String[] generatedColumns = {"DNI"};
            PreparedStatement ps = conn.conectar().prepareStatement(sql, generatedColumns);
            ps.setInt(1, c.getTarjetaEmbarque().getTarjetaEmbarque());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getApellido());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getTelefono());
            ps.setString(6, c.getTarjetaCredito());
            ps.setInt(6, c.getDni());
            ResultSet rs = ps.getGeneratedKeys();
            ps.executeUpdate();
            return c;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Clientes> findAll() {
        String sql = "select * from clientes";
        List<Clientes> cList = new ArrayList<>();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Clientes c = new Clientes();
                c.setDni(rs.getInt("DNI"));
                int tarjetaEmbarqueId = rs.getInt("tarjeta__embarque");
                c.setTarjetaEmbarque(edao.findById(tarjetaEmbarqueId));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setDireccion(rs.getString("direccion"));
                c.setTelefono(rs.getString("telefono"));
                c.setTarjetaCredito(rs.getString("tarjeta_credito"));
                cList.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cList;
    }

    public Clientes findById(int id) {
        String sql = "select * from clientes where DNI=?";
        Clientes c = new Clientes();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c.setDni(rs.getInt("DNI"));
                int tarjetaEmbarqueId = rs.getInt("tarjeta_embarque");
                c.setTarjetaEmbarque(edao.findById(tarjetaEmbarqueId));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setDireccion(rs.getString("direccion"));
                c.setTelefono(rs.getString("telefono"));
                c.setTarjetaCredito(rs.getString("tarjeta_credito"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }
    public boolean delete(int id){
    String sql= "delete from clientes where DNI=?";
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
