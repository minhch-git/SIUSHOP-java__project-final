package com.siushop.servlet;

import com.siushop.model.User;
import com.siushop.services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "userServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private UserService userService;

    public void init() {
        userService = new UserService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if(action != null) {
            try {
                switch (action) {
                    case "edit":
                        showEditForm(request, response);
                        break;

                    case "delete":
                        deleteUser(request, response);
                        break;
                    default:
                        listUser(request, response);
                        break;
                }
            } catch (SQLException ex) {
                throw new ServletException(ex);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dateOfBirth = request.getParameter("dateOfBirth");
        boolean isAdmin = Integer.parseInt(request.getParameter("isAdmin"))  == 1;

        User user = new User(id, name, email, password, dateOfBirth, isAdmin);
        try {
            this.userService.updateUser(user);
            response.sendRedirect("users?action=getAll");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        List<User> listUser = this.userService.getUsers();

        request.setAttribute("users", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("users/list.jsp");

        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = this.userService.getUserById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("users/user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        this.userService.deleteUser(id);

        response.sendRedirect("users?action=getAll");
    }

}