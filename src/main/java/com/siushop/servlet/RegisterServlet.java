package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.User;
import com.siushop.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dateOfBirth = request.getParameter("dateOfBirth");

        PrintWriter out = response.getWriter();

        User user = new User(name, email, password, dateOfBirth);

        try {
            userService.createUser(user);

            RequestDispatcher dispatcher = request.getRequestDispatcher("login");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
