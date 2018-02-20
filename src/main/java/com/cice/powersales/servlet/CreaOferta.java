/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author NYL
 */
public class CreaOferta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer contactoId = Integer.valueOf(req.getParameter("contactoId"));

        Integer vehiculoId = Integer.valueOf(req.getParameter("vehiculoId"));

        Integer precioFinal = Integer.parseInt(req.getParameter("precioFinal"));

        String comentario = req.getParameter("comentario");
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            String SQL = "INSERT INTO ofertas (idContacto, idVehiculo, precioFinal, comentario) VALUES ('" + contactoId + "', '" + vehiculoId + "', '" + precioFinal + "', '" + comentario + "')";

            Statement st = connection.createStatement();
            st.execute(SQL);

            st.close();
            connection.close();

            

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
                try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery("SELECT * , date_format (fecha, '%d/%m/%Y') as fechaFormat FROM ofertas INNER join contactos inner join vehiculos where ofertas.idContacto=contactos.idContacto AND ofertas.idVehiculo=vehiculos.idVehiculo ORDER BY idOferta desc limit 1");

            req.setAttribute("busqueda", rs);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OfertaPresentada.jsp");
            dispatcher.forward(req, resp);
            rs.close();
            st.close();
            connection.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuscaVehiculo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BuscaVehiculo.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
