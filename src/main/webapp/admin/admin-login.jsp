<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

    <meta charset="UTF-8">

    <title>Admin Login - Reliable Public School</title>

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

        .login-container {
            width: 400px;
            background: white;

            padding: 40px;

            border-radius: 15px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.12);
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
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

        .login-title {
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

        .login-btn {
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

        .login-btn:hover {
            background: #162d6b;
        }

        /* =========================
           FORGOT PASSWORD
           ========================= */

        .forgot-password {
            text-align: center;

            margin-top: 15px;

            margin-bottom: 5px;
        }

        .forgot-password a {
            color: #1e3a8a;

            text-decoration: none;

            font-size: 14px;

            font-weight: bold;

            cursor: pointer;

            position: relative;

            z-index: 10;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        /* =========================
           BACK TO WEBSITE
           ========================= */

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

        /* =========================
           ERROR
           ========================= */

        .error {
            background: #fee2e2;

            color: #b91c1c;

            padding: 10px;

            border-radius: 6px;

            margin-bottom: 15px;

            text-align: center;

            font-size: 14px;
        }

        /* =========================
           SUCCESS
           ========================= */

        .success {
            background: #dcfce7;

            color: #166534;

            padding: 10px;

            border-radius: 6px;

            margin-bottom: 15px;

            text-align: center;

            font-size: 14px;
        }

        /* =========================
           MOBILE
           ========================= */

        @media (max-width: 500px) {

            .login-container {
                width: 90%;

                padding: 30px 25px;
            }
        }

    </style>

</head>

<body>

    <div class="login-container">

        <!-- LOGO -->

        <div class="logo">

            <h1>
                Reliable Public School
            </h1>

            <p>
                School Management System
            </p>

        </div>


        <!-- TITLE -->

        <h2 class="login-title">
            Admin Login
        </h2>


        <!-- INVALID LOGIN ERROR -->

        <% if ("invalid".equals(request.getParameter("error"))) { %>

            <div class="error">
                Invalid username or password
            </div>

        <% } %>


        <!-- PASSWORD CHANGED SUCCESS -->

        <% if ("passwordChanged".equals(request.getParameter("success"))) { %>

            <div class="success">
                Password changed successfully. Please login again.
            </div>

        <% } %>


        <!-- LOGIN FORM -->

        <form
            action="<%= request.getContextPath() %>/admin"
            method="post"
        >

            <input
                type="hidden"
                name="action"
                value="login"
            >


            <!-- USERNAME -->

            <div class="form-group">

                <label>
                    Username
                </label>

                <input
                    type="text"
                    name="username"
                    placeholder="Enter username"
                    required
                >

            </div>


            <!-- PASSWORD -->

            <div class="form-group">

                <label>
                    Password
                </label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter password"
                    required
                >

            </div>


            <!-- LOGIN BUTTON -->

            <button
                type="submit"
                class="login-btn"
            >
                Login
            </button>

        </form>


        <!-- FORGOT PASSWORD -->

        <div class="forgot-password">

           <div style="text-align: center; margin-top: 15px;">
    <a href="${pageContext.request.contextPath}/forgot-password.jsp">
        Forgot Password?
    </a>
</div>

        </div>


        <!-- BACK TO WEBSITE -->

        <div class="back">

            <a
                href="<%= request.getContextPath() %>/index.jsp"
            >
                ← Back to Website
            </a>

        </div>

    </div>

</body>
</html>
