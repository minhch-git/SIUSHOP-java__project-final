package com.siushop.servlet;

import com.siushop.model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
