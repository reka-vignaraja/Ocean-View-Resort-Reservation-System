package com.oceanview.controller; 
import com.oceanview.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;



@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Admin session check
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String idStr = request.getParameter("id");
        if(idStr != null){
            try {
                int id = Integer.parseInt(idStr);
                boolean deleted = userDAO.deleteUser(id);
                if(deleted){
                    response.sendRedirect("manageUsers.jsp?msg=User+deleted+successfully");
                } else {
                    response.sendRedirect("manageUsers.jsp?msg=Error+deleting+user");
                }
            } catch(NumberFormatException e){
                response.sendRedirect("manageUsers.jsp?msg=Invalid+user+ID");
            }
        } else {
            response.sendRedirect("manageUsers.jsp?msg=User+ID+missing");
        }
    }
}