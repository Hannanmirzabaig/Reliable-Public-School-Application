package com.reliable.school.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String URL = getEnv(
            "DB_URL",
            "jdbc:mysql://localhost:3306/reliable_school"
    );

    private static final String USER = getEnv(
            "DB_USER",
            "root"
    );

    private static final String PASSWORD = getEnv(
            "DB_PASSWORD",
            "root"
    );

    private static String getEnv(String key, String defaultValue) {
        String value = System.getenv(key);

        if (value == null || value.isBlank()) {
            return defaultValue;
        }

        return value;
    }

    public static Connection getConnection() {

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("Database Connected Successfully");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }
}

