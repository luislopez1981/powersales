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

        String telefono = req.getParameter("telefono");

        resp.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = resp.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM ofertas,contactos,vehiculos where ofertas.idContacto=contactos.idContacto AND ofertas.idVehiculo=vehiculos.idVehiculo AND telefono='" + telefono + "'");

//            out.println("<table class=\"table\">");
//            out.println("<tr>");
//            out.println("<th>  </th>");
//            out.println("<th> NOMBRE </th>");
//            out.println("<th> 1ER APELLIDO </th>");
//            out.println("<th> 2DO APELLIDO </th>");
//            out.println("<th> FECHA </th>");
//            out.println("<th> MARCA </th>");
//            out.println("<th> MODELO </th>");
//            out.println("<th> PRECIO </th>");
//            out.println("</tr>");
//
//            out.println("<form action=\"./Oferta\" method=\"POST\" id=\"idOferta\">");
//
//            while (rs.next()) {
//
//                out.println("<tr>");
//                out.println("<td><input type=\"radio\" name =\"25\"></td>");
//                out.println("<td>" + rs.getString("nombre") + "</td>");
//                out.println("<td>" + rs.getString("apellido1") + "</td>");
//                out.println("<td>" + rs.getString("apellido2") + "</td>");
//                out.println("<td>" + rs.getString("fecha") + "</td>");
//                out.println("<td>" + rs.getString("marca") + "</td>");
//                out.println("<td>" + rs.getString("modelo") + "</td>");
//                out.println("<td>" + rs.getString("precioFinal") + "</td>");
//                out.println("</label>");
//
//                out.println("</tr>");
//
//            }
//            out.println("<input type=\"submit\" value=\"Seleccionar\">");
//            out.println("</form>");
//            out.println("</table>");
            req.setAttribute("busqueda", rs);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Oferta.jsp");
            dispatcher.forward(req, resp);
            rs.close();
            st.close();
            connection.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BuscaVehiculo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BuscaVehiculo.class.getName()).log(Level.SEVERE, null, ex);
        }

//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");
//
//            Statement st = connection.createStatement();
//            ResultSet busqueda = st.executeQuery("SELECT * FROM ofertas,contactos,vehiculos where ofertas.idContacto=contactos.idContacto AND ofertas.idVehiculo=vehiculos.idVehiculo AND telefono='" + buscaoferta + "'");
//
//            req.setAttribute("busqueda", busqueda);            
//            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/panelprincipal.jsp");
//            dispatcher.forward(req, resp);
//            
//
//            busqueda.close();
//            st.close();
//            connection.close();
//
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

}
