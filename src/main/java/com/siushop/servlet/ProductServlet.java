package com.siushop.servlet;

import com.siushop.model.Cart;
import com.siushop.model.Product;
import com.siushop.services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "productServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private ProductService productService;

    public void init() {
        productService = new ProductService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Cart> cast_list = (ArrayList<Cart>) request.getSession().getAttribute("carts");
        request.setAttribute("carts", cast_list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        List<Product> list = this.productService.getAll();
        System.out.println("call");
        for(int i=0;i<list.size();i++){
            System.out.println(list.get(i));
        }
        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");

        dispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("products/create.jsp");
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product isExist = this.productService.getById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
        request.setAttribute("product", isExist);
        dispatcher.forward(request, response);
    }

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String title = request.getParameter("title");
        Float price = Float.valueOf(request.getParameter("price"));
        int createdBy = Integer.parseInt(request.getParameter("created_by"));
        boolean isExclusive = Integer.parseInt(request.getParameter("isExclusive")) == 1;
        String image = request.getParameter("image");
        Float promotionPrice = Float.valueOf(request.getParameter("promotion_price"));

        Product product = new Product(title, price, createdBy, isExclusive, image, promotionPrice);
        this.productService.create(product);

        response.sendRedirect("list");
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        Float price = Float.valueOf(request.getParameter("price"));
        int createdBy = Integer.parseInt(request.getParameter("created_by"));
        boolean isExclusive = Integer.parseInt(request.getParameter("isExclusive")) == 1;
        String image = request.getParameter("image");
        Float promotionPrice = Float.valueOf(request.getParameter("promotion_price"));

        Product product = new Product(id, title, price, createdBy, isExclusive, image, promotionPrice);
        this.productService.update(product);

        response.sendRedirect("list");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        this.productService.delete(id);

        response.sendRedirect("list");

    }

    public void destroy() {
    }
}