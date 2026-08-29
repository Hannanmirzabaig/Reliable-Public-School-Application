<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admissions - Reliable Public School</title>

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


/* =========================================================
   ADMISSION DROPDOWN
   ========================================================= */

.dropdown {
    position: relative;
}


/* IMPORTANT:
   Arrow is ALWAYS visible.
*/

.dropdown .dropbtn {
    display: flex;
    align-items: center;
    gap: 5px;
}


/* ALWAYS SHOW ARROW */

.dropdown .dropbtn i {
    display: inline-block !important;
    visibility: visible !important;
    opacity: 1 !important;

    color: #333 !important;
    font-size: 11px !important;

    width: auto !important;
    height: auto !important;

    margin-left: 5px;

    transform: rotate(0deg) !important;

    transition: transform .3s ease, color .3s ease;
}


/* ARROW ROTATES WHEN DROPDOWN IS OPEN/HOVERED */

.dropdown:hover .dropbtn i,
.dropdown:focus-within .dropbtn i {

    transform: rotate(180deg) !important;
    color: #8b171c !important;
}


/* ================= DROPDOWN MENU ================= */

.dropdown-menu {

    position: absolute;
    top: 100%;
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

    transition:
        opacity .25s ease,
        transform .25s ease,
        visibility .25s ease;

    z-index: 2000;
}


/* OPEN DROPDOWN ON HOVER */

.dropdown:hover .dropdown-menu,
.dropdown:focus-within .dropdown-menu {

    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}


/* ================= DROPDOWN LINKS ================= */

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


/* ================= COMMON SECTION ================= */

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


/* ================= ADMISSION CARDS ================= */

.cards {

    max-width: 1150px;

    margin: auto;

    display: grid;

    grid-template-columns: repeat(2, 1fr);

    gap: 25px;
}

.card {

    background: #f6f7f9;

    padding: 38px 35px;

    border-bottom: 4px solid transparent;

    box-shadow: 0 8px 30px rgba(0,0,0,.05);

    transition: .3s;
}

.card:hover {

    transform: translateY(-6px);

    border-bottom-color: #8b171c;

    background: white;

    box-shadow: 0 15px 35px rgba(0,0,0,.09);
}

.card-icon {

    width: 62px;
    height: 62px;

    background: #f8e8e9;

    color: #8b171c;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 27px;

    margin-bottom: 20px;
}

.card h3 {

    color: #152d4b;

    font-family: 'Playfair Display', serif;

    font-size: 23px;

    margin-bottom: 15px;
}

.card p {

    color: #747b85;

    font-size: 15px;

    line-height: 1.85;
}

.card ul {

    padding-left: 20px;

    color: #747b85;
}

.card li {

    margin-bottom: 9px;

    font-size: 14.5px;
}


/* ================= PROCESS ================= */

.process-section {

    background: #f6f7f9;
}

.process {

    max-width: 1050px;

    margin: auto;

    display: grid;

    grid-template-columns: repeat(4, 1fr);

    gap: 20px;
}

.process-step {

    background: white;

    padding: 30px 20px;

    text-align: center;

    box-shadow: 0 7px 25px rgba(0,0,0,.05);

    position: relative;

    transition: .3s;
}

.process-step:hover {

    transform: translateY(-7px);

    box-shadow: 0 15px 35px rgba(0,0,0,.09);
}

.step-number {

    width: 52px;
    height: 52px;

    margin: 0 auto 17px;

    border-radius: 50%;

    background: #8b171c;

    color: white;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 19px;

    font-weight: 700;
}

.process-step h3 {

    color: #152d4b;

    font-size: 17px;

    margin-bottom: 9px;
}

.process-step p {

    color: #747b85;

    font-size: 13.5px;

    line-height: 1.7;
}


/* ================= DOCUMENTS ================= */

.documents-section {

    background: white;
}

.documents {

    max-width: 900px;

    margin: auto;

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 22px;
}

.document-item {

    display: flex;

    align-items: center;

    gap: 15px;

    background: #f6f7f9;

    padding: 20px;

    border-left: 4px solid #8b171c;

    transition: .3s;
}

.document-item:hover {

    transform: translateX(5px);

    background: #fff;

    box-shadow: 0 8px 25px rgba(0,0,0,.06);
}

.document-item i {

    color: #8b171c;

    font-size: 22px;

    width: 30px;

    text-align: center;
}

.document-item span {

    color: #555d68;

    font-size: 14px;
}


/* ================= SCHOLARSHIP ================= */

.scholarship-section {

    background: #f6f7f9;
}

.scholarship {

    max-width: 950px;

    margin: auto;

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 25px;
}

.scholarship-card {

    background: white;

    padding: 35px;

    box-shadow: 0 8px 30px rgba(0,0,0,.05);

    border-top: 4px solid #8b171c;

    transition: .3s;
}

.scholarship-card:hover {

    transform: translateY(-6px);

    box-shadow: 0 15px 35px rgba(0,0,0,.09);
}

.scholarship-card i {

    font-size: 30px;

    color: #d6a645;

    margin-bottom: 17px;
}

.scholarship-card h3 {

    font-family: 'Playfair Display', serif;

    color: #152d4b;

    font-size: 22px;

    margin-bottom: 12px;
}

.scholarship-card p {

    color: #747b85;

    font-size: 14.5px;

    line-height: 1.8;
}


/* ================= WHATSAPP CTA ================= */

.cta {

    background:
        linear-gradient(
            rgba(21,45,75,.94),
            rgba(21,45,75,.94)
        ),
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

    max-width: 680px;

    margin-left: auto;

    margin-right: auto;
}

.whatsapp-btn {

    display: inline-flex;

    align-items: center;

    gap: 10px;

    background: #25D366;

    color: white;

    padding: 14px 28px;

    text-decoration: none;

    border-radius: 4px;

    font-size: 14px;

    font-weight: 600;

    transition: .3s;
}

.whatsapp-btn:hover {

    background: #1da851;

    transform: translateY(-3px);
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

    .process {

        grid-template-columns: repeat(2, 1fr);
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


    /* MOBILE DROPDOWN */

    .dropdown {

        position: static;
    }

    .dropdown-menu {

        position: absolute;

        left: 50%;

        top: 100%;

        transform: translate(-50%, 8px);

        min-width: 220px;
    }

    .dropdown:hover .dropdown-menu,
    .dropdown:focus-within .dropdown-menu {

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

    .cards {

        grid-template-columns: 1fr;
    }

    .process {

        grid-template-columns: 1fr;
    }

    .documents {

        grid-template-columns: 1fr;
    }

    .scholarship {

        grid-template-columns: 1fr;
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


<!-- ========================================================= -->
<!-- TOP NOTICE BAR -->
<!-- ========================================================= -->

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


<!-- ========================================================= -->
<!-- HEADER -->
<!-- ========================================================= -->

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

    <!-- IMPORTANT:
         active class intentionally removed
         Arrow will always remain visible
    -->

    <button class="dropbtn"
            type="button">

        Admissions

        <i class="fas fa-chevron-down"></i>

    </button>


    <div class="dropdown-menu">


        <!-- APPLY FOR ADMISSION -->

        <a href="https://wa.me/919211932480?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20know%20about%20admission"
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


<a href="${pageContext.request.contextPath}/contact.jsp">
    Contact
</a>


<!-- APPLY NOW -->

<a class="nav-apply"
   href="https://wa.me/919211932480?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20apply%20for%20admission"
   target="_blank">

    Apply Now

</a>


</nav>

</header>


<!-- ========================================================= -->
<!-- PAGE BANNER -->
<!-- ========================================================= -->

<section class="page-banner">

<div class="banner-content">

    <div class="banner-small">
        Reliable Public School
    </div>

    <h1>
        Admissions
    </h1>

    <p>
        Begin your child's journey with us
    </p>

</div>

</section>


<!-- ========================================================= -->
<!-- INTRO -->
<!-- ========================================================= -->

<section class="section intro-section">

<div class="section-header">

    <div class="section-label">
        Admissions
    </div>

    <h2 class="section-title">
        Welcome to Reliable Public School
    </h2>

    <p class="section-text">

        We welcome students who are ready to learn, grow,
        explore their potential and build a bright future.

    </p>

</div>


<div class="intro">

<p>

    At Reliable Public School, we believe that admission is
    the beginning of an important journey for every child
    and family. Our aim is to make the admission process
    simple, transparent and welcoming.

</p>

</div>

</section>


<!-- ========================================================= -->
<!-- ADMISSION OVERVIEW -->
<!-- ========================================================= -->

<section class="section process-section">

<div class="section-header">

    <div class="section-label">
        Admission Information
    </div>

    <h2 class="section-title">
        Begin Your Journey With Us
    </h2>

    <p class="section-text">

        Learn about the admission process, required documents
        and opportunities available for students.

    </p>

</div>


<div class="cards">


<!-- ADMISSION PROCESS CARD -->

<div class="card">

    <div class="card-icon">

        <i class="fas fa-clipboard-list"></i>

    </div>

    <h3>
        Admission Process
    </h3>

    <p>

        Our admission procedure is designed to make the
        process convenient for parents and students.
        Contact the school and complete the required
        registration and documentation.

    </p>

</div>


<!-- DOCUMENT CARD -->

<div class="card">

    <div class="card-icon">

        <i class="fas fa-folder-open"></i>

    </div>

    <h3>
        Documents Required
    </h3>

    <ul>

        <li>
            Student Birth Certificate
        </li>

        <li>
            Passport Size Photographs
        </li>

        <li>
            Previous School Report Card
        </li>

        <li>
            Transfer Certificate, if applicable
        </li>

        <li>
            Parent / Guardian ID Proof
        </li>

    </ul>

</div>


</div>

</section>


<!-- ========================================================= -->
<!-- ADMISSION PROCESS -->
<!-- ========================================================= -->

<section class="section" id="process">

<div class="section-header">

    <div class="section-label">
        How It Works
    </div>

    <h2 class="section-title">
        Admission Process
    </h2>

    <p class="section-text">

        Follow these simple steps to begin the admission journey
        at Reliable Public School.

    </p>

</div>


<div class="process">


<!-- STEP 1 -->

<div class="process-step">

    <div class="step-number">
        1
    </div>

    <h3>
        Enquiry
    </h3>

    <p>

        Contact the school through WhatsApp or visit the
        school office to enquire about admission.

    </p>

</div>


<!-- STEP 2 -->

<div class="process-step">

    <div class="step-number">
        2
    </div>

    <h3>
        Registration
    </h3>

    <p>

        Complete the required registration and provide
        the necessary student information.

    </p>

</div>


<!-- STEP 3 -->

<div class="process-step">

    <div class="step-number">
        3
    </div>

    <h3>
        Documents
    </h3>

    <p>

        Submit the required documents and previous
        academic records to the school.

    </p>

</div>


<!-- STEP 4 -->

<div class="process-step">

    <div class="step-number">
        4
    </div>

    <h3>
        Confirmation
    </h3>

    <p>

        Complete the final admission formalities and
        confirm your child's admission.

    </p>

</div>


</div>

</section>


<!-- ========================================================= -->
<!-- DOCUMENTS -->
<!-- ========================================================= -->

<section class="section documents-section">

<div class="section-header">

    <div class="section-label">
        Required Documents
    </div>

    <h2 class="section-title">
        Documents Required For Admission
    </h2>

    <p class="section-text">

        Parents are requested to keep the following documents
        ready during the admission process.

    </p>

</div>


<div class="documents">


<div class="document-item">

    <i class="fas fa-certificate"></i>

    <span>
        Student Birth Certificate
    </span>

</div>


<div class="document-item">

    <i class="fas fa-image"></i>

    <span>
        Passport Size Photographs
    </span>

</div>


<div class="document-item">

    <i class="fas fa-file-lines"></i>

    <span>
        Previous School Report Card
    </span>

</div>


<div class="document-item">

    <i class="fas fa-right-left"></i>

    <span>
        Transfer Certificate, if applicable
    </span>

</div>


<div class="document-item">

    <i class="fas fa-id-card"></i>

    <span>
        Parent / Guardian ID Proof
    </span>

</div>


<div class="document-item">

    <i class="fas fa-file-circle-check"></i>

    <span>
        Other Documents as requested by the school
    </span>

</div>


</div>

</section>


<!-- ========================================================= -->
<!-- SCHOLARSHIPS -->
<!-- ========================================================= -->

<section class="section scholarship-section"
         id="scholarships">

<div class="section-header">

    <div class="section-label">
        Student Opportunities
    </div>

    <h2 class="section-title">
        Scholarships
    </h2>

    <p class="section-text">

        The school may provide opportunities to recognise
        academic achievement, sports performance and student
        excellence.

    </p>

</div>


<div class="scholarship">


<div class="scholarship-card">

    <i class="fas fa-graduation-cap"></i>

    <h3>
        Academic Excellence
    </h3>

    <p>

        Students demonstrating strong academic performance
        may be considered for recognition or scholarship
        opportunities according to school policies.

    </p>

</div>


<div class="scholarship-card">

    <i class="fas fa-medal"></i>

    <h3>
        Sports & Talent
    </h3>

    <p>

        Students showing outstanding performance in sports,
        competitions or other activities may receive
        recognition according to applicable school policies.

    </p>

</div>


</div>

</section>


<!-- ========================================================= -->
<!-- WHATSAPP CTA -->
<!-- ========================================================= -->

<section class="cta">

<h2>
    Ready to Apply?
</h2>

<p>

    Contact Reliable Public School directly on WhatsApp
    for admission enquiries and further information.

</p>


<a class="whatsapp-btn"
   href="https://wa.me/919211932480?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20know%20about%20admission"
   target="_blank">

    <i class="fab fa-whatsapp"></i>

    Apply For Admission

</a>

</section>


<!-- ========================================================= -->
<!-- FOOTER -->
<!-- ========================================================= -->

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

    <a href="https://wa.me/919211932480?text=Hello%20Reliable%20Public%20School,%20I%20want%20to%20know%20about%20admission"
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

