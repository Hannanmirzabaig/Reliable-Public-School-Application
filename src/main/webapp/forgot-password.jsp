<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Forgot Password - Reliable Public School</title>

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

        .forgot-container {
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
            margin-bottom: 10px;
        }

        .info {
            text-align: center;
            color: #666;
            font-size: 14px;
            line-height: 1.5;
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

        .error {
            background: #fee2e2;
            color: #b91c1c;

            padding: 10px;
            border-radius: 6px;

            margin-bottom: 15px;

            text-align: center;
            font-size: 14px;
        }

        .success {
            background: #dcfce7;
            color: #166534;

            padding: 10px;
            border-radius: 6px;

            margin-bottom: 15px;

            text-align: center;
            font-size: 14px;
        }

        @media (max-width: 500px) {

            .forgot-container {
                width: 90%;
                padding: 30px 25px;
            }

        }

    </style>

</head>

<body>

    <div class="forgot-container">

        <div class="logo">

            <h1>Reliable Public School</h1>

            <p>School Management System</p>

        </div>


        <h2 class="title">
            Forgot Password?
        </h2>


        <p class="info">
            Enter your registered admin email address.
            We will send you a password reset link.
        </p>


        <% if ("invalid".equals(request.getParameter("error"))) { %>

            <div class="error">
                Please enter a valid email address.
            </div>

        <% } %>


        <% if ("notfound".equals(request.getParameter("error"))) { %>

            <div class="error">
                No admin account found with this email.
            </div>

        <% } %>


        <% if ("failed".equals(request.getParameter("error"))) { %>

            <div class="error">
                Unable to send reset email. Please try again.
            </div>

        <% } %>


        <% if ("sent".equals(request.getParameter("success"))) { %>

            <div class="success">
                Password reset link has been sent to your email.
                Please check your inbox.
            </div>

        <% } %>


        <form
            action="<%= request.getContextPath() %>/forgot-password"
            method="post"
        >

            <div class="form-group">

                <label>
                    Email Address
                </label>

                <input
                    type="email"
                    name="email"
                    placeholder="Enter your registered email"
                    maxlength="100"
                    required
                >

            </div>


            <button
                type="submit"
                class="reset-btn"
            >
                Send Reset Link
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