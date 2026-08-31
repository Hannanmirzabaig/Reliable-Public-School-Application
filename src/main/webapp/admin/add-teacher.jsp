<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Add Teacher - Modern Life Public School</title>

<link rel="preconnect"
      href="https://fonts.googleapis.com">

<link rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
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

/* ================= HEADER ================= */

header {
    background: linear-gradient(135deg, #123c73, #1e4a8a);
    color: white;

    padding: 16px 5%;

    display: flex;
    justify-content: space-between;
    align-items: center;

    box-shadow: 0 5px 25px rgba(18, 60, 115, 0.20);
}

.logo {
    display: flex;
    align-items: center;
    gap: 11px;

    font-size: 21px;
    font-weight: 700;
}

.logo-icon {
    width: 42px;
    height: 42px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: rgba(255,255,255,0.14);

    border: 1px solid rgba(255,255,255,0.18);

    border-radius: 12px;
}

.logo span {
    color: #fbbf24;
}

.back-btn {
    color: white;
    text-decoration: none;

    padding: 9px 16px;

    border-radius: 9px;

    background: rgba(255,255,255,0.12);

    border: 1px solid rgba(255,255,255,0.16);

    font-size: 13px;
    font-weight: 500;

    transition: 0.3s;
}

.back-btn:hover {
    background: white;
    color: #123c73;
}

/* ================= CONTAINER ================= */

.container {
    max-width: 850px;
    margin: auto;

    padding: 45px 20px 70px;
}

/* ================= PAGE TITLE ================= */

.page-heading {
    margin-bottom: 25px;
}

.page-heading h1 {
    color: #123c73;
    font-size: 27px;
    margin-bottom: 5px;
}

.page-heading p {
    color: #64748b;
    font-size: 13px;
}

/* ================= CARD ================= */

.form-box {
    background: white;

    padding: 30px;

    border-radius: 18px;

    box-shadow:
        0 9px 30px rgba(15, 23, 42, 0.06);

    border: 1px solid #edf1f6;
}

/* ================= BOX HEADING ================= */

.box-heading {
    display: flex;
    align-items: center;

    gap: 11px;

    margin-bottom: 25px;
}

.box-icon {
    width: 44px;
    height: 44px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #eff6ff;

    color: #1d4ed8;

    border-radius: 11px;

    font-size: 17px;
}

.box-heading h2 {
    color: #123c73;
    font-size: 20px;
}

.box-heading p {
    color: #64748b;
    font-size: 11px;

    margin-top: 2px;
}

/* ================= FORM ================= */

.form-grid {
    display: grid;

    grid-template-columns: repeat(2, 1fr);

    gap: 18px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

.form-group.full {
    grid-column: 1 / -1;
}

label {
    color: #334155;

    font-size: 13px;

    font-weight: 600;

    margin-bottom: 7px;
}

label i {
    color: #1d4ed8;

    margin-right: 5px;
}

input {
    width: 100%;

    padding: 12px 14px;

    border: 1px solid #dbe2ea;

    border-radius: 10px;

    font-family: 'Poppins', sans-serif;

    font-size: 13px;

    outline: none;

    transition: 0.25s;

    background: white;
}

input:focus {
    border-color: #1d4ed8;

    box-shadow:
        0 0 0 3px rgba(29, 78, 216, 0.08);
}

/* ================= BUTTONS ================= */

.buttons {
    display: flex;

    gap: 10px;

    margin-top: 25px;
}

.btn-add {
    background:
        linear-gradient(135deg, #123c73, #1e4a8a);

    color: white;

    border: none;

    padding: 12px 22px;

    border-radius: 10px;

    cursor: pointer;

    font-family: 'Poppins', sans-serif;

    font-size: 13px;

    font-weight: 600;

    box-shadow:
        0 6px 18px rgba(18,60,115,0.20);

    transition: 0.3s;
}

.btn-add:hover {
    transform: translateY(-2px);

    box-shadow:
        0 9px 23px rgba(18,60,115,0.28);
}

.btn-cancel {
    display: inline-flex;

    align-items: center;
    justify-content: center;

    gap: 6px;

    padding: 12px 20px;

    border-radius: 10px;

    text-decoration: none;

    background: #f1f5f9;

    color: #475569;

    font-size: 13px;

    font-weight: 600;

    transition: 0.3s;
}

.btn-cancel:hover {
    background: #e2e8f0;
}

/* ================= FOOTER ================= */

footer {
    background: #0c2a52;

    color: white;

    text-align: center;

    padding: 22px;

    font-size: 12px;
}

footer p {
    opacity: 0.85;
}

/* ================= MOBILE ================= */

@media (max-width: 700px) {

    header {
        flex-direction: column;

        gap: 12px;

        padding: 15px 5%;
    }

    .logo {
        font-size: 18px;
    }

    .container {
        padding: 30px 15px 50px;
    }

    .page-heading h1 {
        font-size: 23px;
    }

    .form-box {
        padding: 22px 17px;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .form-group.full {
        grid-column: auto;
    }

    .buttons {
        flex-direction: column;
    }

    .btn-add,
    .btn-cancel {
        width: 100%;
    }
}

</style>

</head>

<body>

<!-- ================= HEADER ================= -->

<header>

    <div class="logo">

        <div class="logo-icon">

            <i class="fas fa-school"></i>

        </div>

        Modern Life <span>Public School</span>

    </div>


    <a href="<%= request.getContextPath() %>/teacher?action=list"
       class="back-btn">

        <i class="fas fa-arrow-left"></i>

        Back to Teachers

    </a>

</header>


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="page-heading">

        <h1>

            <i class="fas fa-user-plus"></i>

            Add New Teacher

        </h1>

        <p>

            Enter teacher information to add a new teacher

        </p>

    </div>


    <!-- ================= FORM ================= -->

    <div class="form-box">

        <div class="box-heading">

            <div class="box-icon">

                <i class="fas fa-user-plus"></i>

            </div>

            <div>

                <h2>Teacher Information</h2>

                <p>
                    Fill in the details below
                </p>

            </div>

        </div>


        <form action="<%= request.getContextPath() %>/teacher"
              method="post">


            <!-- ACTION -->

            <input type="hidden"
                   name="action"
                   value="add">


            <div class="form-grid">


                <!-- NAME -->

                <div class="form-group">

                    <label>

                        <i class="fas fa-user"></i>

                        Teacher Name

                    </label>

                    <input
                        type="text"
                        name="name"
                        placeholder="Enter teacher name"
                        required>

                </div>


                <!-- SUBJECT -->

                <div class="form-group">

                    <label>

                        <i class="fas fa-book"></i>

                        Subject

                    </label>

                    <input
                        type="text"
                        name="subject"
                        placeholder="Enter subject"
                        required>

                </div>


                <!-- QUALIFICATION -->

                <div class="form-group">

                    <label>

                        <i class="fas fa-graduation-cap"></i>

                        Qualification

                    </label>

                    <input
                        type="text"
                        name="qualification"
                        placeholder="e.g. B.Ed, M.Ed, M.Sc">

                </div>


                <!-- MOBILE -->

                <div class="form-group">

                    <label>

                        <i class="fas fa-phone"></i>

                        Mobile Number

                    </label>

                    <input
                        type="tel"
                        name="mobile"
                        placeholder="Enter mobile number">

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>

                        <i class="fas fa-envelope"></i>

                        Email

                    </label>

                    <input
                        type="email"
                        name="email"
                        placeholder="Enter email">

                </div>


                <!-- ADDRESS -->

                <div class="form-group">

                    <label>

                        <i class="fas fa-location-dot"></i>

                        Address

                    </label>

                    <input
                        type="text"
                        name="address"
                        placeholder="Enter address">

                </div>


            </div>


            <!-- BUTTONS -->

            <div class="buttons">

                <button type="submit"
                        class="btn-add">

                    <i class="fas fa-plus"></i>

                    Add Teacher

                </button>


                <a href="<%= request.getContextPath() %>/teacher?action=list"
                   class="btn-cancel">

                    <i class="fas fa-xmark"></i>

                    Cancel

                </a>

            </div>


        </form>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    <p>
        © 2026 Modern Life Public School. All Rights Reserved.
    </p>

</footer>

</body>

</html>