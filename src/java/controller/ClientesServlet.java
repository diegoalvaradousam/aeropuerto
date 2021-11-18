/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Conexion.Conexion;
import dao.AeropuertoDao;
import dao.AvionesDao;
import dao.ClientesDao;
import dao.EmbarqueDao;
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
import javax.servlet.http.HttpSession;
import model.Aeropuerto;
import model.Aviones;
import model.Clientes;
import model.Embarque;
import model.ReservaVuelo;

/**
 *
 * @author jorgi
 */
public class ClientesServlet extends HttpServlet {

    String msg;
    boolean respuesta;
    Conexion conn = new Conexion();
    ReservaVueloDao reservad = new ReservaVueloDao();
    RequestDispatcher rd;
    List<Clientes> lista = new ArrayList<>();
    AeropuertoDao adao = new AeropuertoDao();
    ClientesDao cdao = new ClientesDao();
    AvionesDao avdao = new AvionesDao();
    EmbarqueDao edao = new EmbarqueDao();

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
                findById(request, response);
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
            case "viewCliente":
                viewCliente(request, response);
                break;
            case "viewAvion":
                viewAvion(request, response);
                break;
            case "viewEmbarque":
                viewEmbarque(request, response);
                break;
            case "login": login (request, response);
            case "logout": logout(request, response);
        }

    }
    
    
     protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");
        
        respuesta  = cdao.login(usuario, clave);
        
                if (respuesta){
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario",usuario);
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                    request.getRequestDispatcher("/clientes.jsp").forward(request, response);
                    
                     request.getRequestDispatcher("/aeropuerto.jsp").forward(request, response);
                     request.getRequestDispatcher("/aviones.jsp").forward(request, response);
                     request.getRequestDispatcher("/reserva.jsp").forward(request, response);
                     request.getRequestDispatcher("/tarjeta.jsp").forward(request, response);
                }else{
                    msg ="usuario o clave incorrecta";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    
                }
                
    }
    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    
    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int dni= Integer.parseInt(request.getParameter("DNI"));
        int tarjetaEmbarque = Integer.parseInt(request.getParameter("tarjeta_embarque"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String tarjeta_credito = request.getParameter("tarjeta_credito");
        
        Clientes c= new Clientes();
        c.setDni(dni);
        
        Embarque em= new  Embarque();
        em.setTarjetaEmbarque(tarjetaEmbarque);
        c.setTarjetaEmbarque(em);
        
        c.setNombre(nombre);
        c.setApellido(apellido);
        c.setDireccion(direccion);
        c.setTelefono(telefono);
        c.setTarjetaCredito(tarjeta_credito);
        if (cdao.insert(c)) {
            System.out.println("Si inserta");
            msg = "Reserva Guardada Exitosamente";
        } else {
            System.out.println("No insertar");
            msg = "No se Pudo Guardar La Reserva";
        }
        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/clientes?action=mostrar");
        rd.forward(request, response);

    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        lista = cdao.findAll();
        System.out.println("SIZEEEE: " + lista.size());
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-clientes/clientes.jsp");
        rd.forward(request, response);
    }

    protected void findById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        Clientes rv = cdao.findById(id);
        lista = new ArrayList<>();
        lista.add(rv);
        System.out.println("FIND BY UID CLIENTE: "+lista.size());
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-clientes/edit-clientes.jsp");
        rd.forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      int dni= Integer.parseInt(request.getParameter("DNI"));
        int tarjetaEmbarque = Integer.parseInt(request.getParameter("tarjeta_embarque"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String tarjeta_credito = request.getParameter("tarjeta_credito");
        
        Clientes c= new Clientes();
        c.setDni(dni);
        
        Embarque em= new  Embarque();
        em.setTarjetaEmbarque(tarjetaEmbarque);
        c.setTarjetaEmbarque(em);
        
        c.setNombre(nombre);
        c.setApellido(apellido);
        c.setDireccion(direccion);
        c.setTelefono(telefono);
        c.setTarjetaCredito(tarjeta_credito);
        if (cdao.update(c)) {
            System.out.println("Si inserta");
            msg = "Reserva Guardada Exitosamente";
        } else {
            System.out.println("No insertar");
            msg = "No se Pudo Guardar La Reserva";
        }
        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/clientes?action=mostrar");
        rd.forward(request, response);


    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int Cod_reserva = Integer.parseInt(request.getParameter("id"));
        respuesta = cdao.delete(Cod_reserva);
        if (respuesta) {
            msg = "La Reserva se Borro Exitosamente";
        } else {
            msg = "No se Pudo Borrar La Reserva";
        }
        lista = cdao.findAll();
        request.setAttribute("msg", msg);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/clientes?action=mostrar");
        rd.forward(request, response);
    }

    protected void vieWAirport(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Aeropuerto> alist = adao.findAll();
        String html = "";
        for (Aeropuerto a : alist) {
            html += "<option value='" + a.getCodAeropuerto()+ "'>" + a.getCodAeropuerto()+ " ---- " + a.getNombreAeropuerto()+ "</option>";
        }
        PrintWriter out = response.getWriter();
        out.print(html);
        out.flush();
        out.close();
    }

    protected void viewCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Clientes> clist = cdao.findAll();
        String html = "";
        for (Clientes c : clist) {
            html += "<option value='" + c.getDni() + "'>" + c.getDni() + " ---- " + c.getNombre() + "</option>";
        }
        PrintWriter out = response.getWriter();
        out.print(html);
        out.flush();
        out.close();
    }

    protected void viewAvion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Aviones> alist = avdao.findAll();
        String html = "";
        for (Aviones a : alist) {
            html += "<option value='" + a.getCodAvion() + "'>" + a.getCodAvion() + "</option>";
        }
        PrintWriter out = response.getWriter();
        out.print(html);
        out.flush();
        out.close();
    }

    protected void viewEmbarque(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Embarque> alist = edao.findAll();
        String html = "";
        for (Embarque a : alist) {
            html += "<option value='" + a.getTarjetaEmbarque() + "'>" + a.getTarjetaEmbarque() + "</option>";
        }
        PrintWriter out = response.getWriter();
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
