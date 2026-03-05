package com.oceanview.controller; 

import com.oceanview.dao.UserDAO;
import com.oceanview.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Admin session check
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        // Get form data
        String idStr = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User user = new User();
        user.setFullname(fullname);
        user.setUsername(username);
        user.setEmail(email);
        user.setRole(role);

        boolean success = false;

        if(idStr != null && !idStr.isEmpty()){ 
            // Edit existing user
            int id = Integer.parseInt(idStr);
            user.setId(id);
            success = userDAO.updateUser(user, password); // DAO method to update
        } else { 
            // Add new user
            success = userDAO.addUser(user, password); // DAO method to insert
        }

        if(success){
            response.sendRedirect("ManageUsers.jsp?msg=User+saved+successfully");
        } else {
            response.sendRedirect("ManageUsers.jsp?msg=Error+saving+user");
        }
    }
}