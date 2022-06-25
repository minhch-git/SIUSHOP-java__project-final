package com.siushop.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    public Connection getConnection(){
        Connection connection = null;
        try {
            String db_url = "jdbc:mysql://localhost:3306/snowshop?useSSL=false";
            String username="minhchiu";
            String password = "Minhchiu.it.01";
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(db_url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return connection;
    }
}
