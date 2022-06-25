package com.siushop.services;

import com.siushop.model.Order;
import com.siushop.utils.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    private String INSERT_SQL = "INSERT INTO orders(product_id, user_id, quantity, total_price, province, district, ward, address) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
    private String SELECT_ALL_SQL = "SELECT * FROM orders;";
    private String SELECT_ALL_BY_USER_ID_SQL = "SELECT * FROM orders WHERE user_id = ?;";
    private String SELECT_BY_ID_SQL = "SELECT  * FROM orders WHERE id=?";
    private String UPDATE_SQL = "UPDATE orders SET product_id=?, user_id=?, quantity=?, total_price=?, province=?, district=?, ward=?, address=?  WHERE id=?;";
    private String DELETE_SQL = "DELETE FROM orders WHERE id=?;";

    private Connection conn;
    private Statement st;
    private PreparedStatement pt;
    private ResultSet rs;
    private boolean rowUpdated = false;
    private boolean rowDeleted=false;

    public void create(Order order) throws SQLException {
        conn = new Database().getConnection();
        pt = conn.prepareStatement(INSERT_SQL);

        pt.setInt(1, order.getProductId());
        pt.setInt(2, order.getUserId());
        pt.setInt(3, order.getQuantity());
        pt.setFloat(4, order.getTotalPrice());
        pt.setString(5, order.getProvince());
        pt.setString(6, order.getDistrict());
        pt.setString(7, order.getWard());
        pt.setString(8, order.getAddress());

        pt.executeUpdate();
    }

    public List<Order> getAll() throws SQLException {
        ArrayList<Order> orders = new ArrayList<>();

        conn = new Database().getConnection();
        st = conn.createStatement();

        rs = st.executeQuery(this.SELECT_ALL_SQL);
        while (rs.next())
        {
            int id = rs.getInt("id");
            int productId = rs.getInt("product_id");
            int userId = rs.getInt("user_id");
            int quantity = rs.getInt("quantity")  ;
            float totalPrice = rs.getFloat("total_price")  ;
            Date createdAt = rs.getDate("created_at");
            String province = rs.getString("province");
            String district = rs.getString("district");
            String ward = rs.getString("ward");
            String address = rs.getString("address");

            orders.add(new Order(id, productId, userId, quantity, createdAt, totalPrice, district, province, ward, address));
        }

        st.close();
        return orders;
    }

    public Order getById(int id) throws SQLException{
        Order order = null;

        conn = new Database().getConnection();
        pt = conn.prepareStatement(SELECT_BY_ID_SQL);

        pt.setInt(1, id);

        rs = pt.executeQuery();

        while (rs.next()) {
            int productId = rs.getInt("product_id");
            int userId = rs.getInt("user_id");
            int quantity = rs.getInt("quantity")  ;
            float totalPrice = rs.getFloat("total_price")  ;
            Date createdAt = rs.getDate("created_at");
            String province = rs.getString("province");
            String district = rs.getString("district");
            String ward = rs.getString("ward");
            String address = rs.getString("address");

            order = new Order(id, productId, userId, quantity, createdAt, totalPrice, district, province, ward, address);
        }

        return order;
    }

    public List<Order> getAllByUserId(int userId) throws SQLException {
        ArrayList<Order> orders = new ArrayList<>();

        conn = new Database().getConnection();
        pt = conn.prepareStatement(SELECT_ALL_BY_USER_ID_SQL);

        pt.setInt(1, userId);

        rs = pt.executeQuery();
        while (rs.next())
        {
            int id = rs.getInt("id");
            int productId = rs.getInt("product_id");
            int quantity = rs.getInt("quantity")  ;
            float totalPrice = rs.getFloat("total_price")  ;
            Date createdAt = rs.getDate("created_at");
            String province = rs.getString("province");
            String district = rs.getString("district");
            String ward = rs.getString("ward");
            String address = rs.getString("address");

            orders.add(new Order(id, productId, userId, quantity, createdAt, totalPrice, district, province, ward, address));
        }

        return orders;
    }

    public boolean delete(int orderId) throws SQLException {
        rowDeleted = false;
        conn = new Database().getConnection();
        pt = conn.prepareStatement(DELETE_SQL);

        pt.setInt(1, orderId);

        rowDeleted = pt.executeUpdate() > 0;

        return rowDeleted;
    }
}
