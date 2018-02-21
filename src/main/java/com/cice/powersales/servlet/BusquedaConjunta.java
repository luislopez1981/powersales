package com.cice.powersales.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BusquedaConjunta extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String matricula = req.getParameter("matricula");
        String tel = req.getParameter("telefono");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();
            ResultSet busqueda = st.executeQuery("SELECT * FROM contactos WHERE telefono = '" + tel + "'");
            Statement st2 = connection.createStatement();
            ResultSet busqueda2 = st2.executeQuery("SELECT * FROM vehiculos WHERE matricula = '" + matricula + "'");

            req.setAttribute("busqueda", busqueda);
            req.setAttribute("busqueda2", busqueda2);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CreaOferta.jsp");
            dispatcher.forward(req, resp);

            busqueda.close();
            busqueda2.close();
            st.close();
            st2.close();
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
