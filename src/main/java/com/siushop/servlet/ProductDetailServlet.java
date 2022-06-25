package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.Product;
import com.siushop.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductDetailServlet", value = "/product-details")
public class ProductDetailServlet extends HttpServlet {
    private ProductService productService;

    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productService.getById(id);
            List<Product> products = productService.getAll();

            request.setAttribute("product", product);
            request.setAttribute("products", products);

            RequestDispatcher dispatcher = request.getRequestDispatcher("products/details.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
