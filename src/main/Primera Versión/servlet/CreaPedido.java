package com.cice.powersales.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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

public class CreaPedido extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer idOferta = Integer.valueOf(req.getParameter("idOferta"));
        Integer idContacto = Integer.valueOf(req.getParameter("idContacto"));

        String senal = req.getParameter("senal");
        String fechaEntrega = req.getParameter("fechaEntrega");
        String financiado = req.getParameter("financiado");
        String tasacion = req.getParameter("tasacion");
        String dni = req.getParameter("dni");
        String calle = req.getParameter("calle");
        String piso = req.getParameter("piso");
        String municipio = req.getParameter("municipio");
        String provincia = req.getParameter("provincia");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/powersales", "root", "root");

            String SQL1 = "INSERT INTO pedidos (idOferta, senal, financiado, tasacion, fechaEntrega) VALUES ('" + idOferta + "', '" + senal + "', '" + financiado + "', '" + tasacion + "','" + fechaEntrega + "')";
            String SQL2 = "UPDATE contactos SET dni = '" + dni + "' where idContacto = '" + idContacto + "'";
            String SQL3 = "UPDATE contactos SET calle = '" + calle + "'where idContacto = '" + idContacto + "'";
            String SQL4 = "UPDATE contactos SET piso = '" + piso + "'where idContacto = '" + idContacto + "'";
            String SQL5 = "UPDATE contactos SET municipio = '" + municipio + "'where idContacto = '" + idContacto + "'";
            String SQL6 = "UPDATE contactos SET provincia = '" + provincia + "'where idContacto = '" + idContacto + "'";

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

            ResultSet rs = st.executeQuery("SELECT *, date_format (fechaPedido, '%d/%m/%Y') as fechaFormat FROM pedidos INNER JOIN OFERTAS INNER JOIN VEHICULOS INNER JOIN CONTACTOS where ofertas.idContacto=contactos.idContacto AND ofertas.idVehiculo=vehiculos.idVehiculo AND pedidos.idOferta = ofertas.idOferta ORDER BY idPedido desc limit 1");

            req.setAttribute("busqueda", rs);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PedidoPresentado.jsp");
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
