package dao;

import Conexion.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import model.Aviones;
import model.ReservaVuelo;

public class ReservaVueloDao {

    Conexion conn = new Conexion();
    AeropuertoDao adao = new AeropuertoDao();
    ClientesDao cdao = new ClientesDao();
    AvionesDao avdao = new AvionesDao();

    public boolean insert(ReservaVuelo r) {
        String sql = "INSERT INTO reserva_vuelo values(?,?,?,?,?,?,?)";
        try {
            String[] generatedColumns = {"Cod_reserva"};
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setDate(2, Date.valueOf(r.getFechaSalida()));
            ps.setDate(3, Date.valueOf(r.getFechaLlegada()));
            ps.setInt(4, r.getAeropuertoLlegada().getCodArepuerto());
            ps.setInt(5, r.getAeropuertoSalida().getCodArepuerto());
            ps.setInt(6, r.getDniCliente().getDni());
            ps.setInt(7, r.getCodAvion().getCodAvion());
            ps.executeUpdate();
//            if (rs.next()) {
//                r.setCodReserva(rs.getInt(1));
//                System.out.println("INTTTTT: "+rs.getInt(1));
//            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(ReservaVuelo r) {
        String sql = "update reserva_vuelo set fehca_salida=?, fecha_llegada=?, aeropuerto_llegada=?, DNI_cliente=?, cod_avion=? where Cod_reserva=?";
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setDate(1, Date.valueOf(r.getFechaSalida()));
            ps.setDate(2, Date.valueOf(r.getFechaLlegada()));
            ps.setInt(3, r.getAeropuertoLlegada().getCodArepuerto());
            ps.setInt(4, r.getAeropuertoSalida().getCodArepuerto());
            ps.setInt(5, r.getDniCliente().getDni());
            ps.setInt(6, r.getCodAvion().getCodAvion());
            ps.setInt(7, r.getCodReserva());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<ReservaVuelo> findAll() {
        String sql = "select * from reserva_vuelo";
        List<ReservaVuelo> rList = new ArrayList<>();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReservaVuelo r = new ReservaVuelo();
                r.setCodReserva(rs.getInt("Cod_reserva"));
                r.setFechaSalida(rs.getDate("fecha_salida").toString());
                r.setFechaLlegada(rs.getDate("fecha_llegada").toString());
                int aeroSalida = rs.getInt("aeropuerto_salida");
                r.setAeropuertoSalida(adao.findById(aeroSalida));

                int aeroLlegada = rs.getInt("aeropuerto_llegada");
                r.setAeropuertoLlegada(adao.findById(aeroLlegada));

                int dni = rs.getInt("DNI_cliente");
                r.setDniCliente(cdao.findById(dni));

                int codAvion = rs.getInt("cod_avion");
                r.setCodAvion(avdao.findById(codAvion));

                rList.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rList;
    }

    public ReservaVuelo findById(int id) {
        String sql = "select * from reserva_vuelo where Cod_reserva=?";
        ReservaVuelo r = new ReservaVuelo();
        try {
            PreparedStatement ps = conn.conectar().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                r.setCodReserva(rs.getInt("Cod_reserva"));
                r.setFechaSalida(rs.getDate("fecha_salida").toString());
                r.setFechaLlegada(rs.getDate("fecha_llegada").toString());
                int aeroSalida = rs.getInt("aeropuerto_salida");
                r.setAeropuertoSalida(adao.findById(aeroSalida));

                int aeroLlegada = rs.getInt("aeropuerto_llegada");
                r.setAeropuertoLlegada(adao.findById(aeroLlegada));

                int dni = rs.getInt("DNI_cliente");
                r.setDniCliente(cdao.findById(dni));

                int codAvion = rs.getInt("cod_avion");
                r.setCodAvion(avdao.findById(codAvion));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    public boolean delete(int id) {
        String sql = "delete from reserva_vuelo where Cod_reserva=?";
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
