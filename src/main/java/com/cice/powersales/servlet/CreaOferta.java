/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cice.powersales.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        String fecha = req.getParameter("fecha");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            String SQL = "INSERT INTO ofertas (contactoId, vehiculoId, precioFinal, comentario, fecha) VALUES ('" + contactoId + "', '" + vehiculoId + "', '" + precioFinal + "', '" + comentario + "', '" + fecha + "')";

            Statement st = connection.createStatement();
            st.execute(SQL);

            st.close();
            connection.close();

            resp.sendRedirect("./CreaOferta.jsp");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
