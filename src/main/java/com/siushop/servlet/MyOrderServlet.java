package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.Order;
import com.siushop.model.User;
import com.siushop.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MyOrderServlet", value = "/my-order")
public class MyOrderServlet extends HttpServlet {

    private OrderService orderService;

    @Override
    public void init() { this.orderService = new OrderService();}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check logged in
        User user = (User) request.getSession().getAttribute("auth");
        if(user == null) {
            response.sendRedirect("login");
            return;
        }

        // GET CART
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        try {
            List<Order> orders = orderService.getAllByUserId(user.getId());

            request.setAttribute("orders", orders);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        RequestDispatcher dispatcher = request.getRequestDispatcher("me/order.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
