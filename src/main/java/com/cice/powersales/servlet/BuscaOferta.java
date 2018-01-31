/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cice.powersales.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
public class BuscaOferta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String buscaoferta = req.getParameter("buscaoferta");
        String idContacto = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();
            ResultSet busqueda = st.executeQuery("SELECT * FROM contactos WHERE telefono = '" + buscaoferta + "'");

            req.setAttribute("busqueda", busqueda);            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/panelprincipal.jsp");
            dispatcher.forward(req, resp);
            idContacto = busqueda.getString("idContacto");

            busqueda.close();
            st.close();
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection2 = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st2 = connection2.createStatement();
            ResultSet busqueda2 = st2.executeQuery("SELECT * FROM ofertas WHERE contactoId = '" + idContacto + "'");

            req.setAttribute("busqueda2", busqueda2);            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/panelprincipal.jsp");
            dispatcher.forward(req, resp);
            busqueda2.close();
            st2.close();
            connection2.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
