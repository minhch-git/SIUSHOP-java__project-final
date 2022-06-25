package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.Order;
import com.siushop.model.Product;
import com.siushop.model.User;
import com.siushop.services.OrderService;
import com.siushop.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderNowServlet", value = "/order-now")
public class OrderNowServlet extends HttpServlet {
    private ProductService productService;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if(productId != null) {

            request.setAttribute("productId", productId);
            request.setAttribute("quantity", 1);

            RequestDispatcher dispatcher = request.getRequestDispatcher("order-address.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Require login
        User user = (User) request.getSession().getAttribute("auth");
        if(user == null) {
            response.sendRedirect("login");
            return;
        }
        int userId = user.getId();
        String productId = request.getParameter("productId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String address = request.getParameter("address");
        System.out.println(productId +" - " + quantity);
        if(productId != null) {
            try {
                Product product  = productService.getById(Integer.parseInt(productId));
                float totalPrice = product.getPrice() * quantity;

                Order order = new Order(product.getId(), userId,  quantity, totalPrice, district, province, ward, address);

                orderService.create(order);
                request.getSession().removeAttribute("productId");

                response.sendRedirect("my-order");

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        }


    }
}
