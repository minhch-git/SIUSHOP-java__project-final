package com.siushop.services;

import com.siushop.model.Product;
import com.siushop.utils.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * INSERT INTO products(title, price, created_by, isExclusive, image, promotion_price) VALUES ('SIÊU DATA SIM 4G', 50000, 3, 1, 'sieu-data-sim-4g.jpg', 25000 );
 * SELECT * FROM products;
 * SELECT * FROM products WHERE id = 1;
 * UPDATE products SET title='SIÊU DATA SIM 4G', price=50000, created_by=3, isExclusive=0, image='sieu-data-sim-4g.jpg', promotion_price=25000
 * WHERE id=1;
 * DELETE FROM products WHERE id=1;
 */

public class ProductService {
    private String INSERT_SQL = "INSERT INTO products(title, price, created_by, isExclusive, image, promotion_price) VALUES (?,?,?,?,?,?);";
    private String SELECT_ALL_SQL = "SELECT * FROM products;";
    private String SELECT_BY_ID_SQL = "SELECT  * FROM products WHERE id=?";
    private String UPDATE_SQL = "UPDATE products SET title=?, price=?, created_by=?, isExclusive=?, image=?, promotion_price=? WHERE id=?;";
    private String DELETE_SQL = "DELETE FROM products WHERE id=?;";
    private String SEARCH_SQL = "SELECT * FROM products WHERE products.title LIKE ?;";

    private Connection conn;
    private Statement st;
    private PreparedStatement pt;
    private ResultSet rs;
    private boolean rowUpdated = false;
    private boolean rowDeleted=false;

    public void create(Product product) throws SQLException {
        conn = new Database().getConnection();
        pt = conn.prepareStatement(INSERT_SQL);

        pt.setString(1, product.getTitle());
        pt.setFloat(2, product.getPrice());
        pt.setInt(3, product.getCreatedBy());
        pt.setInt(4, product.isExclusive() ? 1 : 0);
        pt.setString(5, product.getImage());
        pt.setFloat(6, product.getPromotionPrice());

        pt.executeUpdate();
    }

    public List<Product> getAll() throws SQLException {
        ArrayList<Product> products = new ArrayList<>();

        conn = new Database().getConnection();
        st = conn.createStatement();

        rs = st.executeQuery(this.SELECT_ALL_SQL);
        while (rs.next())
        {
            int id = rs.getInt("id");
            String title = rs.getString("title");
            Float price = rs.getFloat("price");
            int createdBy = rs.getInt("created_by");
            boolean isExclusive = rs.getInt("isExclusive") == 1 ;
            String image = rs.getString("image");
            Float promotionPrice = rs.getFloat("promotion_price");

            products.add(new Product(id,title, price, createdBy, isExclusive, image, promotionPrice));
        }

        st.close();
        return products;
    }

    public List<Product> getByTitle(String search) throws SQLException {
        ArrayList<Product> products = new ArrayList<>();

        conn = new Database().getConnection();
        pt = conn.prepareStatement(SEARCH_SQL);

        pt.setString(1, "%" + search + "%");

        System.out.println(pt);

        rs = pt.executeQuery();

        while (rs.next())
        {
            System.out.println(rs);
            int id = rs.getInt("id");
            String title = rs.getString("title");
            Float price = rs.getFloat("price");
            int createdBy = rs.getInt("created_by");
            boolean isExclusive = rs.getInt("isExclusive") == 1 ;
            String image = rs.getString("image");
            Float promotionPrice = rs.getFloat("promotion_price");

            products.add(new Product(id,title, price, createdBy, isExclusive, image, promotionPrice));
        }

        return products;
    }


    public Product getById(int id) throws SQLException{
        Product product = null;

        conn = new Database().getConnection();
        pt = conn.prepareStatement(SELECT_BY_ID_SQL);

        pt.setInt(1, id);

        rs = pt.executeQuery();

        while (rs.next()) {
            String title = rs.getString("title");
            Float price = rs.getFloat("price");
            int createdBy = rs.getInt("created_by");
            boolean isExclusive = rs.getInt("isExclusive") == 1 ;
            String image = rs.getString("image");
            Float promotionPrice = rs.getFloat("promotion_price");

            product = new Product(id,title, price, createdBy, isExclusive, image, promotionPrice);
        }

        return product;
    }

    public boolean update(Product product) throws SQLException {
        conn = new Database().getConnection();
        pt = conn.prepareStatement(UPDATE_SQL);

        pt.setString(1, product.getTitle());
        pt.setFloat(2, product.getPrice());
        pt.setInt(3, product.getCreatedBy());
        pt.setInt(4, product.isExclusive() ? 1 : 0);
        pt.setString(5, product.getImage());
        pt.setFloat(6, product.getPromotionPrice());
        // ID
        pt.setFloat(7, product.getId());

        rowUpdated = pt.executeUpdate() > 0;

        return rowUpdated;
    }

    public boolean delete(int userId) throws SQLException {
        rowDeleted = false;
        conn = new Database().getConnection();
        pt = conn.prepareStatement(DELETE_SQL);

        pt.setInt(1, userId);

        rowDeleted = pt.executeUpdate() > 0;

        return rowDeleted;
    }
}
