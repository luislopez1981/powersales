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

public class Oferta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idOferta = req.getParameter("idOferta");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();
            ResultSet busqueda = st.executeQuery("SELECT * FROM ofertas,contactos,vehiculos where ofertas.idContacto=contactos.idContacto AND ofertas.idVehiculo=vehiculos.idVehiculo AND idOferta='" + idOferta + "'");

            req.setAttribute("busqueda", busqueda);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Oferta.jsp");
            dispatcher.forward(req, resp);

            busqueda.close();
            st.close();
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
