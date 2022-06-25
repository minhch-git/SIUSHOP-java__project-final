package com.siushop.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancelOrderServlet", value = "/cancel-order-address")
public class CancelOrderAddressServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if(productId != null && productId != "") {
            request.getSession().removeAttribute("productId");
        }
        System.out.println("productId in cancel"+productId);
        response.sendRedirect("my-order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
