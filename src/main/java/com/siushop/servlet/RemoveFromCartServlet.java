package com.siushop.servlet;

import com.siushop.model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RemoveFromCartServlet", value = "/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if(id != null) {
            List<Cart> carts = (List<Cart>) request.getSession().getAttribute("carts");
            if(carts != null) {
                for (Cart cart: carts) {
                    if(cart.getId() == Integer.parseInt(id)) {
                        carts.remove(carts.indexOf(cart));
                        break;
                    }
                }
            }
        }
        response.sendRedirect("cart-list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
