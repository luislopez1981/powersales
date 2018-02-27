package com.cice.powersales.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreaContacto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String usuario = "root";
        String pass = "root";
        String driver = "com.mysql.jdbc.Driver";
        String host = "jdbc:mysql://localhost:8889/powersales";

        String nombre = req.getParameter("nombre");
        String apellido1 = req.getParameter("apellido1");
        String apellido2 = req.getParameter("apellido2");
        String telefono = req.getParameter("telefono");
        String cp = req.getParameter("cp");
        String email = req.getParameter("email");

        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(host, usuario, pass);

            String SQL = "INSERT INTO contactos (nombre, apellido1, apellido2, telefono, cp, email) VALUES ('" + nombre + "', '" + apellido1 + "', '" + apellido2 + "', '" + telefono + "', '" + cp + "', '" + email + "')";

            Statement st = connection.createStatement();
            st.execute(SQL);

            st.close();
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        resp.sendRedirect("./contactos.jsp");
    }
}
