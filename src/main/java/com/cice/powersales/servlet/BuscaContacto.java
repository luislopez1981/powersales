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
public class BuscaContacto extends HttpServlet {
    


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String tel = req.getParameter("telefono");  
        
        resp.setContentType( "text/html; charset=iso-8859-1" );
        
        PrintWriter out = resp.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            Statement st = connection.createStatement();
            
            ResultSet rs = st.executeQuery("SELECT * FROM contactos WHERE telefono = '"+tel+"'");
            
//            req.setAttribute("encontrados", rs);
//            req.getRequestDispatcher("/panelprincipal.jsp").forward(req, resp);

                out.println("<table style= cellspacing=\"1\" bgcolor=\"#0099cc\">");
		out.println("<tr>");
		out.println("<td style= rowspan=\"7\" align=\"center\" bgcolor=\"#f8f8f8\"> NOMBRE </td>");			
		out.println("<td style= rowspan=\"7\" align=\"center\" bgcolor=\"#f8f8f8\"> APELLIDO1 </td>");			
		out.println("<td style= rowspan=\"7\" align=\"center\" bgcolor=\"#f8f8f8\"> APELLIDO2 </td>");			
		out.println("</tr>");
                
                while(rs.next()){
                    String nombre = rs.getString("nombre");
                    String apellido1 = rs.getString("apellido1");
                    String apellido2 = rs.getString("apellido2");
                    
                out.println("<tr>");
			out.println("<td style= rowspan=\"7\" align=\"center\" bgcolor=\"#f8f8f8\">"+nombre+"</td>");			
			out.println("<td style= rowspan=\"7\" align=\"center\" bgcolor=\"#f8f8f8\">"+apellido1+"</td>");			
			out.println("<td style= rowspan=\"7\" align=\"center\" bgcolor=\"#f8f8f8\">"+apellido2+"</td>");			
			
			out.println("</tr>");
		}
		out.println("</table>");
                
                
                
               
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
