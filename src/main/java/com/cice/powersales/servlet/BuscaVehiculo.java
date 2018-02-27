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

            ResultSet rs = st.executeQuery("SELECT *,date_format (fechamatricula, '%d/%m/%Y') as fechaFormat FROM vehiculos WHERE matricula = '" + matri + "'");

            out.println("<table class=\"table table-bordered\">");

            while (rs.next()) {

                out.println("<tr>");
                out.println("<th> Nº STOCK </th>");
                out.println("<td>" + rs.getString("idVehiculo") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> MATRICULA </th>");
                out.println("<td>" + rs.getString("matricula") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> MARCA </th>");
                out.println("<td>" + rs.getString("marca") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> MODELO </th>");
                out.println("<td>" + rs.getString("modelo") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> VERSION </th>");
                out.println("<td>" + rs.getString("version") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> MOTOR </th>");
                out.println("<td>" + rs.getString("motor") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> POTENCIA </th>");
                out.println("<td>" + rs.getString("potencia") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> COMBUSTIBLE </th>");
                out.println("<td>" + rs.getString("combustible") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> COLOR </th>");
                out.println("<td>" + rs.getString("color") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> FECHA 1ª MATRICULACIÓN </th>");
                out.println("<td>" + rs.getString("fechaFormat") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> KILOMETRAJE </th>");
                out.println("<td>" + rs.getString("kilometraje") + "</td>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<th> PRECIO </th>");
                out.println("<td>" + rs.getString("precio") + "</td>");
                out.println("</tr>");

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
