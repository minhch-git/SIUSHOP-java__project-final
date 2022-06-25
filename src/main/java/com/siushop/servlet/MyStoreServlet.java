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

@WebServlet(name = "MyStoreServlet", value = "/my-store")
public class MyStoreServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        try {
            List<Product> products  = this.productService.getAll();

            for (Product prod: products ) {
                System.out.println(prod.toString());
                System.out.println(prod.getPromotionPrice());
            }

            request.setAttribute("products", products);

            RequestDispatcher dispatcher = request.getRequestDispatcher("me/store.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
