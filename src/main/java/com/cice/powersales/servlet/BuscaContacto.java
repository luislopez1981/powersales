/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cice.powersales.servlet;

import com.cice.powersales.dto.ContactoEncontradoDTO;
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
public class BuscaContacto extends HttpServlet {
//ContactoEncontradoDTO encontrado = new ContactoEncontradoDTO();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String tel = req.getParameter("telefono");

        resp.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = resp.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM contactos WHERE telefono = '" + tel + "'");

//            out.println("<table class=\"table\">");
//            out.println("<tr>");
//            out.println("<th> Nº CLIENTE </th>");
//            out.println("<th> NOMBRE </th>");
//            out.println("<th> APELLIDO1 </th>");
//            out.println("<th> APELLIDO2 </th>");
//            out.println("<th> TELÉFONO </th>");
//            out.println("<th> CÓDIGO POSTAL </th>");
//            out.println("<th> E-MAIL </th>");
//            out.println("</tr>");
//
//            out.println("<form>");
//
//            while (rs.next()) {
//
//                out.println("<tr>");
//                out.println("<td>" + rs.getString("idContacto") + "</td>");
//                out.println("<td>" + rs.getString("nombre") + "</td>");
//                out.println("<td>" + rs.getString("apellido1") + "</td>");
//                out.println("<td>" + rs.getString("apellido2") + "</td>");
//                out.println("<td>" + rs.getString("telefono") + "</td>");
//                out.println("<td>" + rs.getString("cp") + "</td>");
//                out.println("<td>" + rs.getString("email") + "</td>");                
//                out.println("</tr>");
//                out.println("</form>");
//                
//            encontrado.setIdEncontrado((rs.getString("idContacto")));
//                
//
//            }
//            out.println("</table>");
            req.setAttribute("busqueda", rs);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contactos.jsp");
            dispatcher.forward(req, resp);
            
            rs.close();
            st.close();
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
