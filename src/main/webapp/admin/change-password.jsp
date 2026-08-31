<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.reliable.school.model.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");

    if (admin == null) {
        response.sendRedirect(
            request.getContextPath() + "/admin/admin-login.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Change Password - Modern Life Public School</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        .navbar {
            height: 65px;
            background: #1e3a8a;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
        }

        .school-name {
            font-size: 22px;
            font-weight: bold;
        }

        .back {
            color: white;
            text-decoration: none;
            background: #162d6b;
            padding: 9px 15px;
            border-radius: 5px;
        }

        .container {
            width: 420px;
            max-width: 90%;
            margin: 60px auto;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        h1 {
            color: #1e3a8a;
            margin-bottom: 25px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 11px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #1e3a8a;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #162d6b;
        }

        .error {
            color: #dc2626;
            margin-bottom: 15px;
            text-align: center;
        }

        .success {
            color: green;
            margin-bottom: 15px;
            text-align: center;
        }

    </style>

</head>

<body>

    <div class="navbar">

        <div class="school-name">
            Modern Life Public School
        </div>

        <a href="<%= request.getContextPath() %>/admin/dashboard.jsp"
           class="back">
            ← Dashboard
        </a>

    </div>


    <div class="container">

        <div class="box">

            <h1>Change Password</h1>

            <% if ("wrong".equals(request.getParameter("error"))) { %>

                <div class="error">
                    Current password is incorrect.
                </div>

            <% } %>


            <% if ("mismatch".equals(request.getParameter("error"))) { %>

                <div class="error">
                    New passwords do not match.
                </div>

            <% } %>


            <% if ("success".equals(request.getParameter("success"))) { %>

                <div class="success">
                    Password changed successfully.
                </div>

            <% } %>


            <form method="post"
                  action="<%= request.getContextPath() %>/admin">

                <input type="hidden"
                       name="action"
                       value="changePassword">


                <label>
                    Current Password
                </label>

                <input type="password"
                       name="currentPassword"
                       required>


                <label>
                    New Password
                </label>

                <input type="password"
                       name="newPassword"
                       required
                       minlength="8">


                <label>
                    Confirm New Password
                </label>

                <input type="password"
                       name="confirmPassword"
                       required
                       minlength="8">


                <button type="submit">
                    Change Password
                </button>

            </form>

        </div>

    </div>

</body>

</html>
