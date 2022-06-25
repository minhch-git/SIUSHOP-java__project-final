package com.siushop.servlet;

import com.siushop.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RemoveProductServlet", value = "/remove-product")
public class RemoveProductServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if(id != null) {
            try {
                this.productService.delete(Integer.parseInt(id));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        response.sendRedirect("my-store");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
