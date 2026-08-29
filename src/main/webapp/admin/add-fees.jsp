<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Add Fee - Reliable Public School</title>

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
    background:
        radial-gradient(circle at top left, rgba(30,74,138,0.10), transparent 35%),
        radial-gradient(circle at bottom right, rgba(251,191,36,0.08), transparent 30%),
        #f4f7fb;
    color: #333;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* ================= HEADER ================= */

header {
    background: linear-gradient(135deg, #0d3263, #1e4a8a, #285da3);
    color: white;
    padding: 17px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 6px 25px rgba(18,60,115,0.25);
    position: relative;
    z-index: 10;
}

.logo {
    font-size: 24px;
    font-weight: 700;
    letter-spacing: 0.3px;
}

.logo span {
    color: #fbbf24;
}

.admin-badge {
    background: rgba(255,255,255,0.13);
    border: 1px solid rgba(255,255,255,0.18);
    padding: 9px 18px;
    border-radius: 50px;
    font-size: 13px;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 8px;
    backdrop-filter: blur(10px);
}

.admin-badge i {
    color: #fbbf24;
    font-size: 15px;
}

/* ================= CONTAINER ================= */

.container {
    width: 100%;
    max-width: 650px;
    margin: 45px auto 55px;
    padding: 0 20px;
    flex: 1;
}

/* ================= CARD ================= */

.card {
    background: rgba(255,255,255,0.97);
    padding: 38px;
    border-radius: 22px;
    box-shadow:
        0 15px 45px rgba(18,60,115,0.10),
        0 2px 8px rgba(0,0,0,0.03);
    border: 1px solid rgba(18,60,115,0.07);
    position: relative;
    overflow: hidden;
}

.card::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: linear-gradient(90deg, #123c73, #1e4a8a, #fbbf24);
}

/* ================= TITLE ================= */

.title {
    text-align: center;
    margin-bottom: 30px;
}

.title-icon {
    width: 75px;
    height: 75px;
    margin: 0 auto 15px;
    border-radius: 20px;
    background: linear-gradient(135deg, #eaf2ff, #dbeafe);
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 8px 20px rgba(18,60,115,0.10);
}

.title-icon i {
    font-size: 34px;
    color: #123c73;
}

.title h2 {
    color: #123c73;
    font-size: 25px;
    font-weight: 700;
    margin-bottom: 6px;
}

.title p {
    color: #64748b;
    font-size: 13px;
}

/* ================= ERROR ================= */

.error {
    background: #fff1f2;
    color: #b91c1c;
    border: 1px solid #fecdd3;
    padding: 13px 15px;
    border-radius: 11px;
    margin-bottom: 20px;
    font-size: 13px;
    display: flex;
    align-items: center;
    gap: 9px;
}

.error i {
    font-size: 16px;
}

/* ================= STUDENT ID ================= */

.student-id {
    background: linear-gradient(135deg, #eff6ff, #eaf2ff);
    border: 1px solid #dbeafe;
    color: #1d4ed8;
    padding: 14px 16px;
    border-radius: 12px;
    margin-bottom: 27px;
    font-size: 14px;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 9px;
}

.student-id i {
    font-size: 16px;
}

/* ================= FORM ================= */

.form-group {
    margin-bottom: 21px;
}

label {
    display: block;
    color: #26364a;
    font-size: 13px;
    font-weight: 600;
    margin-bottom: 8px;
}

label i {
    color: #123c73;
    margin-right: 5px;
}

/* ================= INPUTS ================= */

input,
select,
textarea {
    width: 100%;
    padding: 13px 15px;
    border: 1px solid #d8e0ea;
    border-radius: 11px;
    font-family: 'Poppins', sans-serif;
    font-size: 13.5px;
    color: #334155;
    background: #fbfdff;
    outline: none;
    transition: all 0.25s ease;
}

input:hover,
select:hover,
textarea:hover {
    border-color: #b8c7da;
    background: #ffffff;
}

input:focus,
select:focus,
textarea:focus {
    border-color: #123c73;
    background: white;
    box-shadow:
        0 0 0 4px rgba(18,60,115,0.08),
        0 4px 12px rgba(18,60,115,0.05);
}

textarea {
    resize: vertical;
    min-height: 105px;
}

/* ================= DATE INFO ================= */

.date-info {
    background: linear-gradient(135deg, #f8fafc, #f1f5f9);
    border: 1px solid #e5eaf0;
    padding: 13px 15px;
    border-radius: 11px;
    color: #64748b;
    font-size: 12.5px;
    margin-top: 5px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.date-info i {
    color: #123c73;
    font-size: 15px;
}

/* ================= REASON ================= */

.reason-group {
    display: none;
    animation: slideDown 0.25s ease;
}

@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-7px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ================= BUTTONS ================= */

.buttons {
    display: flex;
    gap: 13px;
    margin-top: 27px;
}

.btn {
    flex: 1;
    padding: 13px 18px;
    border-radius: 11px;
    text-decoration: none;
    border: none;
    cursor: pointer;
    font-family: 'Poppins', sans-serif;
    font-size: 13.5px;
    font-weight: 600;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    transition: all 0.3s ease;
}

/* BACK */

.btn-back {
    background: #f1f5f9;
    color: #123c73;
    border: 1px solid #dbe2ea;
}

.btn-back:hover {
    background: #e2e8f0;
    transform: translateY(-2px);
}

/* SUBMIT */

.btn-submit {
    background: linear-gradient(135deg, #123c73, #1e4a8a);
    color: white;
    box-shadow: 0 7px 20px rgba(18,60,115,0.25);
}

.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 11px 26px rgba(18,60,115,0.32);
}

.btn-submit:active,
.btn-back:active {
    transform: translateY(0);
}

/* ================= FOOTER ================= */

footer {
    background: linear-gradient(135deg, #092548, #0c2a52);
    color: white;
    text-align: center;
    padding: 21px;
    font-size: 12.5px;
    margin-top: auto;
}

footer p {
    opacity: 0.9;
}

/* ================= RESPONSIVE ================= */

@media(max-width:600px) {

    header {
        padding: 15px 4%;
        flex-direction: column;
        gap: 12px;
    }

    .logo {
        font-size: 21px;
    }

    .admin-badge {
        font-size: 12px;
        padding: 8px 15px;
    }

    .container {
        margin: 30px auto 40px;
        padding: 0 14px;
    }

    .card {
        padding: 28px 20px;
        border-radius: 18px;
    }

    .title-icon {
        width: 65px;
        height: 65px;
    }

    .title-icon i {
        font-size: 29px;
    }

    .title h2 {
        font-size: 22px;
    }

    .buttons {
        flex-direction: column;
    }

    .btn {
        width: 100%;
    }
}

</style>

</head>

<body>

<header>

    <div class="logo">
        Reliable <span>Public School</span>
    </div>

    <div class="admin-badge">
        <i class="fas fa-user-shield"></i>
        Admin Panel
    </div>

</header>


<div class="container">

    <div class="card">

        <div class="title">

            <div class="title-icon">
                <i class="fas fa-file-invoice-dollar"></i>
            </div>

            <h2>Add Student Fee</h2>

            <p>Enter fee payment details</p>

        </div>


        <%

            Object studentObj = request.getAttribute("studentId");

            String studentId =
                studentObj != null
                ? studentObj.toString()
                : "";

            String error =
                (String) request.getAttribute("error");

        %>


        <% if (error != null) { %>

            <div class="error">

                <i class="fas fa-exclamation-circle"></i>

                <%= error %>

            </div>

        <% } %>


        <div class="student-id">

            <i class="fas fa-user-graduate"></i>

            Student ID: <%= studentId %>

        </div>


        <form action="${pageContext.request.contextPath}/student-fees"
              method="post">


            <input type="hidden"
                   name="action"
                   value="add">


            <input type="hidden"
                   name="studentId"
                   value="<%= studentId %>">


            <div class="form-group">

                <label for="amount">

                    <i class="fas fa-rupee-sign"></i>
                    Fee Amount

                </label>

                <input type="number"
                       id="amount"
                       name="amount"
                       step="0.01"
                       min="0.01"
                       placeholder="Enter fee amount"
                       required>

            </div>


            <div class="form-group">

                <label for="status">

                    <i class="fas fa-circle-check"></i>
                    Payment Status

                </label>

                <select id="status"
                        name="status"
                        required
                        onchange="toggleReason()">

                    <option value="">Select Status</option>

                    <option value="Paid">Paid</option>

                    <option value="Pending">Pending</option>

                </select>

            </div>


            <div class="form-group reason-group"
                 id="reasonGroup">

                <label for="reason">

                    <i class="fas fa-comment"></i>
                    Reason for Pending

                </label>

                <textarea id="reason"
                          name="reason"
                          placeholder="Enter reason for pending fee"></textarea>

            </div>


            <div class="date-info">

                <i class="fas fa-calendar-days"></i>

                Payment date will be automatically added by database.

            </div>


            <div class="buttons">

                <a href="${pageContext.request.contextPath}/student-fees?action=view&id=<%= studentId %>"
                   class="btn btn-back">

                    <i class="fas fa-arrow-left"></i>

                    Back

                </a>


                <button type="submit"
                        class="btn btn-submit">

                    <i class="fas fa-save"></i>

                    Submit Fee

                </button>

            </div>

        </form>

    </div>

</div>


<footer>

    <p>
        © 2026 Reliable Public School. All Rights Reserved.
    </p>

</footer>


<script>

function toggleReason() {

    const status =
        document.getElementById("status").value;

    const reasonGroup =
        document.getElementById("reasonGroup");

    const reason =
        document.getElementById("reason");


    if (status === "Pending") {

        reasonGroup.style.display = "block";

        reason.required = true;

    } else {

        reasonGroup.style.display = "none";

        reason.required = false;

        reason.value = "";

    }

}

</script>

</body>

</html>