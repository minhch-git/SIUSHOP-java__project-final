package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.Product;
import com.siushop.services.ProductService;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "homeServlet", value = "/home")
public class HomeServlet extends HttpServlet {

    private ProductService productService;

    public void init() {
        productService = new ProductService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Cart header
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        try {
            List<Product> list  = this.productService.getAll();

            request.setAttribute("products", list);

            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

}