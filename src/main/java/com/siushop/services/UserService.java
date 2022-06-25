package com.siushop.services;

import com.siushop.model.User;
import com.siushop.utils.Database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    private String INSERT_SQL = "INSERT INTO snowshop.users (name, email, password, date_of_birth) VALUES (?,?,?,?);";
    private String SELECT_ALL_SQL = "SELECT * FROM snowshop.users;";
    private String SELECT_BY_ID_SQL = "SELECT  * FROM snowshop.users WHERE id=?";
    private String UPDATE_SQL = "UPDATE snowshop.users SET name=? , email=?, password=?, date_of_birth=?, is_admin=? WHERE id=?;";
    private String DELETE_SQL = "DELETE FROM snowshop.users WHERE id=?;";

    private Connection getConnection(){
        return new Database().getConnection();
    }

    public void createUser(User user) throws SQLException {
        Connection conn = this.getConnection();
        PreparedStatement preparedStatement = conn.prepareStatement(INSERT_SQL);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getPassword());
        preparedStatement.setString(4, user.getDateOfBirth());

        System.out.println(preparedStatement);
        preparedStatement.executeUpdate();
    }

    public List<User> getUsers() throws SQLException {
        Connection conn  = this.getConnection();
        ArrayList<User> users = new ArrayList<>();

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(this.SELECT_ALL_SQL);
        while (rs.next())
        {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String password = rs.getString("email");
            String dateOfBirth = rs.getString("date_of_birth");
            boolean isAdmin = rs.getInt("is_admin") == 1;

            users.add(new User(id, name, email, password, dateOfBirth, isAdmin));
        }

        st.close();
        return users;
    }

    public User getUserById(int userId) throws SQLException{
        User user = null;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID_SQL);
        preparedStatement.setInt(1, userId);
        System.out.println(preparedStatement);

        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
            String password = rs.getString("email");
            String dateOfBirth = rs.getString("date_of_birth");
            boolean isAdmin = rs.getInt("is_admin") == 1;

            user = new User(userId, name, email, password, dateOfBirth, isAdmin);
        }

        return user;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated = false;
        Connection conn = getConnection();
        PreparedStatement statement = conn.prepareStatement(UPDATE_SQL);

        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getPassword());
        statement.setString(4, user.getDateOfBirth());
        statement.setInt(5, user.isAdmin() ? 1 : 0);
        statement.setInt(6, user.getId());

        rowUpdated = statement.executeUpdate() > 0;

        return rowUpdated;
    }

    public boolean deleteUser(int userId) throws SQLException {
        boolean rowDeleted = false;
        Connection conn = getConnection();
        PreparedStatement statement = conn.prepareStatement(DELETE_SQL);

        statement.setInt(1, userId);

        rowDeleted = statement.executeUpdate() > 0;

        return rowDeleted;
    }
}
