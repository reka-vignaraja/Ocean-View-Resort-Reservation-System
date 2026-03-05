/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.util.List;

@WebServlet("/SearchUsersServlet")
public class SearchUsersServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Admin session check
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        String search = request.getParameter("search");
        List<User> users = userDAO.getUsers(search);

        // Set as request attribute and forward to JSP
        request.setAttribute("users", users);
        request.setAttribute("search", search);
        request.getRequestDispatcher("ManageUsers.jsp").forward(request, response);
    }
}