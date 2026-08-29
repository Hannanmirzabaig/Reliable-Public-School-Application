<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Reliable Public School</title>

<!-- Google Fonts -->

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

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
    height: 88px;
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

nav a {
    color: #333;
    text-decoration: none;
    padding: 11px 15px;
    font-size: 14px;
    font-weight: 500;
    transition: .3s;
    position: relative;
}

nav a::after {
    content: "";
    position: absolute;
    bottom: 3px;
    left: 15px;
    width: 0;
    height: 2px;
    background: #8b171c;
    transition: .3s;
}

nav a:hover {
    color: #8b171c;
}

nav a:hover::after {
    width: calc(100% - 30px);
}

.nav-admission {
    background: #8b171c;
    color: white !important;
    border-radius: 4px;
    margin-left: 8px;
    padding: 11px 20px;
}

.nav-admission:hover {
    background: #651014;
}

.nav-admission::after {
    display: none;
}


/* ================= HERO ================= */

.hero {
    min-height: 650px;

    background:
        linear-gradient(
            rgba(8, 27, 49, .60),
            rgba(8, 27, 49, .70)
        ),
        url("https://images.unsplash.com/photo-1580582932707-520aed937b7b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80")
        center/cover no-repeat;

    display: flex;
    align-items: center;
    position: relative;
}


/* Decorative bottom shape */

.hero::after {
    content: "";
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 80px;
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

.hero-content {
    width: 90%;
    max-width: 1150px;
    margin: auto;
    color: white;
    padding: 80px 0;
    position: relative;
    z-index: 2;
}

.hero-small {
    font-size: 15px;
    text-transform: uppercase;
    letter-spacing: 3px;
    margin-bottom: 15px;
    color: #f3d08b;
    font-weight: 600;
}

.hero h1 {
    max-width: 850px;
    font-family: 'Playfair Display', serif;
    font-size: 62px;
    line-height: 1.15;
    margin-bottom: 20px;
}

.hero p {
    max-width: 700px;
    font-size: 19px;
    opacity: .95;
    margin-bottom: 35px;
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
    padding: 90px 6%;
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
    font-size: 42px;
    line-height: 1.2;
    margin-bottom: 18px;
}

.section-text {
    color: #6d7480;
    font-size: 16px;
    line-height: 1.9;
}


/* ================= ABOUT ================= */

.about-section {
    background: #ffffff;
}

.about {
    max-width: 1150px;
    margin: auto;
    display: grid;
    grid-template-columns: 1.05fr .95fr;
    gap: 65px;
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


/* ================= WHY CHOOSE ================= */

.why-section {
    background: #f6f7f9;
}

.cards {
    max-width: 1150px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 22px;
}

.card {
    background: white;
    padding: 35px 25px;
    border-bottom: 4px solid transparent;
    box-shadow: 0 8px 30px rgba(0,0,0,.06);
    transition: .3s;
}

.card:hover {
    transform: translateY(-8px);
    border-bottom-color: #8b171c;
    box-shadow: 0 15px 35px rgba(0,0,0,.10);
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
    font-size: 19px;
    margin-bottom: 10px;
}

.card p {
    color: #747b85;
    font-size: 14px;
    line-height: 1.7;
}


/* ================= SCHOOL LIFE ================= */

.school-life {
    background: white;
}

.image-cards {
    max-width: 1150px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.image-card {
    background: white;
    box-shadow: 0 8px 30px rgba(0,0,0,.08);
    overflow: hidden;
}

.image-card-image {
    position: relative;
    overflow: hidden;
}

.image-card img {
    width: 100%;
    height: 250px;
    object-fit: cover;
    transition: .5s;
}

.image-card:hover img {
    transform: scale(1.07);
}

.image-card-content {
    padding: 25px;
}

.image-card-content h3 {
    color: #152d4b;
    font-family: 'Playfair Display', serif;
    font-size: 23px;
    margin-bottom: 8px;
}

.image-card-content p {
    color: #707781;
    font-size: 14px;
    line-height: 1.7;
}


/* ================= NOTICE ================= */

.notice-section {
    background: #f5f6f8;
}

.notice-wrapper {
    max-width: 1000px;
    margin: auto;
}

.notice-box {
    background: white;
    border-left: 5px solid #8b171c;
    padding: 28px 30px;
    margin-bottom: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,.06);
}

.notice-date {
    display: inline-block;
    background: #8b171c;
    color: white;
    font-size: 11px;
    padding: 5px 10px;
    margin-bottom: 10px;
    text-transform: uppercase;
}

.notice-box h3 {
    color: #152d4b;
    font-size: 20px;
    margin-bottom: 8px;
}

.notice-box p {
    color: #707781;
    font-size: 14px;
}


/* ================= CONTACT ================= */

.contact-section {
    background: white;
}

.contact-box {
    max-width: 1100px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.contact-item {
    text-align: center;
    padding: 35px 25px;
    background: #f7f8fa;
    border-top: 3px solid #8b171c;
}

.contact-icon {
    font-size: 30px;
    margin-bottom: 15px;
}

.contact-item h3 {
    color: #152d4b;
    margin-bottom: 8px;
    font-size: 18px;
}

.contact-item p {
    color: #707781;
    font-size: 14px;
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

    nav {
        gap: 0;
    }

    nav a {
        padding: 9px 8px;
        font-size: 12px;
    }

    .cards {
        grid-template-columns: repeat(2, 1fr);
    }

    .hero h1 {
        font-size: 48px;
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
        height: auto;
        padding: 15px 5%;
        flex-direction: column;
        gap: 15px;
    }

    nav {
        flex-wrap: wrap;
        justify-content: center;
    }

    nav a {
        padding: 7px 8px;
        font-size: 12px;
    }

    .nav-admission {
        margin-left: 0;
    }

    .hero {
        min-height: 560px;
    }

    .hero-content {
        text-align: center;
    }

    .hero h1 {
        font-size: 38px;
    }

    .hero p {
        font-size: 16px;
    }

    .section {
        padding: 65px 5%;
    }

    .section-title {
        font-size: 34px;
    }

    .about {
        grid-template-columns: 1fr;
        gap: 45px;
    }

    .about-image img {
        height: 330px;
    }

    .cards {
        grid-template-columns: 1fr;
    }

    .image-cards {
        grid-template-columns: 1fr;
    }

    .contact-box {
        grid-template-columns: 1fr;
    }

    .footer-content {
        grid-template-columns: 1fr;
        gap: 30px;
    }

    .cta h2 {
        font-size: 32px;
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
            Welcome to Reliable Public School — Quality Education • Strong Values • Bright Future
        </span>

        <span>
            Admissions are open — Visit our school for more information
        </span>

        <span>
            Stay connected with Reliable Public School for latest notices and updates
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

        <strong>Reliable Public School</strong>

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

    <a href="${pageContext.request.contextPath}/academics.jsp">
        Academics
    </a>

    <a href="${pageContext.request.contextPath}/admissions.jsp">
        Admissions
    </a>

    <a href="${pageContext.request.contextPath}/notice?action=public">
        Notice
    </a>

   <!--   <a href="${pageContext.request.contextPath}/gallery.jsp">
        Gallery
    </a>
    -->

    <a href="${pageContext.request.contextPath}/contact.jsp">
        Contact
    </a>

    <a href="${pageContext.request.contextPath}/admissions.jsp"
       class="nav-admission">
        Apply Now
    </a>

</nav>

</header>

<!-- ================= HERO ================= -->
<section class="hero">

<div class="hero-content">

    <div class="hero-small">
        Welcome to Reliable Public School
    </div>

    <h1>
        Shaping Young Minds for a Brighter Future
    </h1>

    <p>
        A nurturing learning environment where students
        grow with knowledge, confidence, discipline and values.
    </p>

    <a href="about.jsp" class="btn">
        Explore School
    </a>

    <a href="admissions.jsp" class="btn btn-outline">
        Admissions
    </a>

</div>


</section>

<!-- ================= ABOUT ================= -->

<section class="section about-section">

<div class="section-header">

    <div class="section-label">
        About Our School
    </div>

    <h2 class="section-title">
        Welcome to Reliable Public School
    </h2>

    <p class="section-text">
        Reliable Public School is committed to providing
        quality education in a safe, supportive and inspiring
        environment where every student can learn, grow and
        achieve their goals.
    </p>

</div>


<div class="about">

    <div class="about-image">

        <img
        src="https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
        alt="Reliable Public School Students">

    </div>


    <div class="about-content">

        <h3>
            Building a Better Future
        </h3>

        <p>
            Our school focuses on academic excellence,
            discipline, creativity and overall development.
            We encourage students to participate in educational,
            cultural and sports activities.
        </p>

        <p>
            With dedicated teachers and a positive learning
            environment, we aim to help every student discover
            their potential and become confident individuals.
        </p>

        <a href="about.jsp" class="btn">
            Read More
        </a>

    </div>

</div>


</section>

<!-- ================= WHY CHOOSE US ================= -->

<section class="section why-section">


<div class="section-header">

    <div class="section-label">
        Our Strengths
    </div>

    <h2 class="section-title">
        Why Choose Reliable Public School?
    </h2>

    <p class="section-text">
        We provide students with the right environment
        to develop knowledge, confidence and strong values.
    </p>

</div>


<div class="cards">


    <div class="card">

        <div class="card-icon">
            📚
        </div>

        <h3>
            Quality Education
        </h3>

        <p>
            Strong academic foundations with
            student-focused learning and guidance.
        </p>

    </div>


    <div class="card">

        <div class="card-icon">
            👨‍🏫
        </div>

        <h3>
            Experienced Teachers
        </h3>

        <p>
            Dedicated teachers who guide students
            towards knowledge and success.
        </p>

    </div>


    <div class="card">

        <div class="card-icon">
            🛡️
        </div>

        <h3>
            Safe Environment
        </h3>

        <p>
            A safe, friendly and positive environment
            for every student.
        </p>

    </div>


    <div class="card">

        <div class="card-icon">
            🌟
        </div>

        <h3>
            Overall Development
        </h3>

        <p>
            Focus on academics, sports, culture
            and creative activities.
        </p>

    </div>


</div>

</section>

<!-- ================= SCHOOL LIFE ================= -->

<section class="section school-life">

<div class="section-header">

    <div class="section-label">
        Life At School
    </div>

    <h2 class="section-title">
        Learning Beyond Classrooms
    </h2>

    <p class="section-text">
        School life at Reliable Public School encourages
        curiosity, creativity, teamwork and confidence.
    </p>

</div>


<div class="image-cards">


    <div class="image-card">

        <div class="image-card-image">

            <img
            src="https://images.unsplash.com/photo-1509062522246-3755977927d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
            alt="Classroom">

        </div>

        <div class="image-card-content">

            <h3>
                Smart Learning
            </h3>

            <p>
                Interactive and engaging classroom
                learning experiences.
            </p>

        </div>

    </div>



    <div class="image-card">

        <div class="image-card-image">

            <img
            src="https://images.unsplash.com/photo-1577896851221-b593f1b54ac0?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
            alt="School Activity">

        </div>

        <div class="image-card-content">

            <h3>
                Activities
            </h3>

            <p>
                Students participate in cultural,
                sports and creative activities.
            </p>

        </div>

    </div>



    <div class="image-card">

        <div class="image-card-image">

            <img
            src="https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
            alt="School Campus">

        </div>

        <div class="image-card-content">

            <h3>
                School Campus
            </h3>

            <p>
                A positive environment designed
                for learning and growth.
            </p>

        </div>

    </div>


</div>


</section>

<!-- ================= NOTICE ================= -->

<section class="section notice-section">


<div class="section-header">

    <div class="section-label">
        Stay Updated
    </div>

    <h2 class="section-title">
        Latest Notices
    </h2>

    <p class="section-text">
        Stay updated with the latest announcements
        from Reliable Public School.
    </p>

</div>


<div class="notice-wrapper">

    <div class="notice-box">

        <div class="notice-date">
            School Updates
        </div>

        <h3>
            Visit Our Notice Board
        </h3>

        <p>
            Check the latest school announcements,
            examination information, events and
            important updates.
        </p>

    </div>


    <div style="text-align:center; margin-top:30px;">

        <a href="${pageContext.request.contextPath}/notice?action=public"
           class="btn">

            View All Notices

        </a>

    </div>

</div>


</section>

<!-- ================= CONTACT ================= -->

<section class="section contact-section">


<div class="section-header">

    <div class="section-label">
        Get In Touch
    </div>

    <h2 class="section-title">
        Contact Us
    </h2>

    <p class="section-text">
        Have questions? Feel free to contact
        Reliable Public School.
    </p>

</div>


<div class="contact-box">


    <div class="contact-item">

        <div class="contact-icon">
            📍
        </div>

        <h3>
            Address
        </h3>

        <p>
            Reliable Public School
        </p>

    </div>



    <div class="contact-item">

        <div class="contact-icon">
            📞
        </div>

        <h3>
            Phone
        </h3>

        <p>
            +91 XXXXX XXXXX
        </p>

    </div>



    <div class="contact-item">

        <div class="contact-icon">
            ✉️
        </div>

        <h3>
            Email
        </h3>

        <p>
            info@reliablepublicschool.com
        </p>

    </div>


</div>


<div style="text-align:center; margin-top:35px;">

    <a href="contact.jsp" class="btn">
        Contact Us
    </a>

</div>


</section>

<!-- ================= ADMISSION CTA ================= -->

<section class="cta">

<h2>
    Give Your Child a Strong Start
</h2>

<p>
    Join Reliable Public School and become a part
    of a community focused on learning and growth.
</p>

<a href="admissions.jsp" class="btn">
    Explore Admissions
</a>


</section>

<!-- ================= FOOTER ================= -->

<footer>


<div class="footer-content">


    <div class="footer-brand">

        <h2>
            Reliable Public School
        </h2>

        <p>
            Quality education, strong values and
            a brighter future for every student.
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
