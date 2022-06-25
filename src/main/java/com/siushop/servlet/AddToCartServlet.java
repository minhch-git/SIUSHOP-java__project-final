package com.siushop.servlet;

import com.siushop.model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> cartList = new ArrayList<>();
        int id = Integer.parseInt(request.getParameter("id"));

        Cart cart = new Cart();
        cart.setId(id);
        cart.setQuantity(1);

        HttpSession session = request.getSession();
        List<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("carts");

        if(cart_list == null) {
            cartList.add(cart);
        }else {
            cartList = cart_list;
            boolean exist = false;

            for (Cart c:cartList ) {
                if(c.getId() == id) {
                    exist = true;
                }
            }

            if(!exist) {
                cartList.add(cart);
            }
        }

        session.setAttribute("carts", cartList);
        response.sendRedirect("product-details?id="+id);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
