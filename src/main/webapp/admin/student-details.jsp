<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Details - Reliable Public School</title>

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
    background: linear-gradient(135deg, #0f2f63, #1e4f96);
    color: white;
    padding: 18px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 5px 25px rgba(15, 47, 99, 0.25);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.logo {
    font-size: 24px;
    font-weight: 700;
    letter-spacing: .4px;
}

.logo span {
    color: #fbbf24;
}

.header-right {
    display: flex;
    align-items: center;
    gap: 12px;
}

.dashboard-btn {
    color: white;
    text-decoration: none;
    padding: 9px 18px;
    border-radius: 30px;
    background: rgba(255,255,255,.12);
    border: 1px solid rgba(255,255,255,.22);
    display: inline-flex;
    align-items: center;
    gap: 8px;
    font-size: 13px;
    font-weight: 500;
    transition: .3s ease;
}

.dashboard-btn:hover {
    background: #fbbf24;
    color: #0f2f63;
    transform: translateY(-2px);
}

.admin-badge {
    padding: 9px 17px;
    border-radius: 30px;
    background: rgba(255,255,255,.12);
    border: 1px solid rgba(255,255,255,.15);
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 13px;
}

.admin-badge i {
    color: #fbbf24;
}

/* ================= MAIN ================= */

.container {
    max-width: 1250px;
    margin: 45px auto 60px;
    padding: 0 22px;
}

/* ================= TOP BAR ================= */

.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    margin-bottom: 25px;
    flex-wrap: wrap;
}

.top-bar-left h2 {
    color: #0f2f63;
    font-size: 27px;
    font-weight: 700;
    margin-bottom: 5px;
}

.top-bar-left h2::before {
    content: "";
    display: inline-block;
    width: 5px;
    height: 27px;
    background: #fbbf24;
    border-radius: 5px;
    margin-right: 10px;
    vertical-align: -3px;
}

.top-bar-left p {
    color: #64748b;
    font-size: 14px;
    margin-left: 15px;
}

.top-bar-right {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}

/* ================= BUTTONS ================= */

.back-btn,
.add-btn {
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    padding: 11px 18px;
    border-radius: 10px;
    font-size: 13px;
    font-weight: 600;
    transition: all .3s ease;
}

.back-btn {
    background: white;
    color: #0f2f63;
    border: 1px solid #dbe3ee;
    box-shadow: 0 3px 10px rgba(15,47,99,.05);
}

.back-btn:hover {
    background: #eef4fb;
    transform: translateY(-2px);
}

.add-btn {
    color: white;
    background: linear-gradient(135deg, #0f2f63, #1e4f96);
    box-shadow: 0 6px 18px rgba(15,47,99,.25);
}

.add-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(15,47,99,.35);
}

/* ================= TABLE CARD ================= */

.table-container {
    background: white;
    padding: 8px;
    border-radius: 18px;
    box-shadow: 0 12px 35px rgba(15,47,99,.08);
    border: 1px solid #e7edf5;
    overflow-x: auto;
}

/* ================= TABLE ================= */

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    min-width: 850px;
}

thead th {
    background: linear-gradient(135deg, #0f2f63, #1e4f96);
    color: white;
    padding: 15px 17px;
    text-align: left;
    font-size: 13px;
    font-weight: 600;
    letter-spacing: .2px;
}

thead th:first-child {
    border-radius: 12px 0 0 0;
}

thead th:last-child {
    border-radius: 0 12px 0 0;
}

tbody td {
    padding: 15px 17px;
    border-bottom: 1px solid #edf1f6;
    font-size: 13.5px;
    color: #334155;
    vertical-align: middle;
}

tbody tr {
    transition: all .2s ease;
}

tbody tr:hover td {
    background: #f8fbff;
}

tbody tr:last-child td {
    border-bottom: none;
}

/* ================= ID ================= */

tbody td:first-child {
    font-weight: 600;
    color: #0f2f63;
}

/* ================= ACTION BUTTONS ================= */

.action-btns {
    display: flex;
    gap: 7px;
    flex-wrap: wrap;
}

.btn-edit,
.btn-delete,
.btn-fees {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
    padding: 7px 11px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 11.5px;
    font-weight: 600;
    transition: all .25s ease;
}

/* Edit */

.btn-edit {
    background: #fff7df;
    color: #a16207;
    border: 1px solid #fde68a;
}

.btn-edit:hover {
    background: #f59e0b;
    color: white;
    transform: translateY(-1px);
}

/* Delete */

.btn-delete {
    background: #fff0f0;
    color: #b91c1c;
    border: 1px solid #fecaca;
}

.btn-delete:hover {
    background: #dc2626;
    color: white;
    transform: translateY(-1px);
}

/* Fees */

.btn-fees {
    background: #edf5ff;
    color: #1d4ed8;
    border: 1px solid #bfdbfe;
}

.btn-fees:hover {
    background: #2563eb;
    color: white;
    transform: translateY(-1px);
}

/* ================= NO DATA ================= */

.no-data {
    text-align: center;
    padding: 75px 20px;
    color: #94a3b8;
}

.no-data i {
    display: block;
    font-size: 52px;
    margin-bottom: 15px;
    color: #cbd5e1;
}

.no-data {
    font-size: 14px;
}

/* ================= FOOTER ================= */

footer {
    background: #0b2852;
    color: white;
    text-align: center;
    padding: 22px;
    font-size: 13px;
    margin-top: auto;
}

footer p {
    opacity: .85;
}

/* ================= RESPONSIVE ================= */

@media (max-width: 850px) {

    header {
        padding: 15px 4%;
        flex-direction: column;
        gap: 13px;
    }

    .header-right {
        justify-content: center;
        flex-wrap: wrap;
    }

    .container {
        margin-top: 30px;
    }

    .top-bar {
        flex-direction: column;
        align-items: flex-start;
    }

    .top-bar-right {
        width: 100%;
    }

    .back-btn,
    .add-btn {
        flex: 1;
    }
}

@media (max-width: 550px) {

    .logo {
        font-size: 20px;
    }

    .dashboard-btn,
    .admin-badge {
        font-size: 12px;
        padding: 8px 13px;
    }

    .top-bar-left h2 {
        font-size: 23px;
    }

    .top-bar-right {
        flex-direction: column;
    }

    .back-btn,
    .add-btn {
        width: 100%;
    }

    .table-container {
        padding: 5px;
        border-radius: 14px;
    }
}

</style>

</head>

<body>

<%

    String selectedClass = request.getParameter("className");

    if (selectedClass == null || selectedClass.trim().isEmpty()) {

        Object attr = request.getAttribute("className");

        if (attr != null) {
            selectedClass = attr.toString();
        } else {
            selectedClass = "";
        }

    }

%>

<!-- ================= HEADER ================= -->

<header>

    <div class="logo">
        Reliable <span>Public School</span>
    </div>

    <div class="header-right">

        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp"
           class="dashboard-btn">

            <i class="fas fa-tachometer-alt"></i>
            Go to Dashboard

        </a>

        <div class="admin-badge">

            <i class="fas fa-user-shield"></i>
            Admin Panel

        </div>

    </div>

</header>


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="top-bar">

        <div class="top-bar-left">

            <h2>
                Student Details
                <%= selectedClass.isEmpty() ? "" : " - Class " + selectedClass %>
            </h2>

            <p>
                View students of selected class
            </p>

        </div>


        <div class="top-bar-right">

            <a href="${pageContext.request.contextPath}/admin/student-classes.jsp"
               class="back-btn">

                <i class="fas fa-arrow-left"></i>
                Back to Classes

            </a>


            <a href="${pageContext.request.contextPath}/admin/addNewStudent.jsp?className=<%= selectedClass %>"
               class="add-btn">

                <i class="fas fa-user-plus"></i>
                Add New Student

            </a>

        </div>

    </div>


    <!-- ================= TABLE ================= -->

    <div class="table-container">

        <c:choose>

            <c:when test="${not empty students}">

                <table>

                    <thead>

                        <tr>

                            <th>ID</th>
                            <th>Name</th>
                            <th>Father Name</th>
                            <th>Roll Number</th>
                            <th>Mobile</th>
                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody>

                        <c:forEach var="student" items="${students}">

                            <tr>

                                <td>
                                    ${student.id}
                                </td>

                                <td>
                                    ${student.name}
                                </td>

                                <td>
                                    ${student.fatherName}
                                </td>

                                <td>
                                    ${student.rollNumber}
                                </td>

                                <td>
                                    ${student.mobile}
                                </td>

                                <td>

                                    <div class="action-btns">

                                        <!-- EDIT -->

                                        <a class="btn-edit"
                                           href="${pageContext.request.contextPath}/student-details?action=edit&id=${student.id}&className=<%= selectedClass %>">

                                            <i class="fas fa-edit"></i>
                                            Edit

                                        </a>


                                        <!-- DELETE -->

                                        <a class="btn-delete"
                                           href="${pageContext.request.contextPath}/student-details?action=delete&id=${student.id}&className=<%= selectedClass %>"
                                           onclick="return confirm('Are you sure you want to delete this student?');">

                                            <i class="fas fa-trash-alt"></i>
                                            Delete

                                        </a>


                                        <!-- VIEW FEES DETAILS -->

                                        <a class="btn-fees"
                                           href="${pageContext.request.contextPath}/student-fees?action=view&id=${student.id}">

                                            <i class="fas fa-rupee-sign"></i>
                                            View Fees

                                        </a>

                                    </div>

                                </td>

                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </c:when>


            <c:otherwise>

                <div class="no-data">

                    <i class="fas fa-users"></i>

                    No students found for this class.

                </div>

            </c:otherwise>

        </c:choose>

    </div>

</div>


<!-- ================= FOOTER ================= -->

<footer>

    <p>
        © 2026 Reliable Public School. All Rights Reserved.
    </p>

</footer>

</body>
</html>
