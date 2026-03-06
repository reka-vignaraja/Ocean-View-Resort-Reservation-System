package com.oceanview.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con = null;

    private static final String URL = "jdbc:mysql://localhost:3306/hotel_reservation";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private DBConnection() {
        // prevent object creation
    }

    public static Connection getConnection() {

        try {

            if (con == null || con.isClosed()) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection(URL, USER, PASSWORD);

                System.out.println("Database Connected Successfully!");
            }

        } catch (Exception e) {
            System.out.println("Database Connection Failed!");
            e.printStackTrace();
        }

        return con;
    }
}