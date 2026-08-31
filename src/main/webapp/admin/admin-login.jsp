<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Modern Life Public School</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background:
                linear-gradient(rgba(12, 29, 49, 0.82), rgba(12, 29, 49, 0.88)),
                url("https://images.unsplash.com/photo-1580582932707-520aed937b7b?auto=format&fit=crop&w=1920&q=80")
                center/cover no-repeat;
            padding: 25px 15px;
        }

        .login-wrapper {
            width: 100%;
            max-width: 440px;
        }

        .login-container {
            background: #ffffff;
            border-radius: 16px;
            padding: 42px 38px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.25);
            position: relative;
            overflow: hidden;
        }

        .login-container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, #8b171c, #d6a645);
        }

        /* ================= LOGO ================= */
        .logo {
            text-align: center;
            margin-bottom: 28px;
        }

        .logo-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            overflow: hidden;
            border: 3px solid #f1d8d9;
            background: #8b171c;
            margin: 0 auto 14px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .logo h1 {
            font-family: 'Playfair Display', serif;
            color: #8b171c;
            font-size: 24px;
            margin-bottom: 5px;
            line-height: 1.2;
        }

        .logo p {
            color: #777;
            font-size: 13px;
            letter-spacing: 0.5px;
        }

        /* ================= TITLE ================= */
        .login-title {
            text-align: center;
            color: #152d4b;
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 26px;
        }

        .login-title span {
            display: block;
            font-size: 13px;
            color: #8b171c;
            font-weight: 500;
            margin-top: 4px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        /* ================= FORM ================= */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #8b171c;
            font-size: 15px;
        }

        .form-group input {
            width: 100%;
            padding: 13px 14px 13px 42px;
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14.5px;
            font-family: 'Poppins', sans-serif;
            outline: none;
            transition: 0.3s;
            background: #fafafa;
        }

        .form-group input:focus {
            border-color: #8b171c;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(139, 23, 28, 0.1);
        }

        .form-group input::placeholder {
            color: #aaa;
        }

        /* ================= BUTTON ================= */
        .login-btn {
            width: 100%;
            padding: 14px;
            background: #8b171c;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15.5px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 6px;
            letter-spacing: 0.3px;
        }

        .login-btn:hover {
            background: #651014;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(139, 23, 28, 0.3);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        /* ================= LINKS ================= */
        .forgot-password {
            text-align: center;
            margin-top: 18px;
        }

        .forgot-password a {
            color: #8b171c;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: 0.3s;
        }

        .forgot-password a:hover {
            text-decoration: underline;
            color: #651014;
        }

        .back {
            text-align: center;
            margin-top: 22px;
            padding-top: 18px;
            border-top: 1px solid #eee;
        }

        .back a {
            color: #555;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .back a:hover {
            color: #8b171c;
        }

        /* ================= MESSAGES ================= */
        .error {
            background: #fef2f2;
            color: #b91c1c;
            padding: 12px 14px;
            border-radius: 8px;
            margin-bottom: 18px;
            text-align: center;
            font-size: 13.5px;
            border: 1px solid #fecaca;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .success {
            background: #f0fdf4;
            color: #166534;
            padding: 12px 14px;
            border-radius: 8px;
            margin-bottom: 18px;
            text-align: center;
            font-size: 13.5px;
            border: 1px solid #bbf7d0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        /* ================= MOBILE ================= */
        @media (max-width: 500px) {
            body {
                padding: 18px 12px;
            }

            .login-container {
                padding: 32px 24px;
                border-radius: 14px;
            }

            .logo h1 {
                font-size: 21px;
            }

            .logo-icon {
                width: 62px;
                height: 62px;
            }

            .login-title {
                font-size: 20px;
            }

            .form-group input {
                padding: 12px 12px 12px 40px;
                font-size: 14px;
            }

            .login-btn {
                padding: 13px;
                font-size: 15px;
            }
        }
    </style>
</head>

<body>

    <div class="login-wrapper">
        <div class="login-container">

            <!-- LOGO -->
            <div class="logo">
                <div class="logo-icon">
                    <img src="${pageContext.request.contextPath}/images/logo.jpeg" alt="Logo"
                         onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-graduation-cap\' style=\'color:white;font-size:28px;\'></i>'">
                </div>
                <h1>Modern Life Public School</h1>
                <p>School Management System</p>
            </div>

            <!-- TITLE -->
            <h2 class="login-title">
                Admin Login
                <span>Secure Access Portal</span>
            </h2>

            <!-- ERROR MESSAGE -->
            <% if ("invalid".equals(request.getParameter("error"))) { %>
                <div class="error">
                    <i class="fas fa-exclamation-circle"></i>
                    Invalid username or password
                </div>
            <% } %>

            <!-- SUCCESS MESSAGE -->
            <% if ("passwordChanged".equals(request.getParameter("success"))) { %>
                <div class="success">
                    <i class="fas fa-check-circle"></i>
                    Password changed successfully. Please login again.
                </div>
            <% } %>

            <!-- LOGIN FORM -->
            <form action="<%= request.getContextPath() %>/admin" method="post">

                <input type="hidden" name="action" value="login">

                <!-- USERNAME -->
                <div class="form-group">
                    <label>Username</label>
                    <div class="input-wrapper">
                        <i class="fas fa-user"></i>
                        <input type="text"
                               name="username"
                               placeholder="Enter username"
                               required
                               autocomplete="username">
                    </div>
                </div>

                <!-- PASSWORD -->
                <div class="form-group">
                    <label>Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password"
                               name="password"
                               placeholder="Enter password"
                               required
                               autocomplete="current-password">
                    </div>
                </div>

                <!-- LOGIN BUTTON -->
                <button type="submit" class="login-btn">
                    <i class="fas fa-sign-in-alt" style="margin-right: 6px;"></i>
                    Login
                </button>

            </form>

            <!-- FORGOT PASSWORD -->
            <div class="forgot-password">
                <a href="${pageContext.request.contextPath}/forgot-password.jsp">
                    Forgot Password?
                </a>
            </div>

            <!-- BACK TO WEBSITE -->
            <div class="back">
                <a href="<%= request.getContextPath() %>/index.jsp">
                    <i class="fas fa-arrow-left"></i>
                    Back to Website
                </a>
            </div>

        </div>
    </div>

</body>
</html>