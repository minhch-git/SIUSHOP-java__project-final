package com.siushop.servlet;

import com.siushop.model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuantityIncDecServlet", value = "/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        List<Cart> carts = (List<Cart>) request.getSession().getAttribute("carts");

        if(action != null && id >= 1) {
            if(action.equals("inc")) {
                for (Cart cart:carts) {
                    if(cart.getId() == id) {
                        int quantity = cart.getQuantity();
                        quantity++;
                        cart.setQuantity(quantity);
                        response.sendRedirect("cart-list");
                        return;
                    }
                }
            }

            if(action.equals("dec")) {
                for (Cart cart:carts) {
                    if(cart.getId() == id && cart.getQuantity() > 1) {
                        int quantity = cart.getQuantity();
                        quantity--;
                        cart.setQuantity(quantity);
                        break;
                    }
                }
                response.sendRedirect("cart-list");
                return;
            }

            response.sendRedirect("cart-list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
