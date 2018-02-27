package com.cice.powersales.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class formPedido extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer idOferta = Integer.valueOf(req.getParameter("idOferta"));

        req.setAttribute("idOferta", idOferta);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/formPedido.jsp");
        dispatcher.forward(req, resp);
    }
}
