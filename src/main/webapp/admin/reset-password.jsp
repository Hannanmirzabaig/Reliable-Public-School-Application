<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Reset Password - Modern Life Public School</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .reset-container {
            width: 400px;
            background: white;

            padding: 40px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.12);
        }

        .logo {
            text-align: center;
            margin-bottom: 25px;
        }

        .logo h1 {
            color: #1e3a8a;
            font-size: 27px;
            margin-bottom: 8px;
        }

        .logo p {
            color: #777;
            font-size: 14px;
        }

        .title {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            margin-bottom: 7px;

            color: #444;

            font-weight: bold;
        }

        .form-group input {
            width: 100%;

            padding: 12px;

            border: 1px solid #ddd;

            border-radius: 7px;

            font-size: 15px;

            outline: none;
        }

        .form-group input:focus {
            border-color: #1e3a8a;
        }

        .reset-btn {
            width: 100%;

            padding: 13px;

            background: #1e3a8a;

            color: white;

            border: none;

            border-radius: 7px;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;
        }

        .reset-btn:hover {
            background: #162d6b;
        }

        .error {
            background: #fee2e2;

            color: #b91c1c;

            padding: 10px;

            border-radius: 6px;

            margin-bottom: 15px;

            text-align: center;

            font-size: 14px;
        }

        .back {
            text-align: center;

            margin-top: 20px;
        }

        .back a {
            color: #1e3a8a;

            text-decoration: none;

            font-size: 14px;
        }

        .back a:hover {
            text-decoration: underline;
        }

        @media (max-width: 500px) {

            .reset-container {
                width: 90%;

                padding: 30px 25px;
            }
        }

    </style>

</head>

<body>

    <div class="reset-container">

        <div class="logo">

            <h1>Modern Life Public School</h1>

            <p>School Management System</p>

        </div>


        <h2 class="title">
            Reset Password
        </h2>


        <% if ("short".equals(request.getParameter("error"))) { %>

            <div class="error">
                Password must be at least 8 characters long.
            </div>

        <% } %>


        <% if ("mismatch".equals(request.getParameter("error"))) { %>

            <div class="error">
                Passwords do not match.
            </div>

        <% } %>


        <form
            action="<%= request.getContextPath() %>/admin"
            method="post"
        >

            <!-- Tell AdminServlet this is reset password -->
            <input
                type="hidden"
                name="action"
                value="resetPassword"
            >

            <!-- Token received from email link -->
            <input
                type="hidden"
                name="token"
                value="<%= request.getAttribute("token") %>"
            >


            <div class="form-group">

                <label>
                    New Password
                </label>

                <input
                    type="password"
                    name="newPassword"
                    placeholder="Enter new password"
                    minlength="8"
                    required
                >

            </div>


            <div class="form-group">

                <label>
                    Confirm Password
                </label>

                <input
                    type="password"
                    name="confirmPassword"
                    placeholder="Confirm new password"
                    minlength="8"
                    required
                >

            </div>


            <button
                type="submit"
                class="reset-btn"
            >
                Reset Password
            </button>

        </form>


        <div class="back">

            <a href="<%= request.getContextPath() %>/admin/admin-login.jsp">
                ← Back to Login
            </a>

        </div>

    </div>

</body>

</html>