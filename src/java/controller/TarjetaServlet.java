package controller;

import Conexion.Conexion;

import dao.EmbarqueDao;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Embarque;

public class TarjetaServlet extends HttpServlet {

    String msg;
    boolean respuesta;
    Conexion conn = new Conexion();
    EmbarqueDao embarqued = new EmbarqueDao();
    RequestDispatcher rd;
    List<Embarque> lista = new ArrayList<>();

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

        }
    }

    protected void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int asiento = Integer.parseInt(request.getParameter("asiento"));
        String columna = request.getParameter("columna");
        int planta = Integer.parseInt(request.getParameter("planta"));
        Embarque embarque = new Embarque();
        embarque.setTarjetaEmbarque(0);
        embarque.setAsiento(asiento);
        embarque.setColumna(columna);
        embarque.setPlanta(planta);
        
        if (embarqued.insert(embarque) != null) {
            msg = "Tarjeta de embarque Guardado Exitosamente";
        } else {
            msg = "No se Pudo Guardar La Tarjeta";
        }
        request.setAttribute("msg", msg);
        rd = request.getRequestDispatcher("/tarjeta?action=mostrar");
        rd.forward(request, response);
        
    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       lista = embarqued.findAll();
        System.out.println("SIZEEEE: "+lista.size());
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-tarjeta/tarjeta.jsp");
        rd.forward(request, response);
    }

    protected void findById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int id = Integer.valueOf(request.getParameter("id"));
        Embarque eb = embarqued.findById(id);
        lista = new ArrayList<>();
        lista.add(eb);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-tarjeta/tarjeta.jsp");
        rd.forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int tarjeta_embarque =Integer.parseInt(request.getParameter("tarjeta_embarque"));
       int asiento = Integer.parseInt(request.getParameter("asiento"));
        String columna = request.getParameter("columna");
        int planta = Integer.parseInt(request.getParameter("planta"));
        Embarque embarque = new Embarque();
        embarque.setTarjetaEmbarque(tarjeta_embarque);
        embarque.setAsiento(asiento);
        embarque.setColumna(columna);
        embarque.setPlanta(planta);
        
        
        if (embarqued.insert(embarque) != null) {
            msg = "Se Guardo Exitosamente";
        } else {
            msg = "No se Pudo Guardar";
        }
        lista = embarqued.findAll();
        request.setAttribute("msg", msg);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-tarjeta/actualizar-tarjeta.jsp");
        rd.forward(request, response);
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tarjeta_embarque = Integer.parseInt(request.getParameter("tarjeta_embarque"));
        respuesta = embarqued.delete(tarjeta_embarque);
        if (respuesta) {
            msg = "La Tarjeta se Borro Exitosamente";
        } else {
            msg = "No se Pudo Borrar La Tarjeta";
        }
        lista = embarqued.findAll();
        request.setAttribute("msg", msg);
        request.setAttribute("lista", lista);
        rd = request.getRequestDispatcher("/modulo-tarjeta/tarjeta.jsp");
        rd.forward(request, response);

        
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
