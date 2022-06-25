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

@WebServlet(name = "CartServlet", value = "/cart-list")
public class CartServlet extends HttpServlet {
    private ProductService productService;

    @Override
    public void init(){ this.productService = new ProductService(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cart> carts = new ArrayList<>();
        List<Cart> cast_list = (ArrayList<Cart>) session.getAttribute("carts");
        double totalPrice = 0;

        if(cast_list != null && cast_list.size() > 0) {
            for (Cart item : cast_list) {
                try {
                    Product product = productService.getById(item.getId());
                    Cart cart = new Cart(product.getId(), product.getTitle(), product.getPrice(), product.getCreatedBy(), product.isExclusive(), product.getImage(), product.getPromotionPrice(), item.getQuantity());

                    totalPrice += product.getPrice() * item.getQuantity();
                    carts.add(cart);

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }

        request.setAttribute("carts", carts);
        request.setAttribute("totalPrice", totalPrice);

        RequestDispatcher dispatcher = request.getRequestDispatcher("cart/cart-list.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
