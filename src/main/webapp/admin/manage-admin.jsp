<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.reliable.school.model.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");

    if (admin == null) {
        response.sendRedirect(
            request.getContextPath() + "/admin/admin-login.jsp"
        );
        return;
    }

    if (!"SUPER_ADMIN".equals(admin.getRole())) {
        response.sendError(
            HttpServletResponse.SC_FORBIDDEN,
            "Access Denied"
        );
        return;
    }

    List<Admin> admins =
        (List<Admin>) request.getAttribute("admins");

    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Management - Modern Life Public School</title>

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
            padding: 35px;
        }

        .header {
            margin-bottom: 25px;
        }

        .header h1 {
            color: #333;
        }

        .table-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            overflow-x: auto;
            margin-bottom: 25px;
        }

        .form-title {
            color: #1e3a8a;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(200px, 1fr));
            gap: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #333;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #1e3a8a;
        }

        .create-btn {
            background: #16a34a;
            color: white;
            border: none;
            padding: 11px 18px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            width: 100%;
        }

        .create-btn:hover {
            background: #15803d;
        }

        .message {
            padding: 12px 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .success {
            background: #dcfce7;
            color: #166534;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #1e3a8a;
            color: white;
            padding: 13px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #ddd;
        }

        .active {
            color: green;
            font-weight: bold;
        }

        .inactive {
            color: red;
            font-weight: bold;
        }

        .btn {
            padding: 7px 12px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            margin-right: 5px;
            display: inline-block;
        }

        .activate {
            background: #16a34a;
        }

        .deactivate {
            background: #f59e0b;
        }

        .delete {
            background: #dc2626;
        }

        .self {
            color: #555;
            font-size: 14px;
            font-weight: bold;
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="school-name">
        Modern Life Public School
    </div>

    <a href="<%= request.getContextPath() %>/admin/dashboard.jsp"
       class="back">
        ← Dashboard
    </a>

</div>


<!-- MAIN -->

<div class="container">

    <div class="header">

        <h1>
            Admin Management
        </h1>

    </div>


    <!-- SUCCESS MESSAGE -->

    <% if ("created".equals(success)) { %>

        <div class="message success">

            Admin created successfully.

        </div>

    <% } %>


    <!-- USERNAME ERROR -->

    <% if ("usernameExists".equals(error)) { %>

        <div class="message error">

            Username already exists. Please use another username.

        </div>

    <% } %>


    <!-- EMAIL ERROR -->

    <% if ("emailExists".equals(error)) { %>

        <div class="message error">

            Email already exists. Please use another email.

        </div>

    <% } %>


    <!-- INVALID ERROR -->

    <% if ("invalid".equals(error)) { %>

        <div class="message error">

            Please enter valid admin details.

        </div>

    <% } %>


    <!-- ADD ADMIN -->

    <div class="table-box">

        <h2 class="form-title">
            Add New Admin
        </h2>


        <form action="<%= request.getContextPath() %>/admin-management"
              method="post">

            <input type="hidden"
                   name="action"
                   value="create">


            <div class="form-grid">


                <!-- USERNAME -->

                <div class="form-group">

                    <label>
                        Username
                    </label>

                    <input type="text"
                           name="username"
                           placeholder="Enter username"
                           minlength="3"
                           maxlength="50"
                           required>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>
                        Email
                    </label>

                    <input type="email"
                           name="email"
                           placeholder="Enter email"
                           maxlength="100"
                           required>

                </div>


                <!-- PASSWORD -->

                <div class="form-group">

                    <label>
                        Password
                    </label>

                    <input type="password"
                           name="password"
                           placeholder="Minimum 8 characters"
                           minlength="8"
                           maxlength="100"
                           required>

                </div>


                <!-- ROLE -->

                <div class="form-group">

                    <label>
                        Role
                    </label>

                    <select name="role" required>

                        <option value="ADMIN">
                            ADMIN
                        </option>

                        <option value="SUPER_ADMIN">
                            SUPER_ADMIN
                        </option>

                    </select>

                </div>


                <!-- CREATE BUTTON -->

                <div class="form-group">

                    <label>
                        &nbsp;
                    </label>

                    <button type="submit"
                            class="create-btn">

                        + Create Admin

                    </button>

                </div>

            </div>

        </form>

    </div>


    <!-- ADMIN LIST -->

    <div class="table-box">

        <h2 class="form-title">
            All Administrators
        </h2>


        <table>

            <thead>

                <tr>

                    <th>ID</th>

                    <th>Username</th>

                    <th>Email</th>

                    <th>Role</th>

                    <th>Status</th>

                    <th>Action</th>

                </tr>

            </thead>


            <tbody>


            <% if (admins != null && !admins.isEmpty()) { %>


                <% for (Admin a : admins) { %>

                    <tr>


                        <td>
                            <%= a.getId() %>
                        </td>


                        <td>
                            <%= a.getUsername() %>
                        </td>


                        <td>
                            <%= a.getEmail() %>
                        </td>


                        <td>
                            <%= a.getRole() %>
                        </td>


                        <td>

                            <% if ("ACTIVE".equalsIgnoreCase(a.getStatus())) { %>

                                <span class="active">
                                    ACTIVE
                                </span>

                            <% } else { %>

                                <span class="inactive">
                                    INACTIVE
                                </span>

                            <% } %>

                        </td>


                        <td>


                            <% if (a.getId() == admin.getId()) { %>

                                <span class="self">
                                    Current Admin
                                </span>


                            <% } else { %>


                                <% if ("ACTIVE".equalsIgnoreCase(a.getStatus())) { %>

                                    <a href="<%= request.getContextPath() %>/admin-management?action=deactivate&id=<%= a.getId() %>"
                                       class="btn deactivate">

                                        Deactivate

                                    </a>

                                <% } else { %>

                                    <a href="<%= request.getContextPath() %>/admin-management?action=activate&id=<%= a.getId() %>"
                                       class="btn activate">

                                        Activate

                                    </a>

                                <% } %>


                                <a href="<%= request.getContextPath() %>/admin-management?action=delete&id=<%= a.getId() %>"
                                   class="btn delete"
                                   onclick="return confirm('Are you sure you want to delete this admin?');">

                                    Delete

                                </a>


                            <% } %>


                        </td>

                    </tr>

                <% } %>


            <% } else { %>


                <tr>

                    <td colspan="6"
                        style="text-align:center;">

                        No admins found.

                    </td>

                </tr>


            <% } %>


            </tbody>

        </table>

    </div>

</div>

</body>

</html>