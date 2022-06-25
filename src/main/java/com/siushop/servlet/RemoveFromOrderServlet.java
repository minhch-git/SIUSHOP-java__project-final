package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "RemoveFromOrderServlet", value = "/remove-from-order")
public class RemoveFromOrderServlet extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if(id != null) {
            try {
                this.orderService.delete(Integer.parseInt(id));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        response.sendRedirect("my-order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
