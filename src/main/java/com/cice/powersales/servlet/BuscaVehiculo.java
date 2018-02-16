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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NYL
 */
public class BuscaVehiculo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        String matri = req.getParameter("matricula");
        
        resp.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = resp.getWriter();
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");
            
            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM vehiculos WHERE matricula = '" + matri + "'");
            
            out.println("<table class=\"table\">");
            out.println("<tr>");
            out.println("<th> Nº STOCK </th>");
            out.println("<th> MATRICULA </th>");
            out.println("<th> MARCA </th>");
            out.println("<th> MODELO </th>");
            out.println("<th> VERSION </th>");
            out.println("<th> MOTOR </th>");
            out.println("<th> POTENCIA </th>");
            out.println("<th> COMBUSTIBLE </th>");
            out.println("<th> COLOR </th>");
            out.println("<th> FECHA 1ª MATRICULACIÓN </th>");
            out.println("<th> KILOMETRAJE </th>");
            out.println("<th> PRECIO </th>");
            out.println("<th>  </th>");
            out.println("</tr>");
            
            out.println("<form>");

            while (rs.next()) {

                out.println("<tr>");
                out.println("<td>" + rs.getString("idVehiculo") + "</td>");
                out.println("<td>" + rs.getString("matricula") + "</td>");
                out.println("<td>" + rs.getString("marca")+ "</td>");
                out.println("<td>" + rs.getString("modelo") + "</td>");
                out.println("<td>" + rs.getString("version") + "</td>");
                out.println("<td>" + rs.getString("motor") + "</td>");
                out.println("<td>" + rs.getString("potencia") + "</td>");
                out.println("<td>" + rs.getString("combustible") + "</td>");
                out.println("<td>" + rs.getString("color") + "</td>");
                out.println("<td>" + rs.getString("fechamatricula") + "</td>");
                out.println("<td>" + rs.getString("kilometraje") + "</td>");
                out.println("<td>" + rs.getString("precio") + "</td>");
                out.println("<td><input type=\"checkbox\" name=\"contacto\" value=\"contacto\"></td>");
                out.println("</tr>");
                out.println("</form>");

            }
            out.println("</table>");
            out.println("<input type=\"submit\" value=\"Seleccionar\">");

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
