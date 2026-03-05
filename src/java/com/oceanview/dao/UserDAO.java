package com.oceanview.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.oceanview.model.User;
import com.oceanview.util.DBConnection;

public class UserDAO {

    // Fetch users with optional search (name, username, or email)
    public List<User> getUsers(String search) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        if(search != null && !search.trim().isEmpty()){
            sql += " WHERE fullname LIKE ? OR username LIKE ? OR email LIKE ?";
        }
        sql += " ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            if(search != null && !search.trim().isEmpty()){
                pst.setString(1, "%" + search + "%");
                pst.setString(2, "%" + search + "%");
                pst.setString(3, "%" + search + "%");
            }

            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setCreatedAt(rs.getString("created_at"));
                users.add(u);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        return users;
    }

    // Add new user
    public boolean addUser(User user, String password){
        String sql = "INSERT INTO users(fullname, username, email, password, role, created_at) VALUES(?,?,?,?,?,NOW())";
        try(Connection con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql)){

            pst.setString(1, user.getFullname());
            pst.setString(2, user.getUsername());
            pst.setString(3, user.getEmail());
            pst.setString(4, password);
            pst.setString(5, user.getRole());

            int rows = pst.executeUpdate();
            return rows > 0;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    // Update existing user
    public boolean updateUser(User user, String password){
        String sql;
        boolean updatePassword = password != null && !password.trim().isEmpty();

        if(updatePassword){
            sql = "UPDATE users SET fullname=?, username=?, email=?, password=?, role=? WHERE id=?";
        } else {
            sql = "UPDATE users SET fullname=?, username=?, email=?, role=? WHERE id=?";
        }

        try(Connection con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql)){

            pst.setString(1, user.getFullname());
            pst.setString(2, user.getUsername());
            pst.setString(3, user.getEmail());

            if(updatePassword){
                pst.setString(4, password);
                pst.setString(5, user.getRole());
                pst.setInt(6, user.getId());
            } else {
                pst.setString(4, user.getRole());
                pst.setInt(5, user.getId());
            }

            int rows = pst.executeUpdate();
            return rows > 0;

        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    // Delete user by ID
    public boolean deleteUser(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {

            pst.setInt(1, id);
            int rows = pst.executeUpdate();
            return rows > 0;

        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}