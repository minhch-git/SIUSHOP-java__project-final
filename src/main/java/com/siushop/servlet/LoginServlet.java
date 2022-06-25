package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.User;
import com.siushop.services.AuthService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private AuthService authService;

    @Override
    public void init() throws ServletException {
        this.authService = new AuthService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            PrintWriter out = response.getWriter();
            User user = this.authService.login(email, password);
            if(user != null) {
                request.getSession().setAttribute("auth", user);
                response.sendRedirect("home");
            }else {
                request.setAttribute("error", "Incorrect email or password!");
                out.println("User loggedIn failure!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
