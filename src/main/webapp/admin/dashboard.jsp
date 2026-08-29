<%@ page language="java"
    contentType="text/html; charset=UTF-8"
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
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard - Reliable Public School</title>

    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fb;
            color: #1e293b;
            min-height: 100vh;
        }

        /* =========================
           NAVBAR
        ========================= */

        .navbar {
            min-height: 72px;
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 5%;
            box-shadow: 0 5px 25px rgba(18, 60, 115, 0.22);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .school-name {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 22px;
            font-weight: 700;
            letter-spacing: 0.3px;
        }

        .school-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 12px;
            font-size: 19px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        .school-name span {
            color: #fbbf24;
        }

        .admin-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .admin-user {
            display: flex;
            align-items: center;
            gap: 9px;
            padding: 9px 16px;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 50px;
            font-size: 13px;
            font-weight: 500;
        }

        .admin-user i {
            color: #fbbf24;
        }

        .logout {
            color: white;
            text-decoration: none;
            background: #dc2626;
            padding: 9px 17px;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 7px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.25);
        }

        .logout:hover {
            background: #b91c1c;
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(220, 38, 38, 0.35);
        }

        /* =========================
           MAIN CONTAINER
        ========================= */

        .container {
            max-width: 1250px;
            margin: 0 auto;
            padding: 45px 25px 70px;
        }

        /* =========================
           WELCOME SECTION
        ========================= */

        .welcome {
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            padding: 32px 35px;
            border-radius: 20px;
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 12px 30px rgba(18, 60, 115, 0.18);
        }

        .welcome::before {
            content: "";
            position: absolute;
            width: 230px;
            height: 230px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.06);
            right: -60px;
            top: -80px;
        }

        .welcome::after {
            content: "";
            position: absolute;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: rgba(251, 191, 36, 0.08);
            right: 100px;
            bottom: -100px;
        }

        .welcome-content {
            position: relative;
            z-index: 2;
        }

        .welcome h1 {
            font-size: 29px;
            font-weight: 700;
            margin-bottom: 7px;
        }

        .welcome p {
            color: rgba(255, 255, 255, 0.82);
            font-size: 14px;
        }

        .welcome-badge {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            margin-top: 17px;
            padding: 7px 13px;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.16);
            border-radius: 50px;
            font-size: 12px;
            font-weight: 500;
        }

        .welcome-badge i {
            color: #fbbf24;
        }

        /* =========================
           SECTION TITLE
        ========================= */

        .section-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
        }

        .section-heading h2 {
            color: #123c73;
            font-size: 20px;
            font-weight: 700;
        }

        .section-heading p {
            color: #64748b;
            font-size: 12px;
        }

        /* =========================
           CARDS
        ========================= */

        .cards {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(235px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 17px;
            box-shadow:
                0 7px 25px rgba(15, 23, 42, 0.06);
            border: 1px solid #edf1f6;
            text-decoration: none;
            color: #333;
            transition:
                transform 0.3s ease,
                box-shadow 0.3s ease,
                border-color 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .card::after {
            content: "";
            position: absolute;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: #f1f5f9;
            right: -35px;
            bottom: -35px;
            transition: 0.3s ease;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow:
                0 15px 35px rgba(18, 60, 115, 0.13);
            border-color: #d9e3f0;
        }

        .card:hover::after {
            transform: scale(1.3);
        }

        .card-icon {
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            color: #1d4ed8;
            border-radius: 13px;
            font-size: 20px;
            margin-bottom: 18px;
            transition: 0.3s ease;
            position: relative;
            z-index: 2;
        }

        .card:hover .card-icon {
            background: #123c73;
            color: white;
            transform: scale(1.05);
        }

        .card h2 {
            color: #123c73;
            margin-bottom: 7px;
            font-size: 17px;
            font-weight: 700;
            position: relative;
            z-index: 2;
        }

        .card p {
            color: #64748b;
            font-size: 12.5px;
            line-height: 1.6;
            position: relative;
            z-index: 2;
        }

        .card-arrow {
            position: absolute;
            right: 20px;
            top: 22px;
            color: #94a3b8;
            font-size: 13px;
            transition: 0.3s;
            z-index: 3;
        }

        .card:hover .card-arrow {
            color: #123c73;
            transform: translateX(4px);
        }

        /* =========================
           FOOTER
        ========================= */

        footer {
            background: #0c2a52;
            color: white;
            text-align: center;
            padding: 22px;
            font-size: 13px;
            margin-top: 10px;
        }

        footer p {
            opacity: 0.85;
        }

        /* =========================
           MOBILE
        ========================= */

        @media (max-width: 768px) {

            .navbar {
                height: auto;
                padding: 14px 5%;
                flex-direction: column;
                gap: 13px;
            }

            .school-name {
                font-size: 19px;
            }

            .school-icon {
                width: 38px;
                height: 38px;
            }

            .admin-info {
                width: 100%;
                justify-content: center;
                flex-wrap: wrap;
            }

            .container {
                padding: 30px 16px 50px;
            }

            .welcome {
                padding: 26px 22px;
                border-radius: 17px;
            }

            .welcome h1 {
                font-size: 24px;
            }

            .welcome p {
                font-size: 13px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .section-heading {
                flex-direction: column;
                align-items: flex-start;
                gap: 4px;
            }
        }

        @media (max-width: 450px) {

            .admin-user {
                font-size: 12px;
                padding: 8px 12px;
            }

            .logout {
                padding: 8px 13px;
            }

            .school-name {
                font-size: 17px;
            }

            .card {
                padding: 22px;
            }
        }

    </style>

</head>

<body>

    <!-- =========================
         NAVBAR
    ========================= -->

    <div class="navbar">

        <div class="school-name">

            <div class="school-icon">
                <i class="fas fa-school"></i>
            </div>

            Reliable <span>Public School</span>

        </div>

        <div class="admin-info">

            <div class="admin-user">

                <i class="fas fa-user-shield"></i>

                <span>
                    Admin: <%= admin.getUsername() %>
                </span>

            </div>

            <a href="<%= request.getContextPath() %>/admin?action=logout"
               class="logout">

                <i class="fas fa-right-from-bracket"></i>

                Logout

            </a>

        </div>

    </div>


    <!-- =========================
         MAIN CONTAINER
    ========================= -->

    <div class="container">

        <!-- WELCOME -->

        <div class="welcome">

            <div class="welcome-content">

                <h1>
                    Admin Dashboard
                </h1>

                <p>
                    Welcome to Reliable Public School Management System.
                </p>

                <div class="welcome-badge">

                    <i class="fas fa-shield-halved"></i>

                    Secure Admin Panel

                </div>

            </div>

        </div>


        <!-- SECTION HEADING -->

        <div class="section-heading">

            <div>

                <h2>
                    Management
                </h2>

                <p>
                    Manage your school system from one place
                </p>

            </div>

        </div>


        <!-- =========================
             DASHBOARD CARDS
        ========================= -->

        <div class="cards">


            <!-- STUDENT DETAILS -->

            <a href="${pageContext.request.contextPath}/student-details?action=classes"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-user-graduate"></i>

                </div>

                <h2>
                    Student Details
                </h2>

                <p>
                    View students and fee history
                </p>

            </a>


            <!-- =====================================
                 TEACHERS - SUPER ADMIN ONLY
            ====================================== -->

            <% if ("SUPER_ADMIN".equals(admin.getRole())) { %>

                <a href="${pageContext.request.contextPath}/teacher?action=list"
                   class="card">

                    <i class="fas fa-chevron-right card-arrow"></i>

                    <div class="card-icon">

                        <i class="fas fa-chalkboard-teacher"></i>

                    </div>

                    <h2>
                        Teachers
                    </h2>

                    <p>
                        Manage school teachers
                    </p>

                </a>

            <% } %>


            <!-- NOTICES -->

            <a href="${pageContext.request.contextPath}/notice?action=list"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-bullhorn"></i>

                </div>

                <h2>
                    Notices
                </h2>

                <p>
                    Manage school notices
                </p>

            </a>


            <!-- GALLERY -->

            <a href="#"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-images"></i>

                </div>

                <h2>
                    Gallery
                </h2>

                <p>
                    Manage school gallery
                </p>

            </a>


            <!-- EVENTS -->

            <a href="#"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-calendar-days"></i>

                </div>

                <h2>
                    Events
                </h2>

                <p>
                    Manage school events
                </p>

            </a>


            <!-- ATTENDANCE -->

            <a href="#"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-calendar-check"></i>

                </div>

                <h2>
                    Attendance
                </h2>

                <p>
                    Manage student attendance
                </p>

            </a>


            <!-- FEES -->

            <a href="${pageContext.request.contextPath}/fee?action=list"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-indian-rupee-sign"></i>

                </div>

                <h2>
                    Fees
                </h2>

                <p>
                    Manage student fees
                </p>

            </a>


            <!-- RESULTS -->

            <a href="#"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-square-poll-vertical"></i>

                </div>

                <h2>
                    Results
                </h2>

                <p>
                    Manage student results
                </p>

            </a>


            <!-- =====================================
                 MANAGE ADMINS - SUPER ADMIN ONLY
            ====================================== -->

            <% if ("SUPER_ADMIN".equals(admin.getRole())) { %>

                <a href="${pageContext.request.contextPath}/admin-management"
                   class="card">

                    <i class="fas fa-chevron-right card-arrow"></i>

                    <div class="card-icon">

                        <i class="fas fa-user-gear"></i>

                    </div>

                    <h2>
                        Manage Admins
                    </h2>

                    <p>
                        Add, activate, deactivate or delete admins
                    </p>

                </a>

            <% } %>


            <!-- CHANGE PASSWORD -->

            <a href="${pageContext.request.contextPath}/admin/change-password.jsp"
               class="card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="card-icon">

                    <i class="fas fa-key"></i>

                </div>

                <h2>
                    Change Password
                </h2>

                <p>
                    Change your admin account password
                </p>

            </a>


        </div>

    </div>


    <!-- =========================
         FOOTER
    ========================= -->

    <footer>

        <p>
            © 2026 Reliable Public School. All Rights Reserved.
        </p>

    </footer>

</body>

</html>
