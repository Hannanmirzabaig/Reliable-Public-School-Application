<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - Modern Life Public School</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

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

img {
    max-width: 100%;
    display: block;
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
    0% { transform: translateX(0); }
    100% { transform: translateX(-100%); }
}

/* ================= HEADER ================= */
header {
    background: #ffffff;
    min-height: 88px;
    padding: 0 5%;
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
    flex-shrink: 0;
}

.logo-icon {
    width: 58px;
    height: 58px;
    border-radius: 50%;
    overflow: hidden;
    border: 3px solid #f1d8d9;
    background: #8b171c;
    flex-shrink: 0;
}

.logo-icon img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}

.logo-text {
    display: flex;
    flex-direction: column;
    line-height: 1.15;
}

.logo-text strong {
    font-size: 20px;
    color: #8b171c;
    font-weight: 700;
    white-space: nowrap;
}

.logo-text span {
    font-size: 11px;
    color: #777;
    letter-spacing: 1.4px;
    text-transform: uppercase;
    white-space: nowrap;
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
    white-space: nowrap;
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
    min-height: 380px;
    background:
        linear-gradient(rgba(8, 27, 49, .60), rgba(8, 27, 49, .70)),
        url("https://images.unsplash.com/photo-1580582932707-520aed937b7b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80")
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
    height: 70px;
    background: white;
    clip-path: polygon(0 70%, 20% 45%, 40% 65%, 60% 35%, 80% 55%, 100% 25%, 100% 100%, 0 100%);
}

.banner-content {
    position: relative;
    z-index: 2;
    padding: 60px 20px 80px;
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

/* ================= BUTTONS ================= */
.btn {
    display: inline-block;
    background: #8b171c;
    color: white;
    padding: 13px 27px;
    text-decoration: none;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 600;
    margin-right: 10px;
    transition: .3s;
    border: 2px solid #8b171c;
}

.btn:hover {
    background: #651014;
    border-color: #651014;
    transform: translateY(-2px);
}

.btn-outline {
    background: transparent;
    border: 2px solid white;
}

.btn-outline:hover {
    background: white;
    color: #8b171c;
}

/* ================= COMMON SECTION ================= */
.section {
    padding: 90px 5%;
}

.section-header {
    text-align: center;
    max-width: 750px;
    margin: 0 auto 55px;
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
    margin-bottom: 18px;
}

.section-text {
    color: #6d7480;
    font-size: 16px;
    line-height: 1.9;
}

/* ================= ABOUT INTRO ================= */
.about-section {
    background: #ffffff;
}

.about {
    max-width: 1150px;
    margin: auto;
    display: grid;
    grid-template-columns: 1.05fr .95fr;
    gap: 60px;
    align-items: center;
}

.about-image {
    position: relative;
}

.about-image img {
    width: 100%;
    height: 440px;
    object-fit: cover;
}

.about-image::before {
    content: "";
    position: absolute;
    width: 90px;
    height: 90px;
    border-left: 5px solid #8b171c;
    border-top: 5px solid #8b171c;
    top: -15px;
    left: -15px;
}

.about-image::after {
    content: "";
    position: absolute;
    width: 90px;
    height: 90px;
    border-right: 5px solid #d6a645;
    border-bottom: 5px solid #d6a645;
    bottom: -15px;
    right: -15px;
}

.about-content h3 {
    font-family: 'Playfair Display', serif;
    font-size: 32px;
    color: #152d4b;
    margin-bottom: 18px;
}

.about-content p {
    color: #686f79;
    margin-bottom: 22px;
    line-height: 1.9;
}

/* ================= PRINCIPAL / MANAGER ================= */
.person-section {
    background: #f6f7f9;
}

.person-wrapper {
    max-width: 1150px;
    margin: auto;
}

.person-card {
    background: white;
    padding: 40px;
    margin-bottom: 30px;
    box-shadow: 0 8px 30px rgba(0,0,0,.06);
    display: flex;
    align-items: center;
    gap: 40px;
}

.person-photo {
    width: 180px;
    height: 180px;
    border-radius: 50%;
    overflow: hidden;
    flex-shrink: 0;
    border: 5px solid #f1d8d9;
    box-shadow: 0 8px 25px rgba(139,23,28,.15);
}

.person-photo img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.person-info h3 {
    font-family: 'Playfair Display', serif;
    font-size: 26px;
    color: #152d4b;
    margin-bottom: 8px;
}

.person-role {
    color: #8b171c;
    font-size: 14px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 18px;
}

.person-info p {
    color: #686f79;
    line-height: 1.85;
    margin-bottom: 12px;
}

.person-name {
    margin-top: 15px;
    font-weight: 600;
    color: #152d4b;
}

/* ================= VISION MISSION ================= */
.vision-section {
    background: white;
}

.cards {
    max-width: 1150px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 25px;
}

.card {
    background: #f6f7f9;
    padding: 40px 35px;
    border-bottom: 4px solid transparent;
    box-shadow: 0 8px 30px rgba(0,0,0,.05);
    transition: .3s;
}

.card:hover {
    transform: translateY(-6px);
    border-bottom-color: #8b171c;
    box-shadow: 0 15px 35px rgba(0,0,0,.09);
    background: white;
}

.card-icon {
    width: 62px;
    height: 62px;
    background: #f8e8e9;
    color: #8b171c;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 28px;
    margin-bottom: 22px;
}

.card h3 {
    color: #152d4b;
    font-size: 22px;
    margin-bottom: 12px;
    font-family: 'Playfair Display', serif;
}

.card p {
    color: #747b85;
    font-size: 15px;
    line-height: 1.8;
}

/* ================= FACILITIES ================= */
.facilities-section {
    background: #f6f7f9;
}

.facility-cards {
    max-width: 1150px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 22px;
}

.facility-card {
    background: white;
    padding: 35px 22px;
    text-align: center;
    border-bottom: 4px solid transparent;
    box-shadow: 0 8px 30px rgba(0,0,0,.06);
    transition: .3s;
}

.facility-card:hover {
    transform: translateY(-8px);
    border-bottom-color: #8b171c;
    box-shadow: 0 15px 35px rgba(0,0,0,.10);
}

.facility-icon {
    width: 62px;
    height: 62px;
    background: #f8e8e9;
    color: #8b171c;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 26px;
    margin: 0 auto 20px;
}

.facility-card h3 {
    color: #152d4b;
    font-size: 18px;
    margin-bottom: 10px;
}

.facility-card p {
    color: #747b85;
    font-size: 14px;
    line-height: 1.7;
}

/* ================= HIGHLIGHT ================= */
.highlight-section {
    background: white;
}

.highlight {
    max-width: 1150px;
    margin: auto;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 50px;
    align-items: center;
}

.highlight img {
    width: 100%;
    height: 360px;
    object-fit: cover;
}

.highlight-content h3 {
    font-family: 'Playfair Display', serif;
    font-size: 30px;
    color: #152d4b;
    margin-bottom: 18px;
}

.highlight-content p {
    color: #686f79;
    line-height: 1.9;
    margin-bottom: 18px;
}

/* ================= CTA ================= */
.cta {
    background:
        linear-gradient(rgba(21,45,75,.93), rgba(21,45,75,.93)),
        url("https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=1600&q=80")
        center/cover;
    color: white;
    text-align: center;
    padding: 80px 20px;
}

.cta h2 {
    font-family: 'Playfair Display', serif;
    font-size: 40px;
    margin-bottom: 15px;
}

.cta p {
    opacity: .9;
    margin-bottom: 25px;
    max-width: 650px;
    margin-left: auto;
    margin-right: auto;
}

/* ================= FOOTER ================= */
footer {
    background: #0c1d31;
    color: white;
    padding: 45px 5% 25px;
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
    .facility-cards {
        grid-template-columns: repeat(2, 1fr);
    }
    .page-banner h1 {
        font-size: 42px;
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
        padding: 12px 4%;
        flex-direction: column;
        gap: 12px;
    }
    .logo {
        justify-content: center;
    }
    .logo-text strong {
        font-size: 18px;
    }
    .logo-text span {
        font-size: 10px;
        letter-spacing: 1px;
    }
    nav {
        flex-wrap: wrap;
        justify-content: center;
        gap: 3px;
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
        min-height: 300px;
    }
    .page-banner h1 {
        font-size: 34px;
    }
    .section {
        padding: 60px 4%;
    }
    .section-title {
        font-size: 32px;
    }
    .about {
        grid-template-columns: 1fr;
        gap: 40px;
    }
    .about-image img {
        height: 300px;
    }
    .person-card {
        flex-direction: column;
        text-align: center;
        padding: 30px 25px;
        gap: 25px;
    }
    .person-photo {
        width: 150px;
        height: 150px;
    }
    .cards {
        grid-template-columns: 1fr;
    }
    .facility-cards {
        grid-template-columns: 1fr;
    }
    .highlight {
        grid-template-columns: 1fr;
        gap: 35px;
    }
    .highlight img {
        height: 280px;
    }
    .footer-content {
        grid-template-columns: 1fr;
        gap: 30px;
    }
    .cta h2 {
        font-size: 30px;
    }
}

</style>
</head>

<body>

<!-- ================= TOP RUNNING LINE ================= -->
<div class="top-bar">
    <div class="top-label">IMPORTANT</div>
    <div class="marquee-wrapper">
        <div class="marquee">
            <span>Welcome to Modern Life Public School — Quality Education • Strong Values • Bright Future</span>
            <span>Admissions are open — Visit our school for more information</span>
            <span>Stay connected with Modern Life Public School for latest notices and updates</span>
        </div>
    </div>
</div>

<!-- ================= HEADER ================= -->
<header>
    <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
        <div class="logo-icon">
            <img src="${pageContext.request.contextPath}/images/logo.jpeg" alt="Logo">
        </div>
        <div class="logo-text">
            <strong>Modern Life Public School</strong>
            <span>Education • Excellence • Values</span>
        </div>
    </a>

    <nav>
        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
        <a href="${pageContext.request.contextPath}/about.jsp" class="active">About</a>
        <a href="${pageContext.request.contextPath}/academics.jsp">Academics</a>

        <!-- ================= ADMISSIONS DROPDOWN ================= -->
        <div class="dropdown">
            <button class="dropbtn" type="button">
                Admissions
                <i class="fas fa-chevron-down"></i>
            </button>

            <div class="dropdown-menu">
                <a href="https://wa.me/918433220079?text=Hello%20Modern%20Life%20Public%20School,%20I%20want%20to%20know%20about%20admission"
                   target="_blank">
                    <i class="fas fa-paper-plane"></i>
                    <span>Apply For Admission</span>
                </a>

                <a href="${pageContext.request.contextPath}/admissions.jsp#process">
                    <i class="fas fa-list-check"></i>
                    <span>Admission Process</span>
                </a>

                <a href="${pageContext.request.contextPath}/admissions.jsp#scholarships">
                    <i class="fas fa-award"></i>
                    <span>Scholarships</span>
                </a>
            </div>
        </div>

        <a href="${pageContext.request.contextPath}/notice?action=public">Notice</a>
        <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>

        <a class="nav-apply"
           href="https://wa.me/918433220079?text=Hello%20Modern%20Life%20Public%20School,%20I%20want%20to%20apply%20for%20admission"
           target="_blank">
            Apply Now
        </a>
    </nav>
</header>

<!-- ================= PAGE BANNER ================= -->
<section class="page-banner">
    <div class="banner-content">
        <div class="banner-small">Modern Life Public School</div>
        <h1>About Us</h1>
        <p>Know more about our school, vision and values</p>
    </div>
</section>

<!-- ================= ABOUT INTRO ================= -->
<section class="section about-section">
    <div class="section-header">
        <div class="section-label">About Our School</div>
        <h2 class="section-title">Welcome to Modern Life Public School</h2>
        <p class="section-text">
            Modern Life Public School is committed to providing quality education
            in a safe, supportive and inspiring environment where every student
            can learn, grow and achieve their goals.
        </p>
    </div>

    <div class="about">
        <div class="about-image">
            <img src="https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                 alt="Modern Life Public School Students">
        </div>
        <div class="about-content">
            <h3>Building a Better Future</h3>
            <p>
                Our school focuses on academic excellence, discipline, creativity
                and overall development. We encourage students to participate in
                educational, cultural and sports activities.
            </p>
            <p>
                With dedicated teachers and a positive learning environment, we aim
                to help every student discover their potential and become confident
                individuals ready for the future.
            </p>
        </div>
    </div>
</section>

<!-- ================= MANAGER MESSAGE ================= -->
<section class="section person-section">
    <div class="section-header">
        <div class="section-label">Leadership</div>
        <h2 class="section-title">Manager's Message</h2>
    </div>
    <div class="person-wrapper">
        <div class="person-card">
            <div class="person-photo">
                <img src="${pageContext.request.contextPath}/images/manager.jpeg" alt="Manager">
            </div>
            <div class="person-info">
                <h3>Manager's Message</h3>
                <div class="person-role">From the Manager's Desk</div>
                <p>
                    At Modern Life Public School, we are committed to providing a nurturing
                    environment that supports both academic excellence and character building.
                </p>
                <p>
                    We continuously work to improve facilities, teaching methods and overall
                    school experience so that every student can reach their full potential.
                </p>
                <div class="person-name">
                    Mr. Babar Khan<br>
                    <span style="font-weight:400; color:#686f79;">Manager, Modern Life Public School</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ================= PRINCIPAL MESSAGE ================= -->
<section class="section" style="background:#ffffff; padding-top:0;">
    <div class="person-wrapper">
        <div class="person-card">
            <div class="person-photo">
                <img src="${pageContext.request.contextPath}/images/principal.jpeg" alt="Principal">
            </div>
            <div class="person-info">
                <h3>Principal's Message</h3>
                <div class="person-role">From the Principal's Desk</div>
                <p>
                    Welcome to Modern Life Public School. We believe that every child has
                    unique abilities and deserves the right guidance and opportunities to grow.
                </p>
                <p>
                    Our teachers work together to create an environment where students can
                    learn, explore and become responsible citizens with strong values.
                </p>
                <div class="person-name">
                    Miss Arshi Parveen<br>
                    <span style="font-weight:400; color:#686f79;">Principal, Modern Life Public School</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ================= VISION & MISSION ================= -->
<section class="section vision-section">
    <div class="section-header">
        <div class="section-label">Our Purpose</div>
        <h2 class="section-title">Vision & Mission</h2>
        <p class="section-text">
            We strive to shape students who are confident, knowledgeable and
            ready to contribute positively to society.
        </p>
    </div>

    <div class="cards">
        <div class="card">
            <div class="card-icon">👁️</div>
            <h3>Our Vision</h3>
            <p>
                To create confident, knowledgeable and responsible students who can
                contribute positively to society and lead meaningful lives.
            </p>
        </div>
        <div class="card">
            <div class="card-icon">🎯</div>
            <h3>Our Mission</h3>
            <p>
                To provide quality education along with discipline, moral values,
                creativity and opportunities for overall development of every student.
            </p>
        </div>
    </div>
</section>

<!-- ================= FACILITIES ================= -->
<section class="section facilities-section">
    <div class="section-header">
        <div class="section-label">Our Strengths</div>
        <h2 class="section-title">School Facilities</h2>
        <p class="section-text">
            We provide a supportive environment with facilities that help students
            learn, grow and develop their talents.
        </p>
    </div>

    <div class="facility-cards">
        <div class="facility-card">
            <div class="facility-icon">📚</div>
            <h3>Smart Classrooms</h3>
            <p>Comfortable and interactive learning spaces for better understanding.</p>
        </div>
        <div class="facility-card">
            <div class="facility-icon">📖</div>
            <h3>Library</h3>
            <p>Books and learning resources to encourage reading and knowledge.</p>
        </div>
        <div class="facility-card">
            <div class="facility-icon">⚽</div>
            <h3>Sports</h3>
            <p>Activities that support physical fitness, teamwork and discipline.</p>
        </div>
        <div class="facility-card">
            <div class="facility-icon">🛡️</div>
            <h3>Safe Environment</h3>
            <p>A friendly, secure and positive environment for every student.</p>
        </div>
    </div>
</section>

<!-- ================= HIGHLIGHT ================= -->
<section class="section highlight-section">
    <div class="highlight">
        <div>
            <img src="${pageContext.request.contextPath}/images/school.jpeg"
                 alt="School Students">
        </div>
        <div class="highlight-content">
            <h3>Learning Today, Leading Tomorrow</h3>
            <p>
                At Modern Life Public School, we believe that education should help
                students become confident, disciplined and responsible individuals.
            </p>
            <p>
                We encourage students to learn, participate, explore their abilities
                and build strong values for a successful and meaningful future.
            </p>
            <a href="${pageContext.request.contextPath}/admissions.jsp" class="btn">Explore Admissions</a>
        </div>
    </div>
</section>

<!-- ================= CTA ================= -->
<section class="cta">
    <h2>Give Your Child a Strong Start</h2>
    <p>
        Join Modern Life Public School and become a part of a community
        focused on learning, values and growth.
    </p>
    <a href="${pageContext.request.contextPath}/admissions.jsp" class="btn">Explore Admissions</a>
</section>

<!-- ================= FOOTER ================= -->
<footer>
    <div class="footer-content">
        <div class="footer-brand">
            <h2>Modern Life Public School</h2>
            <p>Quality education, strong values and a brighter future for every student.</p>
        </div>
        <div class="footer-column">
            <h3>Quick Links</h3>
            <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
            <a href="${pageContext.request.contextPath}/about.jsp">About</a>
            <a href="${pageContext.request.contextPath}/academics.jsp">Academics</a>
            <a href="${pageContext.request.contextPath}/admissions.jsp">Admissions</a>
        </div>
        <div class="footer-column">
            <h3>School</h3>
            <a href="${pageContext.request.contextPath}/notice?action=public">Notices</a>
            <a href="${pageContext.request.contextPath}/contact.jsp">Contact</a>
            <a href="https://wa.me/918433220079?text=Hello%20Modern%20Life%20Public%20School,%20I%20want%20to%20know%20about%20admission"
               target="_blank">
                Apply For Admission
            </a>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2026 Modern Life Public School. All Rights Reserved.</p>
    </div>
</footer>

</body>
</html>