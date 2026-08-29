<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Notices - Reliable Public School</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Playfair+Display:wght@600;700&display=swap"
      rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    html {
        scroll-behavior: smooth;
    }

    body {
        font-family: 'Poppins', sans-serif;
        color: #252525;
        background: #ffffff;
        line-height: 1.6;
        overflow-x: hidden;
    }

    /* ================= TOP NOTICE BAR ================= */

    .top-bar {
        background: #8b171c;
        color: white;
        height: 42px;
        display: flex;
        align-items: center;
        overflow: hidden;
        position: relative;
        z-index: 1001;
    }

    .top-label {
        background: #651014;
        height: 42px;
        display: flex;
        align-items: center;
        padding: 0 25px;
        font-size: 13px;
        font-weight: 700;
        letter-spacing: .5px;
        white-space: nowrap;
        z-index: 2;
    }

    .marquee-wrapper {
        flex: 1;
        overflow: hidden;
        white-space: nowrap;
    }

    .marquee {
        display: inline-block;
        padding-left: 100%;
        animation: marquee 22s linear infinite;
        font-size: 13px;
    }

    .marquee span {
        margin-right: 80px;
    }

    @keyframes marquee {

        0% {
            transform: translateX(0);
        }

        100% {
            transform: translateX(-100%);
        }

    }

    /* ================= HEADER ================= */

    header {
        background: #ffffff;
        min-height: 88px;
        padding: 0 6%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: sticky;
        top: 0;
        z-index: 1000;
        border-bottom: 1px solid #eeeeee;
        box-shadow: 0 3px 15px rgba(0,0,0,.07);
    }

    /* ================= LOGO ================= */

    .logo {
        display: flex;
        align-items: center;
        gap: 12px;
        text-decoration: none;
        color: #122b4d;
    }

    .logo-icon {
        width: 52px;
        height: 52px;
        border-radius: 50%;
        background: #8b171c;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 23px;
        font-weight: 700;
        border: 4px solid #f1d8d9;
    }

    .logo-text {
        display: flex;
        flex-direction: column;
        line-height: 1.1;
    }

    .logo-text strong {
        font-size: 21px;
        color: #8b171c;
        font-weight: 700;
    }

    .logo-text span {
        font-size: 11px;
        color: #777;
        letter-spacing: 1.8px;
        text-transform: uppercase;
    }

    /* ================= NAVIGATION ================= */

    nav {
        display: flex;
        align-items: center;
        gap: 3px;
    }

    nav > a,
    .dropdown > .dropbtn {
        color: #333;
        text-decoration: none;
        padding: 11px 15px;
        font-size: 14px;
        font-weight: 500;
        transition: .3s;
        position: relative;
        background: transparent;
        border: none;
        font-family: 'Poppins', sans-serif;
        cursor: pointer;
    }

    nav > a::after,
    .dropdown > .dropbtn::after {
        content: "";
        position: absolute;
        bottom: 3px;
        left: 15px;
        width: 0;
        height: 2px;
        background: #8b171c;
        transition: .3s;
    }

    nav > a:hover,
    .dropdown:hover > .dropbtn {
        color: #8b171c;
    }

    nav > a:hover::after,
    .dropdown:hover > .dropbtn::after {
        width: calc(100% - 30px);
    }

    nav > a.active,
    .dropdown > .dropbtn.active {
        color: #8b171c;
    }

    nav > a.active::after,
    .dropdown > .dropbtn.active::after {
        width: calc(100% - 30px);
    }

    /* ================= ADMISSIONS DROPDOWN ================= */

    .dropdown {
        position: relative;
    }

    .dropbtn i {
        font-size: 11px;
        margin-left: 5px;
        transition: .3s;
    }

    .dropdown:hover .dropbtn i {
        transform: rotate(180deg);
    }

    .dropdown-menu {
        position: absolute;
        top: calc(100% + 8px);
        left: 0;
        min-width: 235px;
        background: white;
        border-top: 3px solid #8b171c;
        box-shadow: 0 12px 30px rgba(0,0,0,.15);
        border-radius: 0 0 5px 5px;
        padding: 8px 0;
        opacity: 0;
        visibility: hidden;
        transform: translateY(8px);
        transition: .25s ease;
        z-index: 2000;
    }

    .dropdown:hover .dropdown-menu {
        opacity: 1;
        visibility: visible;
        transform: translateY(0);
    }

    .dropdown-menu a {
        display: flex;
        align-items: center;
        gap: 11px;
        color: #333;
        text-decoration: none;
        padding: 12px 18px;
        font-size: 13.5px;
        font-weight: 500;
        transition: .25s;
        white-space: nowrap;
    }

    .dropdown-menu a i {
        width: 18px;
        color: #8b171c;
        font-size: 14px;
    }

    .dropdown-menu a:hover {
        background: #f8eeee;
        color: #8b171c;
        padding-left: 23px;
    }

    /* ================= APPLY NOW ================= */

    .nav-apply {
        background: #8b171c !important;
        color: white !important;
        border-radius: 4px;
        margin-left: 8px;
        padding: 11px 20px !important;
    }

    .nav-apply:hover {
        background: #651014 !important;
    }

    .nav-apply::after {
        display: none !important;
    }

    /* ================= PAGE BANNER ================= */

    .page-banner {
        min-height: 340px;

        background:
            linear-gradient(
                rgba(8, 27, 49, .62),
                rgba(8, 27, 49, .72)
            ),
            url("https://images.unsplash.com/photo-1580582932707-520aed937b7b?auto=format&fit=crop&w=1920&q=80")
            center/cover no-repeat;

        display: flex;
        align-items: center;
        justify-content: center;

        text-align: center;
        color: white;
        position: relative;
    }

    .page-banner::after {
        content: "";
        position: absolute;
        bottom: -1px;
        left: 0;
        width: 100%;
        height: 65px;

        background: white;

        clip-path: polygon(
            0 70%,
            20% 45%,
            40% 65%,
            60% 35%,
            80% 55%,
            100% 25%,
            100% 100%,
            0 100%
        );
    }

    .banner-content {
        position: relative;
        z-index: 2;
        padding: 50px 20px 70px;
    }

    .banner-small {
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 3px;
        color: #f3d08b;
        font-weight: 600;
        margin-bottom: 12px;
    }

    .page-banner h1 {
        font-family: 'Playfair Display', serif;
        font-size: 52px;
        line-height: 1.2;
        margin-bottom: 12px;
    }

    .page-banner p {
        font-size: 17px;
        opacity: .95;
    }

    /* ================= NOTICE SECTION ================= */

    .notice-section {
        background: white;
        padding: 75px 6% 90px;
    }

    .section-header {
        text-align: center;
        max-width: 760px;
        margin: 0 auto 50px;
    }

    .section-label {
        color: #8b171c;
        text-transform: uppercase;
        font-size: 12px;
        letter-spacing: 2px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .section-title {
        color: #152d4b;
        font-family: 'Playfair Display', serif;
        font-size: 40px;
        line-height: 1.2;
        margin-bottom: 17px;
    }

    .section-text {
        color: #6d7480;
        font-size: 16px;
        line-height: 1.9;
    }

    .notice-container {
        max-width: 1050px;
        margin: auto;
    }

    /* ================= NOTICE CARD ================= */

    .notice {
        background: #ffffff;
        border: 1px solid #eeeeee;
        border-left: 5px solid #8b171c;
        padding: 28px 30px;
        margin-bottom: 22px;

        box-shadow: 0 8px 28px rgba(0,0,0,.055);

        position: relative;
        overflow: hidden;

        transition: .3s;
    }

    .notice::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 3px;

        background: linear-gradient(
            90deg,
            #8b171c,
            #d6a645
        );

        transform: scaleX(0);
        transform-origin: left;
        transition: .3s;
    }

    .notice:hover {
        transform: translateY(-6px);
        box-shadow: 0 15px 35px rgba(0,0,0,.10);
        border-left-color: #651014;
    }

    .notice:hover::before {
        transform: scaleX(1);
    }

    .notice-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 20px;
        margin-bottom: 14px;
    }

    .notice-title {
        display: flex;
        align-items: flex-start;
        gap: 13px;
    }

    .notice-icon {
        min-width: 42px;
        height: 42px;

        display: flex;
        align-items: center;
        justify-content: center;

        background: #f8e8e9;
        color: #8b171c;

        font-size: 17px;
    }

    .notice h2 {
        color: #152d4b;
        font-family: 'Playfair Display', serif;
        font-size: 22px;
        line-height: 1.35;
        font-weight: 600;
    }

    .date {
        background: #f8e8e9;
        color: #8b171c;

        padding: 7px 15px;
        border-radius: 30px;

        font-size: 12px;
        font-weight: 600;

        white-space: nowrap;
        flex-shrink: 0;
    }

    .notice-description {
        color: #6d7480;
        font-size: 15px;
        line-height: 1.85;

        padding-left: 55px;
    }

    /* ================= EMPTY STATE ================= */

    .empty-state {
        text-align: center;
        padding: 65px 30px;
        border-left: none;
    }

    .empty-icon {
        width: 70px;
        height: 70px;

        margin: 0 auto 20px;

        display: flex;
        align-items: center;
        justify-content: center;

        background: #f8e8e9;
        color: #8b171c;

        border-radius: 50%;

        font-size: 28px;
    }

    .empty-state h2 {
        color: #152d4b;
        font-family: 'Playfair Display', serif;
        font-size: 25px;
        margin-bottom: 10px;
    }

    .empty-state p {
        color: #747b85;
        font-size: 15px;
    }

    /* ================= FOOTER ================= */

    footer {
        background: #0c1d31;
        color: white;
        padding: 45px 6% 25px;
    }

    .footer-content {
        max-width: 1150px;
        margin: auto;

        display: grid;
        grid-template-columns: 1.5fr 1fr 1fr;

        gap: 50px;
        padding-bottom: 35px;
    }

    .footer-brand h2 {
        color: white;
        font-family: 'Playfair Display', serif;
        margin-bottom: 12px;
    }

    .footer-brand p {
        color: #b9c0c9;
        font-size: 14px;
        line-height: 1.8;
    }

    .footer-column h3 {
        margin-bottom: 15px;
        font-size: 16px;
    }

    .footer-column a {
        display: block;
        color: #b9c0c9;
        text-decoration: none;
        font-size: 14px;
        margin-bottom: 8px;
        transition: .3s;
    }

    .footer-column a:hover {
        color: white;
        padding-left: 4px;
    }

    .footer-bottom {
        max-width: 1150px;
        margin: auto;

        border-top: 1px solid rgba(255,255,255,.12);

        padding-top: 20px;

        text-align: center;

        color: #aeb6c0;
        font-size: 13px;
    }

    /* ================= MOBILE ================= */

    @media(max-width: 1000px) {

        nav > a,
        .dropdown > .dropbtn {
            padding: 9px 8px;
            font-size: 12px;
        }

    }

    @media(max-width: 768px) {

        .top-label {
            padding: 0 12px;
            font-size: 11px;
        }

        .marquee {
            font-size: 11px;
        }

        header {
            min-height: auto;
            padding: 15px 5%;
            flex-direction: column;
            gap: 15px;
        }

        nav {
            flex-wrap: wrap;
            justify-content: center;
        }

        nav > a,
        .dropdown > .dropbtn {
            padding: 7px 8px;
            font-size: 12px;
        }

        .nav-apply {
            margin-left: 0;
        }

        .dropdown {
            position: static;
        }

        .dropdown-menu {
            position: absolute;
            left: 50%;

            transform: translate(-50%, 8px);

            min-width: 220px;
        }

        .dropdown:hover .dropdown-menu {
            transform: translate(-50%, 0);
        }

        .page-banner {
            min-height: 290px;
        }

        .page-banner h1 {
            font-size: 36px;
        }

        .notice-section {
            padding: 60px 5% 70px;
        }

        .section-title {
            font-size: 34px;
        }

        .notice {
            padding: 24px 20px;
        }

        .notice-header {
            flex-direction: column;
            gap: 13px;
        }

        .notice-title {
            width: 100%;
        }

        .date {
            align-self: flex-start;
        }

        .notice-description {
            padding-left: 0;
            margin-top: 15px;
        }

        .footer-content {
            grid-template-columns: 1fr;
            gap: 30px;
        }

    }

</style>
</head>

<body>

<!-- ================= TOP BAR ================= -->

<div class="top-bar">
<div class="top-label">
    IMPORTANT
</div>

<div class="marquee-wrapper">

    <div class="marquee">

        <span>
            Welcome to Reliable Public School — Quality Education • Strong Values • Bright Future
        </span>

        <span>
            Admissions are open — Contact us for admission information
        </span>

        <span>
            Stay updated with the latest school notices and announcements
        </span>

    </div>

</div>

</div>

<!-- ================= HEADER ================= -->

<header>
<a href="${pageContext.request.contextPath}/index.jsp"
   class="logo">

    <div class="logo-icon">
        R
    </div>

    <div class="logo-text">

        <strong>
            Reliable Public School
        </strong>

        <span>
            Education • Excellence • Values
        </span>

    </div>

</a>


<nav>

    <a href="${pageContext.request.contextPath}/index.jsp">
        Home
    </a>

    <a href="${pageContext.request.contextPath}/about.jsp">
        About
    </a>

    <a href="${pageContext.request.contextPath}/academics.jsp">
        Academics
    </a>


    <div class="dropdown">

        <button class="dropbtn">

            Admissions

            <i class="fas fa-chevron-down"></i>

        </button>


        <div class="dropdown-menu">

            <a href="https://wa.me/916399883478?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20know%20about%20admission"
               target="_blank">

                <span>
                    Apply For Admission
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/admissions.jsp#process">

                <i class="fas fa-list-check"></i>

                <span>
                    Admission Process
                </span>

            </a>


            <a href="${pageContext.request.contextPath}/admissions.jsp#scholarships">

                <i class="fas fa-award"></i>

                <span>
                    Scholarships
                </span>

            </a>

        </div>

    </div>


    <a class="active"
       href="${pageContext.request.contextPath}/notice?action=public">

        Notice

    </a>



    <a href="${pageContext.request.contextPath}/contact.jsp">
        Contact
    </a>


    <a class="nav-apply"
       href="https://wa.me/916399883478?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20apply%20for%20admission"
       target="_blank">

        Apply Now

    </a>

</nav>

</header>

<!-- ================= PAGE BANNER ================= -->

<section class="page-banner">

<div class="banner-content">

    <div class="banner-small">
        Reliable Public School
    </div>

    <h1>
        Notice Board
    </h1>

    <p>
        Stay updated with the latest announcements
    </p>

</div>


</section>

<!-- ================= NOTICE CONTENT ================= -->

<section class="notice-section">

<div class="section-header">

    <div class="section-label">
        School Updates
    </div>

    <h2 class="section-title">
        Latest Notices
    </h2>

    <p class="section-text">
        Stay informed about important announcements,
        events and updates from Reliable Public School.
    </p>

</div>


<div class="notice-container">

    <c:choose>

        <c:when test="${not empty notices}">

            <c:forEach var="notice" items="${notices}">

                <div class="notice">

                    <div class="notice-header">

                        <div class="notice-title">

                            <div class="notice-icon">
                                <i class="fas fa-bullhorn"></i>
                            </div>

                            <h2>
                                ${notice.title}
                            </h2>

                        </div>

                        <span class="date">
                            ${notice.noticeDate}
                        </span>

                    </div>

                    <p class="notice-description">
                        ${notice.description}
                    </p>

                </div>

            </c:forEach>

        </c:when>

        <c:otherwise>

            <div class="notice empty-state">

                <div class="empty-icon">
                    <i class="fas fa-bell-slash"></i>
                </div>

                <h2>
                    No Notices Available
                </h2>

                <p>
                    There are currently no notices from Reliable Public School.
                </p>

            </div>

        </c:otherwise>

    </c:choose>

</div>


</section>

<!-- ================= FOOTER ================= -->

<footer>

<div class="footer-content">


    <div class="footer-brand">

        <h2>
            Reliable Public School
        </h2>

        <p>
            Quality education, strong values and a brighter
            future for every student.
        </p>

    </div>


    <div class="footer-column">

        <h3>
            Quick Links
        </h3>

        <a href="${pageContext.request.contextPath}/index.jsp">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/about.jsp">
            About
        </a>

        <a href="${pageContext.request.contextPath}/academics.jsp">
            Academics
        </a>

        <a href="${pageContext.request.contextPath}/admissions.jsp">
            Admissions
        </a>

    </div>


    <div class="footer-column">

        <h3>
            School
        </h3>

        <a href="${pageContext.request.contextPath}/notice?action=public">
            Notices
        </a>

        
        <a href="${pageContext.request.contextPath}/contact.jsp">
            Contact
        </a>

        <a href="https://wa.me/916399883478?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20know%20about%20admission"
           target="_blank">

            Apply For Admission

        </a>

    </div>

</div>


<div class="footer-bottom">

    <p>
        © 2026 Reliable Public School. All Rights Reserved.
    </p>

</div>

</footer>

</body>

</html>
