package controller;

import Conexion.Conexion;
import dao.AeropuertoDao;
import dao.ReservaVueloDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Aeropuerto;
import model.Aviones;
import model.Clientes;
import model.ReservaVuelo;

public class ReservaServlet extends HttpServlet {

    String msg;
    boolean respuesta;
    Conexion conn = new Conexion();
    ReservaVueloDao reservad = new ReservaVueloDao();
    RequestDispatcher rd;
    List<ReservaVuelo> lista =new ArrayList<>();
    AeropuertoDao adao= new AeropuertoDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "insertar":
                insert(request, response);
                break;
            case "mostrar":
                findAll(request, response);
                break;
            case "mostrarById":
                findAll(request, response);
                break;

            case "actualizar":
                update(request, response);
                break;
            case "borrar":
                delete(request, response);
                break;
                case "viewAirport":
                vieWAirport(request, response);
                break;
        }

    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fechaSalida = request.getParameter("fechaSalida");
        String fechaLlegada = request.getParameter("fechaLlegada");
        int aeropuertoSalida = Integer.parseInt(request.getParameter("aeropuertoSalida"));
        int aeropuertoLlegada = Integer.parseInt(request.getParameter("aeropuertoLlegada"));
        int dniCliente = Integer.parseInt(request.getParameter("dniCliente"));
        int codAvion = Integer.parseInt(request.getParameter("codAvion"));
        ReservaVuelo reserva = new ReservaVuelo();
        reserva.setCodReserva(0);
        reserva.setFechaSalida(fechaSalida);
        reserva.setFechaLlegada(fechaLlegada);

        Aeropuerto aeroSalida = new Aeropuerto();
        aeroSalida.setCodArepuerto(aeropuertoSalida);
        reserva.setAeropuertoSalida(aeroSalida);

        Aeropuerto aeroLlegada = new Aeropuerto();
        aeroLlegada.setCodArepuerto(aeropuertoLlegada);
        reserva.setAeropuertoLlegada(aeroLlegada);

        Clientes clientes = new Clientes();
        clientes.setDni(dniCliente);
        reserva.setDniCliente(clientes);

        Aviones av = new Aviones();
        av.setCodAvion(codAvion);
        reserva.setCodAvion(av);

        if (reservad.insert(reserva) != null) {
            msg = "Reserva Guardada Exitosamente";
        } else {
            msg = "No se Pudo Guardar La Reserva";
        }
        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/modulo-reserva/añadir-reserva.jsp");
        rd.forward(request, response);

    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        lista = reservad.findAll();
        System.out.println("SIZEEEE: "+lista.size());
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-reserva/reserva.jsp");
        rd.forward(request, response);
    }

    protected void findById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        ReservaVuelo rv = reservad.findById(id);
        lista = new ArrayList<>();
        lista.add(rv);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-reserva/reserva.jsp");
        rd.forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int Cod_reserva = Integer.parseInt(request.getParameter("Cod_reserva"));
        String fechaSalida = request.getParameter("fechaSalida");
        String fechaLlegada = request.getParameter("fechaLlegada");
        int aeropuertoSalida = Integer.parseInt(request.getParameter("aeropuertoSalida"));
        int aeropuertoLlegada = Integer.parseInt(request.getParameter("aeropuertoLlegada"));
        int dniCliente = Integer.parseInt(request.getParameter("dniCliente"));
        int codAvion = Integer.parseInt(request.getParameter("codAvion"));
        ReservaVuelo reserva = new ReservaVuelo();
        reserva.setCodReserva(Cod_reserva);
        reserva.setFechaSalida(fechaSalida);
        reserva.setFechaLlegada(fechaLlegada);

        Aeropuerto aeroSalida = new Aeropuerto();
        aeroSalida.setCodArepuerto(aeropuertoSalida);
        reserva.setAeropuertoSalida(aeroSalida);

        Aeropuerto aeroLlegada = new Aeropuerto();
        aeroLlegada.setCodArepuerto(aeropuertoLlegada);
        reserva.setAeropuertoLlegada(aeroLlegada);

        Clientes clientes = new Clientes();
        clientes.setDni(dniCliente);
        reserva.setDniCliente(clientes);

        Aviones av = new Aviones();
        av.setCodAvion(codAvion);
        reserva.setCodAvion(av);

        if (reservad.insert(reserva) != null) {
            msg = "Reserva Guardada Exitosamente";
        } else {
            msg = "No se Pudo Guardar La Reserva";
        }
        lista = reservad.findAll();
        request.setAttribute("msg", msg);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-reserva/actualizar-reserva.jsp");
        rd.forward(request, response);

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int Cod_reserva = Integer.parseInt(request.getParameter("Cod_reserva"));
        respuesta = reservad.delete(Cod_reserva);
        if (respuesta) {
            msg = "La Reserva se Borro Exitosamente";
        } else {
            msg = "No se Pudo Borrar La Reserva";
        }
        lista = reservad.findAll();
        request.setAttribute("msg", msg);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-reserva/reserva.jsp");
        rd.forward(request, response);
    }
     protected void vieWAirport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Aeropuerto> alist= adao.findAll();
        String html="";
        for(Aeropuerto a:alist){
        html+="<option>"+a.getCodArepuerto()+" ---- "+a.getNombreAerpuerto()+"</option>";
        }
         PrintWriter out=response.getWriter();
         out.print(html);
         out.flush();
         out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
