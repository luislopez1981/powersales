/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cice.powersales.servlet;

import com.sun.rowset.CachedRowSetImpl;
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
import javax.sql.rowset.CachedRowSet;

/**
 *
 * @author NYL
 */
public class BuscaCliente extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String tel = req.getParameter("telefono");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();
            ResultSet busqueda = st.executeQuery("SELECT * FROM contactos WHERE telefono = '" + tel + "'");
            
            
            req.setAttribute("busqueda", busqueda);            
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CreaOferta.jsp");
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
