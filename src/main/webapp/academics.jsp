<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Academics - Modern Life Public School</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700&display=swap"
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
        linear-gradient(
            rgba(8, 27, 49, .60),
            rgba(8, 27, 49, .70)
        ),
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


/* ================= MAIN CONTAINER ================= */

.container {
    max-width: 1180px;
    margin: auto;
    padding: 90px 25px;
}


/* ================= INTRO ================= */

.intro {
    max-width: 900px;
    margin: 0 auto 80px;
    text-align: center;
    color: #6d7480;
    font-size: 17px;
    line-height: 1.9;
}


/* ================= SECTION ================= */

.section {
    margin-bottom: 90px;
}

.section-heading {
    text-align: center;
    margin-bottom: 45px;
}

.section-heading span {
    display: block;
    color: #8b171c;
    font-size: 12px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    margin-bottom: 10px;
}

.section-heading h2 {
    font-family: 'Playfair Display', serif;
    color: #152d4b;
    font-size: 36px;
    margin-bottom: 12px;
}

.section-heading p {
    max-width: 720px;
    margin: auto;
    color: #6d7480;
    font-size: 15px;
}


/* ================= PURPOSE ================= */

.purpose {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 55px;
    align-items: center;
}

.purpose-image {
    min-height: 390px;

    background:
        linear-gradient(
            rgba(18,60,115,0.15),
            rgba(18,60,115,0.15)
        ),
        url("https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&w=1000&q=80")
        center/cover no-repeat;

    box-shadow: 0 15px 35px rgba(0,0,0,0.12);
}

.purpose-content h3 {
    font-family: 'Playfair Display', serif;
    color: #152d4b;
    font-size: 30px;
    margin-bottom: 18px;
}

.purpose-content p {
    color: #686f79;
    font-size: 15px;
    line-height: 1.9;
    margin-bottom: 16px;
}


/* ================= APPROACH ================= */

.approach-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 25px;
}

.approach-card {
    padding: 35px;
    border: 1px solid #e5e7eb;
    background: #fff;
    transition: .3s;
    position: relative;
    overflow: hidden;
}

.approach-card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 4px;
    background: #8b171c;
}

.approach-card:hover {
    transform: translateY(-7px);
    box-shadow: 0 15px 35px rgba(139,23,28,0.12);
}

.approach-icon {
    width: 55px;
    height: 55px;
    background: #f8e8e9;
    color: #8b171c;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    margin-bottom: 20px;
}

.approach-card h3 {
    color: #152d4b;
    font-size: 19px;
    margin-bottom: 10px;
}

.approach-card p {
    color: #6d7480;
    font-size: 14.5px;
    line-height: 1.8;
}


/* ================= CURRICULUM ================= */

.curriculum {
    background: #f6f7f9;
    padding: 65px 45px;
}

.curriculum-content {
    max-width: 900px;
    margin: auto;
    text-align: center;
}

.curriculum-content p {
    color: #6d7480;
    font-size: 15.5px;
    line-height: 1.9;
    margin-bottom: 25px;
}

.curriculum-points {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-top: 35px;
}

.curriculum-point {
    background: white;
    padding: 25px 20px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.05);
}

.curriculum-point i {
    font-size: 25px;
    color: #8b171c;
    margin-bottom: 12px;
}

.curriculum-point h3 {
    color: #152d4b;
    font-size: 17px;
    margin-bottom: 7px;
}

.curriculum-point p {
    font-size: 13.5px;
    margin: 0;
}


/* ================= SUPPORT ================= */

.support-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.support-card {
    padding: 32px 27px;
    background: white;
    border: 1px solid #e5e7eb;
    transition: .3s;
}

.support-card:hover {
    transform: translateY(-7px);
    box-shadow: 0 15px 35px rgba(139,23,28,0.10);
}

.support-card i {
    color: #8b171c;
    font-size: 27px;
    margin-bottom: 18px;
}

.support-card h3 {
    color: #152d4b;
    font-size: 18px;
    margin-bottom: 10px;
}

.support-card p {
    color: #6d7480;
    font-size: 14px;
    line-height: 1.8;
}


/* ================= STUDENT SUCCESS ================= */

.success {
    background:
        linear-gradient(
            rgba(21,45,75,.93),
            rgba(21,45,75,.93)
        ),
        url("https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=1600&q=80")
        center/cover;

    padding: 70px 45px;
    text-align: center;
    color: white;
}

.success i {
    font-size: 38px;
    color: #f3d08b;
    margin-bottom: 18px;
}

.success h2 {
    font-family: 'Playfair Display', serif;
    font-size: 38px;
    margin-bottom: 18px;
}

.success p {
    max-width: 850px;
    margin: auto;
    color: rgba(255,255,255,0.88);
    font-size: 15.5px;
    line-height: 1.9;
}


/* ================= CTA ================= */

.cta {
    background:
        linear-gradient(
            rgba(21,45,75,.93),
            rgba(21,45,75,.93)
        ),
        url("https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=1600&q=80")
        center/cover;

    color: white;
    text-align: center;
    padding: 80px 20px;
}

.cta h2 {
    font-family: 'Playfair Display', serif;
    font-size: 42px;
    margin-bottom: 15px;
}

.cta p {
    opacity: .9;
    margin-bottom: 25px;
    max-width: 650px;
    margin-left: auto;
    margin-right: auto;
}


/* ================= BUTTON ================= */

.btn {
    display: inline-block;
    background: #8b171c;
    color: white;
    padding: 13px 27px;
    text-decoration: none;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 600;
    transition: .3s;
    border: 2px solid #8b171c;
}

.btn:hover {
    background: #651014;
    border-color: #651014;
    transform: translateY(-2px);
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
        font-size: 36px;
    }

    .container {
        padding: 65px 5%;
    }

    .purpose {
        grid-template-columns: 1fr;
        gap: 40px;
    }

    .purpose-image {
        min-height: 330px;
    }

    .approach-grid {
        grid-template-columns: 1fr;
    }

    .curriculum {
        padding: 45px 25px;
    }

    .curriculum-points {
        grid-template-columns: 1fr;
    }

    .support-grid {
        grid-template-columns: 1fr;
    }

    .success {
        padding: 50px 25px;
    }

    .success h2 {
        font-size: 32px;
    }

    .cta h2 {
        font-size: 32px;
    }

    .footer-content {
        grid-template-columns: 1fr;
        gap: 30px;
    }
}

</style>
</head>

<body>


<!-- ================= TOP RUNNING LINE ================= -->

<div class="top-bar">

    <div class="top-label">
        IMPORTANT
    </div>

    <div class="marquee-wrapper">

        <div class="marquee">

            <span>
                Welcome to Modern Life Public School — Quality Education • Strong Values • Bright Future
            </span>

            <span>
                Admissions are open — Visit our school for more information
            </span>

            <span>
                Stay connected with Modern Life Public School for latest notices and updates
            </span>

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

        <a href="${pageContext.request.contextPath}/index.jsp">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/about.jsp">
            About
        </a>

        <a href="${pageContext.request.contextPath}/academics.jsp"
           class="active">
            Academics
        </a>

        <div class="dropdown">

            <button class="dropbtn">
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

        <a href="${pageContext.request.contextPath}/notice?action=public">
            Notice
        </a>

        <a href="${pageContext.request.contextPath}/contact.jsp">
            Contact
        </a>

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

        <div class="banner-small">
            Modern Life Public School
        </div>

        <h1>
            Academics
        </h1>

        <p>
            Inspiring learning. Building knowledge. Shaping futures.
        </p>

    </div>

</section>


<!-- ================= MAIN ================= -->

<div class="container">


    <!-- ================= INTRO ================= -->

    <p class="intro">

        At Modern Life Public School, academics are designed to provide
        students with strong foundations, meaningful learning
        experiences and the confidence to face the future.

        We believe education should encourage curiosity, independent
        thinking, creativity and a lifelong love for learning.

    </p>


    <!-- ================= LEARNING WITH PURPOSE ================= -->

    <section class="section">

        <div class="section-heading">

            <span>
                Learning With Purpose
            </span>

            <h2>
                Education Beyond the Classroom
            </h2>

            <p>
                We focus on developing knowledgeable, confident and
                responsible learners.
            </p>

        </div>


        <div class="purpose">

            <div class="purpose-image">
            </div>


            <div class="purpose-content">

                <h3>
                    Learning With Purpose
                </h3>

                <p>
                    Our academic approach is designed to help students
                    understand concepts, ask meaningful questions and
                    apply their knowledge in everyday situations.
                </p>

                <p>
                    Instead of limiting learning to textbooks and
                    examinations, we encourage students to explore,
                    participate, collaborate and develop the confidence
                    to express their ideas.
                </p>

                <p>
                    Every learning experience is aimed at developing
                    both academic excellence and essential life skills.
                </p>

            </div>

        </div>

    </section>


    <!-- ================= APPROACH ================= -->

    <section class="section">

        <div class="section-heading">

            <span>
                Our Approach To Learning
            </span>

            <h2>
                A Student-Centred Approach
            </h2>

            <p>
                Our teaching practices encourage understanding,
                participation and practical application.
            </p>

        </div>


        <div class="approach-grid">


            <div class="approach-card">

                <div class="approach-icon">
                    <i class="fas fa-brain"></i>
                </div>

                <h3>
                    Beyond Rote Learning
                </h3>

                <p>
                    Students are encouraged to understand concepts,
                    develop reasoning abilities and connect academic
                    knowledge with real-life experiences.
                </p>

            </div>


            <div class="approach-card">

                <div class="approach-icon">
                    <i class="fas fa-users"></i>
                </div>

                <h3>
                    Student-Centric Learning
                </h3>

                <p>
                    Our classrooms encourage participation, discussion
                    and interaction so that students become active
                    participants in the learning process.
                </p>

            </div>


            <div class="approach-card">

                <div class="approach-icon">
                    <i class="fas fa-flask"></i>
                </div>

                <h3>
                    Experiential Learning
                </h3>

                <p>
                    Projects, activities, experiments and practical
                    experiences help students understand concepts
                    more effectively.
                </p>

            </div>


            <div class="approach-card">

                <div class="approach-icon">
                    <i class="fas fa-laptop"></i>
                </div>

                <h3>
                    Technology-Enabled Learning
                </h3>

                <p>
                    Appropriate use of digital resources and technology
                    makes learning more engaging, interactive and
                    relevant to today's world.
                </p>

            </div>


        </div>

    </section>


    <!-- ================= CURRICULUM ================= -->

    <section class="section curriculum">

        <div class="section-heading">

            <span>
                Curriculum Overview
            </span>

            <h2>
                A Balanced Academic Programme
            </h2>

            <p>
                A structured curriculum designed to support academic
                growth and overall development.
            </p>

        </div>


        <div class="curriculum-content">

            <p>
                Our curriculum provides students with a balanced
                combination of academic knowledge, practical learning,
                creativity and co-curricular experiences.
            </p>

            <p>
                The academic programme aims to build strong
                foundations while gradually developing higher-order
                thinking, problem-solving skills, communication and
                independent learning.
            </p>

        </div>


        <div class="curriculum-points">


            <div class="curriculum-point">

                <i class="fas fa-book"></i>

                <h3>
                    Strong Foundations
                </h3>

                <p>
                    Building essential knowledge and core academic
                    skills.
                </p>

            </div>


            <div class="curriculum-point">

                <i class="fas fa-lightbulb"></i>

                <h3>
                    Critical Thinking
                </h3>

                <p>
                    Encouraging students to analyse, question and
                    solve problems.
                </p>

            </div>


            <div class="curriculum-point">

                <i class="fas fa-palette"></i>

                <h3>
                    Holistic Development
                </h3>

                <p>
                    Supporting creativity, communication, confidence
                    and social development.
                </p>

            </div>


        </div>

    </section>


    <!-- ================= ACADEMIC SUPPORT ================= -->

    <section class="section">

        <div class="section-heading">

            <span>
                Academic Support & Student Growth
            </span>

            <h2>
                Supporting Every Learner
            </h2>

            <p>
                We provide guidance and opportunities to help every
                student progress with confidence.
            </p>

        </div>


        <div class="support-grid">


            <div class="support-card">

                <i class="fas fa-user-check"></i>

                <h3>
                    Individual Attention
                </h3>

                <p>
                    Teachers monitor student progress and provide
                    guidance wherever additional academic support
                    is required.
                </p>

            </div>


            <div class="support-card">

                <i class="fas fa-trophy"></i>

                <h3>
                    Beyond the Classroom
                </h3>

                <p>
                    Competitions, projects, activities and other
                    learning opportunities allow students to explore
                    their interests and talents.
                </p>

            </div>


            <div class="support-card">

                <i class="fas fa-compass"></i>

                <h3>
                    Future Readiness
                </h3>

                <p>
                    Students are encouraged to identify their strengths,
                    develop essential skills and prepare for future
                    academic and career opportunities.
                </p>

            </div>


        </div>

    </section>


    <!-- ================= STUDENT SUCCESS ================= -->

    <section class="success">

        <i class="fas fa-star"></i>

        <h2>
            Student Success
        </h2>

        <p>
            At Modern Life Public School, success is not measured only
            by marks and examinations. We aim to develop students who
            are confident learners, thoughtful individuals and
            responsible members of society. Through strong academics,
            supportive teachers and meaningful experiences, we help
            students discover their potential and prepare for the
            opportunities ahead.
        </p>

    </section>


</div>


<!-- ================= CTA ================= -->

<section class="cta">

    <h2>
        Give Your Child a Strong Start
    </h2>

    <p>
        Join Modern Life Public School and become a part of a community
        focused on learning, values and growth.
    </p>

    <a href="${pageContext.request.contextPath}/admissions.jsp"
       class="btn">
        Explore Admissions
    </a>

</section>


<!-- ================= FOOTER ================= -->

<footer>

    <div class="footer-content">


        <div class="footer-brand">

            <h2>
                Modern Life Public School
            </h2>

            <p>
                Quality education, strong values and a brighter future
                for every student.
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

            <a href="https://wa.me/918433220079?text=Hello%20Modern%20Life%20Public%20School,%20I%20want%20to%20know%20about%20admission"
               target="_blank">
                Apply For Admission
            </a>

        </div>


    </div>

    <div class="footer-bottom">

        <p>
            © 2026 Modern Life Public School. All Rights Reserved.
        </p>

    </div>

</footer>


</body>
</html>