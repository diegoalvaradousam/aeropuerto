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

    
    
   public boolean login(String usuario, String clave){
        String sql="select usuario, clave from clientes where usuario =? and clave =?";
        try{
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2,clave);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                return true;
            }
            return false;
        }catch(Exception e){
            return false;
        }
        
    } 
    
    
    
    
    public boolean insert(Clientes c) {
        String sql = "INSERT INTO clientes values(?,?,?,?,?,?,?,?,?)";
        try {
            String[] generatedColumns = {"DNI"};
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, c.getDni());
            ps.setInt(2, c.getTarjetaEmbarque().getTarjetaEmbarque());
            ps.setString(3, c.getNombre());
            ps.setString(4, c.getApellido());
            ps.setString(5, c.getDireccion());
            ps.setString(6, c.getTelefono());
            ps.setString(7, c.getTarjetaCredito());
            ps.setString(8, c.getUsuario());
            ps.setString(9, c.getClave());
//            ResultSet rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                c.setDni(rs.getInt(1));
//            }
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(Clientes c) {
        String sql = "update clientes set tarjeta_embarque=?, nombre=?, apellido=?,direccion=?, telefono=?, tarjeta_credito=?, usuario=?, clave=? where DNI=?";
        try {
            String[] generatedColumns = {"DNI"};
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, c.getTarjetaEmbarque().getTarjetaEmbarque());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getApellido());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getTelefono());
            ps.setString(6, c.getTarjetaCredito());
            ps.setString(7, c.getUsuario());
            ps.setString(8, c.getClave());
            ps.setInt(9, c.getDni());

            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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
                int tarjetaEmbarqueId = rs.getInt("tarjeta_embarque");
                c.setTarjetaEmbarque(edao.findById(tarjetaEmbarqueId));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setUsuario(rs.getString("usuario"));
                c.setClave(rs.getString("clave"));
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
                c.setUsuario(rs.getString("usuario"));
                c.setClave(rs.getString("clave"));
                c.setDireccion(rs.getString("direccion"));
                c.setTelefono(rs.getString("telefono"));
                c.setTarjetaCredito(rs.getString("tarjeta_credito"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    public boolean delete(int id) {
        String sql = "delete from clientes where DNI=?";
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
