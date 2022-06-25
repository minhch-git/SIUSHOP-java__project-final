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

@WebServlet(name = "OrderServlet", value = "/orders")
public class OrderServlet extends HttpServlet {
    private ProductService productService;
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
        this.orderService = new OrderService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("my-order");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Require login
        User user = (User) request.getSession().getAttribute("auth");
        if(user == null) {
            response.sendRedirect("login");
            return;
        }

        List<Cart> carts = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        int userId = user.getId();
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String address = request.getParameter("address");

        if(carts != null) {
            for (Cart cart:carts) {
                try {
                    Product product = productService.getById(cart.getId());
                    float totalPrice = product.getPrice() * cart.getQuantity();

                    Order order = new Order(product.getId(), userId, cart.getQuantity(), totalPrice, district, province, ward, address);

                    orderService.create(order);

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            request.getSession().removeAttribute("carts");
            response.sendRedirect("orders");
        }
    }
}
