
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Details - Modern Life Public School</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

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
           HEADER
        ========================= */

        header {
            height: 72px;

            background: linear-gradient(135deg, #123c73, #1e4a8a);

            color: white;

            padding: 0 5%;

            display: flex;
            align-items: center;
            justify-content: space-between;

            box-shadow: 0 5px 25px rgba(18, 60, 115, 0.22);

            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;

            font-size: 22px;
            font-weight: 700;

            letter-spacing: 0.3px;
        }

        .logo-icon {
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

        .logo span {
            color: #fbbf24;
        }

        .back {
            color: white;

            text-decoration: none;

            background: rgba(255, 255, 255, 0.13);

            border: 1px solid rgba(255, 255, 255, 0.18);

            padding: 9px 17px;

            border-radius: 10px;

            font-size: 13px;
            font-weight: 600;

            display: flex;
            align-items: center;
            gap: 8px;

            transition: all 0.3s ease;
        }

        .back:hover {
            background: #fbbf24;
            color: #123c73;

            transform: translateY(-2px);
        }

        /* =========================
           CONTAINER
        ========================= */

        .container {
            max-width: 1150px;

            margin: 0 auto;

            padding: 45px 25px 70px;
        }

        /* =========================
           PAGE INTRO
        ========================= */

        .page-header {
            text-align: center;

            margin-bottom: 38px;
        }

        .page-icon {
            width: 65px;
            height: 65px;

            margin: 0 auto 17px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #eaf2ff;

            color: #123c73;

            border-radius: 18px;

            font-size: 27px;

            box-shadow: 0 7px 20px rgba(18, 60, 115, 0.08);
        }

        h1 {
            color: #123c73;

            font-size: 30px;

            font-weight: 700;

            margin-bottom: 7px;
        }

        .subtitle {
            color: #64748b;

            font-size: 14px;
        }

        /* =========================
           CLASS GRID
        ========================= */

        .classes {
            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(190px, 1fr));

            gap: 20px;
        }

        /* =========================
           CLASS CARD
        ========================= */

        .class-card {
            background: white;

            padding: 27px 20px;

            border-radius: 17px;

            text-align: center;

            text-decoration: none;

            color: #333;

            box-shadow:
                0 7px 25px rgba(15, 23, 42, 0.06);

            border: 1px solid #edf1f6;

            transition:
                transform 0.3s ease,
                box-shadow 0.3s ease,
                border-color 0.3s ease;

            position: relative;

            overflow: hidden;
        }

        .class-card::after {
            content: "";

            position: absolute;

            width: 100px;
            height: 100px;

            border-radius: 50%;

            background: #f4f8ff;

            right: -45px;
            bottom: -45px;

            transition: 0.35s ease;
        }

        .class-card:hover {
            transform: translateY(-7px);

            box-shadow:
                0 15px 35px rgba(18, 60, 115, 0.13);

            border-color: #d5e2f2;
        }

        .class-card:hover::after {
            transform: scale(1.35);
        }

        /* =========================
           CLASS ICON
        ========================= */

        .class-icon {
            width: 58px;
            height: 58px;

            margin: 0 auto 15px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #eff6ff;

            color: #1d4ed8;

            border-radius: 15px;

            font-size: 23px;

            transition: all 0.3s ease;

            position: relative;
            z-index: 2;
        }

        .class-card:hover .class-icon {
            background: #123c73;

            color: white;

            transform: scale(1.08);
        }

        .class-card h2 {
            color: #123c73;

            margin-bottom: 7px;

            font-size: 17px;

            font-weight: 700;

            position: relative;
            z-index: 2;
        }

        .class-card p {
            color: #64748b;

            font-size: 12.5px;

            position: relative;
            z-index: 2;
        }

        .card-arrow {
            position: absolute;

            right: 17px;
            top: 17px;

            color: #cbd5e1;

            font-size: 11px;

            transition: 0.3s;

            z-index: 3;
        }

        .class-card:hover .card-arrow {
            color: #123c73;

            transform: translateX(3px);
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
        }

        footer p {
            opacity: 0.85;
        }

        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 768px) {

            header {
                height: auto;

                padding: 14px 5%;

                gap: 12px;

                flex-direction: column;
            }

            .logo {
                font-size: 19px;
            }

            .logo-icon {
                width: 38px;
                height: 38px;
            }

            .back {
                width: 100%;

                justify-content: center;
            }

            .container {
                padding: 32px 16px 50px;
            }

            h1 {
                font-size: 25px;
            }

            .subtitle {
                font-size: 13px;
            }

            .classes {
                grid-template-columns:
                    repeat(2, 1fr);

                gap: 14px;
            }

            .class-card {
                padding: 23px 12px;
            }

        }

        @media (max-width: 450px) {

            .classes {
                grid-template-columns: 1fr;
            }

            .class-card {
                padding: 25px 15px;
            }

        }

    </style>

</head>

<body>

    <!-- =========================
         HEADER
    ========================= -->

    <header>

        <div class="logo">

            <div class="logo-icon">
                <i class="fas fa-school"></i>
            </div>

            Modern Life <span>Public School</span>

        </div>

        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp"
           class="back">

            <i class="fas fa-arrow-left"></i>

            Dashboard

        </a>

    </header>


    <!-- =========================
         MAIN
    ========================= -->

    <div class="container">

        <!-- PAGE HEADER -->

        <div class="page-header">

            <div class="page-icon">

                <i class="fas fa-user-graduate"></i>

            </div>

            <h1>
                Student Details
            </h1>

            <p class="subtitle">
                Select a class to view all students
            </p>

        </div>


        <!-- =========================
             CLASS CARDS
        ========================= -->

        <div class="classes">


            <!-- NURSERY -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=Nursery"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class Nursery
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- LKG -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=LKG"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class LKG
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- UKG -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=UKG"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class UKG
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 1 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=1"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 1
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 2 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=2"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 2
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 3 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=3"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 3
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 4 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=4"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 4
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 5 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=5"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 5
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 6 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=6"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 6
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 7 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=7"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 7
                </h2>

                <p>
                    View Students
                </p>

            </a>


            <!-- CLASS 8 -->

            <a href="${pageContext.request.contextPath}/student-details?action=students&className=8"
               class="class-card">

                <i class="fas fa-chevron-right card-arrow"></i>

                <div class="class-icon">
                    📚
                </div>

                <h2>
                    Class 8
                </h2>

                <p>
                    View Students
                </p>

            </a>

        </div>

    </div>


    <!-- =========================
         FOOTER
    ========================= -->

    <footer>

        <p>
            © 2026 Modern Life Public School. All Rights Reserved.
        </p>

    </footer>

</body>

</html>
