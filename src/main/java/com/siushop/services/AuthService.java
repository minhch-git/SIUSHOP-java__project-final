package com.siushop.services;

import com.siushop.utils.Database;
import com.siushop.model.User;

import java.sql.*;

public class AuthService {
    private Connection getConnection(){
        return new Database().getConnection();
    }
    private String LOGIN_SQL = "SELECT * FROM users WHERE email=? and password=?;";

    public User login(String email, String password) throws SQLException {
        User user = null;

        Connection conn = this.getConnection();
        PreparedStatement preparedStatement = conn.prepareStatement(LOGIN_SQL);
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, password);

        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();

        if(rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String dateOfBirth = rs.getString("date_of_birth");
            boolean isAdmin = rs.getInt("is_admin") == 1;

            user = new User(id, name, email, password, dateOfBirth, isAdmin);
        }

        return user;
    }
}
