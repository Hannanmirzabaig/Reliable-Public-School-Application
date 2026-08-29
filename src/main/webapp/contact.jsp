<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Contact Us - Reliable Public School</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Playfair+Display:wght@600;700&display=swap"
      rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

    /* ================= RESET ================= */

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

    /* ================= DROPDOWN ================= */

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

    /* Hover par click se pehle dropdown open hoga */

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

    /* Apply For Admission - NO WHATSAPP ICON */

    .dropdown-menu .apply-admission i {
        display: none;
    }

    .dropdown-menu .apply-admission {
        gap: 0;
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
        min-height: 360px;

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

    /* ================= MAIN ================= */

    .section {
        padding: 85px 6%;
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

    /* ================= INTRO ================= */

    .intro-section {
        background: white;
    }

    .intro {
        max-width: 950px;
        margin: auto;
        text-align: center;
        color: #686f79;
        font-size: 16px;
        line-height: 1.9;
    }

    /* ================= CONTACT CARDS ================= */

    .contact-cards {
        max-width: 1150px;
        margin: auto;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 25px;
    }

    .contact-card {
        background: #f6f7f9;
        padding: 38px 35px;
        border-bottom: 4px solid transparent;
        box-shadow: 0 8px 30px rgba(0,0,0,.05);
        transition: .3s;
        text-align: center;
    }

    .contact-card:hover {
        transform: translateY(-6px);
        border-bottom-color: #8b171c;
        background: white;
        box-shadow: 0 15px 35px rgba(0,0,0,.09);
    }

    .contact-icon {
        width: 62px;
        height: 62px;
        background: #f8e8e9;
        color: #8b171c;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 27px;
        margin: 0 auto 20px;
    }

    .contact-icon.whatsapp {
        background: #e5f8ed;
        color: #25D366;
    }

    .contact-card h3 {
        color: #152d4b;
        font-family: 'Playfair Display', serif;
        font-size: 23px;
        margin-bottom: 15px;
    }

    .contact-card p {
        color: #747b85;
        font-size: 15px;
        line-height: 1.85;
    }

    .contact-card a {
        color: #8b171c;
        text-decoration: none;
        font-weight: 500;
    }

    .contact-card a:hover {
        color: #651014;
    }

    /* ================= WHATSAPP BUTTON ================= */

    .whatsapp-btn {
        display: inline-flex;
        align-items: center;
        gap: 10px;
        background: #25D366;
        color: white !important;
        padding: 13px 27px;
        text-decoration: none;
        border-radius: 4px;
        font-size: 14px;
        font-weight: 600;
        margin-top: 18px;
        transition: .3s;
    }

    .whatsapp-btn:hover {
        background: #1da851;
        transform: translateY(-3px);
    }

    /* ================= SOCIAL MEDIA ================= */

    .social-section {
        background: #f6f7f9;
        text-align: center;
    }

    .social-icons {
        display: flex;
        justify-content: center;
        gap: 20px;
        flex-wrap: wrap;
    }

    .social-icon {
        width: 58px;
        height: 58px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
        color: white;
        text-decoration: none;
        transition: .3s;
    }

    .social-icon:hover {
        transform: translateY(-6px) scale(1.06);
    }

    .facebook {
        background: #1877F2;
    }

    .instagram {
        background: linear-gradient(
            45deg,
            #f09433,
            #e6683c,
            #dc2743,
            #cc2366,
            #bc1888
        );
    }

    .email {
        background: #123c73;
    }

    .whatsapp-social {
        background: #25D366;
    }

    /* ================= MAP ================= */

    .map-section {
        background: white;
    }

    .map-container {
        max-width: 1150px;
        margin: auto;
        height: 420px;
        overflow: hidden;
        border-radius: 8px;
        box-shadow: 0 10px 30px rgba(0,0,0,.08);
    }

    .map-container iframe {
        width: 100%;
        height: 100%;
        border: 0;
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
    }

    .footer-column a:hover {
        color: white;
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

        .section {
            padding: 65px 5%;
        }

        .section-title {
            font-size: 34px;
        }

        .contact-cards {
            grid-template-columns: 1fr;
        }

        .map-container {
            height: 320px;
        }

        .footer-content {
            grid-template-columns: 1fr;
            gap: 30px;
        }
    }

</style>

</head>

<body>

<!-- ================= TOP NOTICE BAR ================= -->

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
            Join Reliable Public School and give your child a strong educational foundation
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


    <!-- ================= ADMISSIONS DROPDOWN ================= -->

    <div class="dropdown">

        <button class="dropbtn">

            Admissions

            <i class="fas fa-chevron-down"></i>

        </button>


        <div class="dropdown-menu">

            <!-- APPLY FOR ADMISSION
                 WhatsApp icon intentionally removed -->

            <a class="apply-admission"
               href="https://wa.me/916399883478?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20know%20about%20admission."
               target="_blank">

                <span>
                    Apply For Admission
                </span>

            </a>


            <!-- ADMISSION PROCESS -->

            <a href="${pageContext.request.contextPath}/admissions.jsp#process">

                <i class="fas fa-list-check"></i>

                <span>
                    Admission Process
                </span>

            </a>


            <!-- SCHOLARSHIPS -->

            <a href="${pageContext.request.contextPath}/admissions.jsp#scholarships">

                <i class="fas fa-award"></i>

                <span>
                    Scholarships
                </span>

            </a>

        </div>

    </div>


    <a href="${pageContext.request.contextPath}/notice?action=public">
        Notice
    </a>
    <a href="${pageContext.request.contextPath}/contact.jsp" class="active">
        Contact
    </a>


    <!-- APPLY NOW -->

    <a class="nav-apply"
       href="https://wa.me/916399883478?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20apply%20for%20admission."
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
        Contact Us
    </h1>

    <p>
        We are here to help you
    </p>

</div>


</section>

<!-- ================= CONTACT INTRO ================= -->

<section class="section">


<div class="section-header">

    <div class="section-label">
        Get In Touch
    </div>

    <h2 class="section-title">
        Contact Reliable Public School
    </h2>

    <p class="section-text">
        Have a question about admissions or the school?
        Feel free to reach out to us. We would love to hear from you.
    </p>

</div>

<div class="intro">

    <p>
        Whether you need information about admissions, school activities,
        academics or anything else, our team is always happy to assist you.
    </p>

</div>


</section>

<!-- ================= CONTACT INFORMATION ================= -->

<section class="section" style="background:#f6f7f9;">

<div class="contact-cards">


    <!-- ADDRESS -->

    <div class="contact-card">

        <div class="contact-icon">

            <i class="fas fa-map-marker-alt"></i>

        </div>

        <h3>
            Our Address
        </h3>

        <p>

            Reliable Public School<br>

            Kasba Jhalu<br>

            Bijnor, Uttar Pradesh

        </p>

    </div>


    <!-- PHONE -->

    <div class="contact-card">

        <div class="contact-icon">

            <i class="fas fa-phone-alt"></i>

        </div>

        <h3>
            Phone Number
        </h3>

        <p>

            <a href="tel:+916399883478">
                +91 63998 83478
            </a>

        </p>

    </div>


    <!-- EMAIL -->

    <div class="contact-card">

        <div class="contact-icon">

            <i class="fas fa-envelope"></i>

        </div>

        <h3>
            Email Address
        </h3>

        <p>

            <a href="mailto:info@reliablepublicschool.com">
                info@reliablepublicschool.com
            </a>

        </p>

    </div>


    <!-- WHATSAPP -->

    <div class="contact-card">

        <div class="contact-icon whatsapp">

            <i class="fab fa-whatsapp"></i>

        </div>

        <h3>
            WhatsApp
        </h3>

        <p>
            Chat with us instantly
        </p>

        <a href="https://wa.me/916399883478"
           target="_blank"
           class="whatsapp-btn">

            <i class="fab fa-whatsapp"></i>

            Chat on WhatsApp

        </a>

    </div>

</div>

</section>

<!-- ================= SOCIAL MEDIA ================= -->

<section class="section social-section">

<div class="section-header">

    <div class="section-label">
        Stay Connected
    </div>

    <h2 class="section-title">
        Connect With Us
    </h2>

    <p class="section-text">
        Follow us on social media for latest updates & school activities.
    </p>

</div>


<div class="social-icons">


    <!-- FACEBOOK -->

    <a href="https://www.facebook.com/"
       target="_blank"
       class="social-icon facebook"
       title="Facebook">

        <i class="fab fa-facebook-f"></i>

    </a>


    <!-- INSTAGRAM -->

    <a href="https://www.instagram.com/beinghannanmirza"
       target="_blank"
       class="social-icon instagram"
       title="Instagram">

        <i class="fab fa-instagram"></i>

    </a>


    <!-- EMAIL -->

    <a href="mailto:info@reliablepublicschool.com"
       class="social-icon email"
       title="Email">

        <i class="fas fa-envelope"></i>

    </a>


    <!-- WHATSAPP -->

    <a href="https://wa.me/916399883478"
       target="_blank"
       class="social-icon whatsapp-social"
       title="WhatsApp">

        <i class="fab fa-whatsapp"></i>

    </a>

</div>


</section>

<!-- ================= GOOGLE MAP ================= -->

<section class="section map-section">

<div class="section-header">

    <div class="section-label">
        Our Location
    </div>

    <h2 class="section-title">
        Find Us on Map
    </h2>

    <p class="section-text">
        Visit Reliable Public School at Kasba Jhalu, Bijnor, Uttar Pradesh.
    </p>

</div>


<div class="map-container">

    <iframe

        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14000!2d78.23!3d29.34!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2sJhalu%2C%20Bijnor%2C%20Uttar%20Pradesh%20246728!5e0!3m2!1sen!2sin!4v1720000000000!5m2!1sen!2sin"

        width="100%"
        height="450"
        style="border:0;"
        allowfullscreen=""
        loading="lazy"
        referrerpolicy="no-referrer-when-downgrade">

    </iframe>

</div>

</section>

<!-- ================= FOOTER ================= -->

<footer>

<div class="footer-content">


    <!-- BRAND -->

    <div class="footer-brand">

        <h2>
            Reliable Public School
        </h2>

        <p>
            Quality education, strong values and a brighter
            future for every student.
        </p>

    </div>


    <!-- QUICK LINKS -->

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


    <!-- SCHOOL -->

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

        <a href="https://wa.me/919211932580?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20know%20about%20admission."
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
