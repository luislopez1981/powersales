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

public class EditarContacto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer idContacto = Integer.valueOf(req.getParameter("idContacto"));
        String nombre = req.getParameter("nombre");
        String apellido1 = req.getParameter("apellido1");
        String apellido2 = req.getParameter("apellido2");
        String telefono = req.getParameter("telefono");
        String cp = req.getParameter("cp");
        String email = req.getParameter("email");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            String SQL1 = "UPDATE  contactos SET nombre= '" + nombre + " 'where idContacto = '" + idContacto + "'";
            String SQL2 = "UPDATE  contactos SET apellido1 ='" + apellido1 + "' where idContacto = '" + idContacto + "'";
            String SQL3 = "UPDATE  contactos SET apellido2 ='" + apellido2 + "' where idContacto = '" + idContacto + "'";
            String SQL4 = "UPDATE  contactos SET telefono ='" + telefono + "' where idContacto = '" + idContacto + "'";
            String SQL5 = "UPDATE  contactos SET cp = '" + cp + "' where idContacto = '" + idContacto + "'";
            String SQL6 = "UPDATE  contactos SET email = '" + email + "' where idContacto = '" + idContacto + "'";

            Statement st = connection.createStatement();
            st.execute(SQL1);
            st.execute(SQL2);
            st.execute(SQL3);
            st.execute(SQL4);
            st.execute(SQL5);
            st.execute(SQL6);

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

            ResultSet rs = st.executeQuery("SELECT * FROM contactos WHERE idContacto = '" + idContacto + "'");

            req.setAttribute("busqueda", rs);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/contactos.jsp");
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
