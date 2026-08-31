<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.reliable.school.model.Teacher"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Teacher Management - Modern Life Public School</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

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

.back-website {
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

.back-website:hover {
    background: rgba(255,255,255,0.22);
    transform: translateY(-2px);
}

/* ================= CONTAINER ================= */

.container {
    max-width: 1250px;
    margin: auto;
    padding: 40px 20px 70px;
}

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

/* ================= MESSAGES ================= */

.message {
    padding: 13px 16px;
    margin-bottom: 20px;
    border-radius: 11px;
    font-size: 13px;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 9px;
}

.success-message {
    background: #dcfce7;
    color: #166534;
    border: 1px solid #bbf7d0;
}

.error-message {
    background: #fee2e2;
    color: #991b1b;
    border: 1px solid #fecaca;
}

/* ================= ADD BUTTON ================= */

.add-teacher-bar {
    background: white;
    padding: 20px 24px;
    border-radius: 16px;
    box-shadow: 0 8px 28px rgba(15, 23, 42, 0.06);
    border: 1px solid #edf1f6;
    margin-bottom: 28px;

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.add-teacher-text h2 {
    color: #123c73;
    font-size: 18px;
    margin-bottom: 3px;
}

.add-teacher-text p {
    color: #64748b;
    font-size: 12px;
}

.add-teacher-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;

    background: linear-gradient(135deg, #123c73, #1e4a8a);
    color: white;

    text-decoration: none;

    padding: 11px 18px;
    border-radius: 9px;

    font-size: 13px;
    font-weight: 600;

    box-shadow: 0 6px 18px rgba(18,60,115,0.20);

    transition: 0.3s;
}

.add-teacher-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 9px 23px rgba(18,60,115,0.28);
}

/* ================= TABLE ================= */

.table-box {
    background: white;
    padding: 28px;
    border-radius: 18px;
    box-shadow: 0 9px 30px rgba(15, 23, 42, 0.06);
    border: 1px solid #edf1f6;
    margin-bottom: 28px;
    overflow-x: auto;
}

.table-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.box-heading {
    display: flex;
    align-items: center;
    gap: 11px;
}

.box-icon {
    width: 42px;
    height: 42px;
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
    font-size: 19px;
}

.box-heading p {
    color: #64748b;
    font-size: 11px;
    margin-top: 2px;
}

.teacher-count {
    background: #eff6ff;
    color: #1d4ed8;
    padding: 6px 12px;
    border-radius: 50px;
    font-size: 11px;
    font-weight: 600;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    min-width: 1050px;
    overflow: hidden;
    border: 1px solid #e8edf3;
    border-radius: 12px;
}

th {
    background: linear-gradient(135deg, #123c73, #1e4a8a);
    color: white;
    padding: 13px 14px;
    text-align: left;
    font-size: 12px;
    font-weight: 600;
    white-space: nowrap;
}

td {
    padding: 13px 14px;
    border-bottom: 1px solid #eef2f7;
    color: #475569;
    font-size: 12px;
    vertical-align: middle;
}

tr:last-child td {
    border-bottom: none;
}

tbody tr {
    transition: 0.2s;
}

tbody tr:hover {
    background: #f8fbff;
}

.teacher-name {
    color: #123c73;
    font-weight: 600;
}

.teacher-id {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 32px;
    padding: 4px 8px;
    border-radius: 7px;
    background: #f1f5f9;
    color: #475569;
    font-size: 11px;
    font-weight: 600;
}

.subject-badge {
    display: inline-block;
    padding: 5px 9px;
    border-radius: 50px;
    background: #eff6ff;
    color: #1d4ed8;
    font-size: 10px;
    font-weight: 600;
}

/* ================= ACTION BUTTONS ================= */

.actions {
    display: flex;
    align-items: center;
    gap: 6px;
    flex-wrap: wrap;
}

.action-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
    padding: 7px 10px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 10px;
    font-weight: 600;
    transition: 0.25s;
    white-space: nowrap;
}

.attendance {
    background: #dcfce7;
    color: #15803d;
}

.attendance:hover {
    background: #16a34a;
    color: white;
    transform: translateY(-1px);
}

.edit {
    background: #dbeafe;
    color: #1d4ed8;
}

.edit:hover {
    background: #2563eb;
    color: white;
    transform: translateY(-1px);
}

.delete {
    background: #fee2e2;
    color: #b91c1c;
}

.delete:hover {
    background: #dc2626;
    color: white;
    transform: translateY(-1px);
}

/* ================= EMPTY ================= */

.empty {
    text-align: center;
    padding: 45px 20px;
    color: #94a3b8;
}

.empty i {
    font-size: 42px;
    margin-bottom: 12px;
}

.empty h3 {
    color: #64748b;
    font-size: 16px;
    margin-bottom: 4px;
}

.empty p {
    font-size: 12px;
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

@media (max-width: 768px) {

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

    .add-teacher-bar {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }

    .add-teacher-btn {
        width: 100%;
        justify-content: center;
    }

    .table-box {
        padding: 21px 17px;
    }

    .table-top {
        align-items: flex-start;
        gap: 10px;
        flex-direction: column;
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

    <a href="<%= request.getContextPath() %>/index.jsp"
       class="back-website">

        <i class="fas fa-arrow-left"></i>
        Back to Website

    </a>

</header>


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="page-heading">

        <h1>
            <i class="fas fa-chalkboard-teacher"></i>
            Teacher Management
        </h1>

        <p>
            Add, manage and track school teachers
        </p>

    </div>


<%

String success = request.getParameter("success");
String error = request.getParameter("error");

if ("added".equals(success)) {

%>

    <div class="message success-message">

        <i class="fas fa-circle-check"></i>

        Teacher added successfully.

    </div>

<%

}

if ("add".equals(error)) {

%>

    <div class="message error-message">

        <i class="fas fa-circle-exclamation"></i>

        Failed to add teacher. Please check database.

    </div>

<%

}

%>


<!-- ================= ADD TEACHER BUTTON ================= -->

<div class="add-teacher-bar">

    <div class="add-teacher-text">

        <h2>
            <i class="fas fa-user-plus"></i>
            Teacher Management
        </h2>

        <p>
            Add a new teacher to the school records
        </p>

    </div>


    <a href="<%= request.getContextPath() %>/admin/add-teacher.jsp"
       class="add-teacher-btn">

        <i class="fas fa-plus"></i>
        Add New Teacher

    </a>

</div>


<!-- ================= TEACHER LIST ================= -->

<div class="table-box">

    <div class="table-top">

        <div class="box-heading">

            <div class="box-icon">

                <i class="fas fa-users"></i>

            </div>

            <div>

                <h2>Teacher List</h2>

                <p>
                    Manage teacher information and attendance
                </p>

            </div>

        </div>


<%

List<Teacher> teachers =
    (List<Teacher>) request.getAttribute("teachers");

int teacherCount =
    teachers != null ? teachers.size() : 0;

%>

        <span class="teacher-count">

            <i class="fas fa-users"></i>

            <%= teacherCount %> Teachers

        </span>

    </div>


    <table>

        <thead>

            <tr>

                <th>ID</th>
                <th>Name</th>
                <th>Subject</th>
                <th>Qualification</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>

            </tr>

        </thead>


        <tbody>

<%

if (teachers != null && !teachers.isEmpty()) {

    for (Teacher teacher : teachers) {

%>

            <tr>

                <!-- ID -->

                <td>

                    <span class="teacher-id">

                        #<%= teacher.getId() %>

                    </span>

                </td>


                <!-- NAME -->

                <td>

                    <span class="teacher-name">

                        <%= teacher.getName() %>

                    </span>

                </td>


                <!-- SUBJECT -->

                <td>

                    <span class="subject-badge">

                        <%= teacher.getSubject() %>

                    </span>

                </td>


                <!-- QUALIFICATION -->

                <td>

                    <%= teacher.getQualification() %>

                </td>


                <!-- MOBILE -->

                <td>

                    <%= teacher.getMobile() %>

                </td>


                <!-- EMAIL -->

                <td>

                    <%= teacher.getEmail() %>

                </td>


                <!-- ADDRESS -->

                <td>

                    <%= teacher.getAddress() %>

                </td>


                <!-- ACTION -->

                <td>

                    <div class="actions">


                        <!-- ATTENDANCE -->

                        <a class="action-btn attendance"
                           href="<%= request.getContextPath() %>/teacher-attendance?action=view&teacherId=<%= teacher.getId() %>">

                            <i class="fas fa-calendar-check"></i>

                            Attendance

                        </a>


                        <!-- EDIT -->

                        <a class="action-btn edit"
                           href="<%= request.getContextPath() %>/teacher?action=edit&id=<%= teacher.getId() %>">

                            <i class="fas fa-pen"></i>

                            Edit

                        </a>


                        <!-- DELETE -->

                        <a class="action-btn delete"
                           href="<%= request.getContextPath() %>/teacher?action=delete&id=<%= teacher.getId() %>"
                           onclick="return confirm('Are you sure you want to delete this teacher?');">

                            <i class="fas fa-trash"></i>

                            Delete

                        </a>

                    </div>

                </td>

            </tr>

<%

    }

} else {

%>

            <tr>

                <td colspan="8">

                    <div class="empty">

                        <i class="fas fa-user-slash"></i>

                        <h3>No Teachers Found</h3>

                        <p>
                            No teacher records are available yet.
                        </p>

                    </div>

                </td>

            </tr>

<%

}

%>

        </tbody>

    </table>

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