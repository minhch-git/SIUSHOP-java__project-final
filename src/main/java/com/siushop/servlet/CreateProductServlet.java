package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.Product;
import com.siushop.model.User;
import com.siushop.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateProductServlet", value = "/new-product")
public class CreateProductServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("products/create.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check logged in
        User user = (User) request.getSession().getAttribute("auth");
        if(user == null) {
            response.sendRedirect("login");
            return;
        }

        String title = request.getParameter("title");
        float price = Float.parseFloat(request.getParameter("price"));
        float promotionPrice = Float.parseFloat(request.getParameter("promotionPrice"));
        int exclusive = Integer.parseInt(request.getParameter("exclusive"));
        String image = request.getParameter("image");

        Product product = new Product(title, price, user.getId(), exclusive == 1, image,promotionPrice);

        try {
            productService.create(product);

            response.sendRedirect("my-store");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
