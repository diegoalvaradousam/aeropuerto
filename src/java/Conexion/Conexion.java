/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author jorgi
 */
public class Conexion {

    private static String user = "root";
    private static String pass = "";
    private static String db = "vuelos";
    private static String url = "jdbc:mysql://localhost:3306/" + db;

    private Connection conn = null;

    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, pass);
            if (conn != null) {
                System.out.println("Conexion Exitosa!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al conectar :c  " + e);
        }
    }

    public Connection conectar() {
        return conn;
    }

    public void desconectar() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }
}
