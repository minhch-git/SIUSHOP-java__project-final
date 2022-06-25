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

@WebServlet(name = "SearchProductServlet", value = "/search-product")
public class SearchProductServlet extends HttpServlet {
    private ProductService productService;

    public void init() {
        productService = new ProductService();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Cart header
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        String search = request.getParameter("search");

        if(search != null) {
            try {
                List<Product> list = this.productService.getByTitle(search);

                request.setAttribute("productsSearched", list);
                request.setAttribute("search", search);

                RequestDispatcher dispatcher = request.getRequestDispatcher("products-searched.jsp");
                dispatcher.forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
