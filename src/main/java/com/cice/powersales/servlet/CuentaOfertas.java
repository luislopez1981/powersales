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
public class CuentaOfertas extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        
        
        resp.setContentType("text/html; charset=iso-8859-1");
        PrintWriter out = resp.getWriter();
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");
            
            Statement st = connection.createStatement();

            ResultSet rs = st.executeQuery("SELECT COUNT(*) AS TOTAL FROM ofertas WHERE month(fecha)=month(curdate());");
            
            out.println("<table class=\"table\">");
            out.println("<tr>");
            out.println("<th>OFERTAS GENERADAS ESTE MES</th>");
            out.println("</tr>");
            
            

            while (rs.next()) {

                out.println("<tr>");
                out.println("<td>" + rs.getString("TOTAL") + "</td>");
                out.println("</tr>");
                out.println("</form>");

            }
            out.println("</table>");
            

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
