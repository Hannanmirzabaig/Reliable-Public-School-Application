<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.reliable.school.model.Teacher" %>
<%@ page import="com.reliable.school.model.TeacherAttendance" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Teacher Attendance - Modern Life Public School</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">

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

        /* ================= NAVBAR ================= */

        .navbar {
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            padding: 16px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 5px 25px rgba(18, 60, 115, 0.20);
        }

        .school-name {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 21px;
            font-weight: 700;
        }

        .school-name span {
            color: #fbbf24;
        }

        .school-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.14);
            border-radius: 12px;
        }

        .back-btn {
            color: white;
            text-decoration: none;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.18);
            padding: 9px 16px;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 600;
            transition: 0.3s;
        }

        .back-btn:hover {
            background: white;
            color: #123c73;
        }

        /* ================= CONTAINER ================= */

        .container {
            max-width: 1250px;
            margin: auto;
            padding: 40px 20px 70px;
        }

        /* ================= PAGE TITLE ================= */

        .page-title {
            margin-bottom: 25px;
        }

        .page-title h1 {
            color: #123c73;
            font-size: 28px;
            margin-bottom: 5px;
        }

        .page-title p {
            color: #64748b;
            font-size: 13px;
        }

        /* ================= MESSAGE ================= */

        .message {
            padding: 13px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 13px;
            font-weight: 500;
        }

        .success {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #bbf7d0;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }

        /* ================= CARD ================= */

        .card {
            background: white;
            border-radius: 17px;
            padding: 28px;
            margin-bottom: 25px;
            border: 1px solid #edf1f6;
            box-shadow: 0 8px 28px rgba(15, 23, 42, 0.06);
        }

        .card-title {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #123c73;
            font-size: 19px;
            font-weight: 700;
            margin-bottom: 22px;
        }

        .card-title i {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            color: #1d4ed8;
            border-radius: 10px;
        }

        /* ================= MARK ATTENDANCE ================= */

        .attendance-form {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            align-items: end;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            color: #334155;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        input,
        select {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #dbe2ea;
            border-radius: 9px;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            outline: none;
            background: white;
        }

        input:focus,
        select:focus {
            border-color: #123c73;
            box-shadow: 0 0 0 3px rgba(18, 60, 115, 0.08);
        }

        /* READ ONLY TEACHER FIELD */

        .readonly-teacher {
            background: #f8fafc;
            color: #123c73;
            font-weight: 600;
            cursor: not-allowed;
        }

        .submit-btn {
            width: 100%;
            padding: 12px 18px;
            border: none;
            border-radius: 9px;
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 18px rgba(18, 60, 115, 0.25);
        }

        /* ================= FILTER ================= */

        .filter-form {
            display: grid;
            grid-template-columns: 1fr 1fr auto;
            gap: 18px;
            align-items: end;
        }

        .filter-btn {
            padding: 12px 22px;
            border: none;
            border-radius: 9px;
            background: #fbbf24;
            color: #172554;
            font-family: 'Poppins', sans-serif;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }

        .filter-btn:hover {
            background: #f59e0b;
        }

        /* ================= SUMMARY ================= */

        .summary {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 25px;
        }

        .summary-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
            border: 1px solid #edf1f6;
            box-shadow: 0 7px 22px rgba(15, 23, 42, 0.05);
        }

        .summary-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            font-size: 19px;
        }

        .present-icon {
            background: #dcfce7;
            color: #16a34a;
        }

        .absent-icon {
            background: #fee2e2;
            color: #dc2626;
        }

        .half-icon {
            background: #fef3c7;
            color: #d97706;
        }

        .summary-card h3 {
            font-size: 23px;
            color: #123c73;
        }

        .summary-card p {
            font-size: 12px;
            color: #64748b;
        }

        /* ================= TABLE ================= */

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        th {
            background: #123c73;
            color: white;
            padding: 13px;
            text-align: left;
            font-size: 12px;
            font-weight: 600;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #e2e8f0;
            font-size: 12.5px;
            color: #475569;
        }

        tr:hover {
            background: #f8fafc;
        }

        /* ================= STATUS ================= */

        .status {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 5px 10px;
            border-radius: 50px;
            font-size: 11px;
            font-weight: 700;
        }

        .status-present {
            background: #dcfce7;
            color: #15803d;
        }

        .status-absent {
            background: #fee2e2;
            color: #b91c1c;
        }

        .status-half {
            background: #fef3c7;
            color: #b45309;
        }

        .empty {
            text-align: center;
            padding: 35px !important;
            color: #94a3b8;
        }

        /* ================= FOOTER ================= */

        footer {
            background: #0c2a52;
            color: white;
            text-align: center;
            padding: 22px;
            font-size: 13px;
        }

        footer p {
            opacity: 0.85;
        }

        /* ================= MOBILE ================= */

        @media (max-width: 900px) {

            .attendance-form {
                grid-template-columns: repeat(2, 1fr);
            }

            .summary {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {

            .navbar {
                flex-direction: column;
                gap: 13px;
                text-align: center;
            }

            .school-name {
                font-size: 18px;
            }

            .container {
                padding: 28px 15px 50px;
            }

            .page-title h1 {
                font-size: 23px;
            }

            .card {
                padding: 21px 17px;
            }

            .attendance-form {
                grid-template-columns: 1fr;
            }

            .filter-form {
                grid-template-columns: 1fr;
            }

            .summary {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="school-name">

        <div class="school-icon">
            <i class="fas fa-school"></i>
        </div>

        Modern Life <span>Public School</span>

    </div>

    <a href="<%= request.getContextPath() %>/teacher?action=list"
       class="back-btn">

        <i class="fas fa-arrow-left"></i>

        Back to Teachers

    </a>

</div>


<!-- ================= MAIN ================= -->

<div class="container">

    <div class="page-title">

        <h1>
            <i class="fas fa-calendar-check"></i>
            Teacher Attendance
        </h1>

        <p>
            Mark and view teacher attendance records
        </p>

    </div>


<%

    String success = request.getParameter("success");
    String error = request.getParameter("error");

    if ("marked".equals(success)) {

%>

    <div class="message success">

        <i class="fas fa-circle-check"></i>

        Attendance marked successfully.

    </div>

<%

    }

    if ("already".equals(error)) {

%>

    <div class="message error">

        <i class="fas fa-circle-exclamation"></i>

        Attendance is already marked for this teacher on this date.

    </div>

<%

    }

    if ("failed".equals(error)) {

%>

    <div class="message error">

        <i class="fas fa-circle-exclamation"></i>

        Failed to mark attendance. Please try again.

    </div>

<%

    }

    if ("futureDate".equals(error)) {

%>

    <div class="message error">

        <i class="fas fa-circle-exclamation"></i>

        Future date attendance cannot be marked.

    </div>

<%

    }

    if ("invalidStatus".equals(error)) {

%>

    <div class="message error">

        <i class="fas fa-circle-exclamation"></i>

        Invalid attendance status.

    </div>

<%

    }

    if ("invalidDate".equals(error)) {

%>

    <div class="message error">

        <i class="fas fa-circle-exclamation"></i>

        Invalid attendance date.

    </div>

<%

    }

%>


<%
    /*
     * Teacher servlet se teacher object aa raha hai.
     *
     * Example:
     * teacherId = 5
     * teacherName = Abdul
     *
     * Isi teacher ki attendance yahan manage hogi.
     */

    Teacher teacher =
        (Teacher) request.getAttribute("teacher");

%>


<!-- ================= MARK ATTENDANCE ================= -->

<div class="card">

    <div class="card-title">

        <i class="fas fa-user-check"></i>

        Mark Attendance

    </div>


<%
    if (teacher != null) {
%>

    <form action="<%= request.getContextPath() %>/teacher-attendance"
          method="post">

        <!-- ACTION -->

        <input type="hidden"
               name="action"
               value="mark">


        <!-- TEACHER ID
             Ye visible nahi hogi,
             lekin servlet ko ID bhejegi.
        -->

        <input type="hidden"
               name="teacherId"
               value="<%= teacher.getId() %>">


        <div class="attendance-form">


            <!-- TEACHER NAME -->

            <div class="form-group">

                <label for="teacherName">

                    <i class="fas fa-user"></i>

                    Teacher

                </label>

                <input type="text"
                       id="teacherName"
                       value="<%= teacher.getName() %>"
                       class="readonly-teacher"
                       readonly>

            </div>


            <!-- DATE -->

            <div class="form-group">

                <label for="attendanceDate">

                    <i class="fas fa-calendar"></i>

                    Attendance Date

                </label>

                <input type="date"
                       id="attendanceDate"
                       name="attendanceDate"
                       required>

            </div>


            <!-- STATUS -->

            <div class="form-group">

                <label for="status">

                    <i class="fas fa-clipboard-check"></i>

                    Attendance

                </label>

                <select id="status"
                        name="status"
                        required>

                    <option value="">
                        Select Status
                    </option>

                    <option value="Present">
                        Present
                    </option>

                    <option value="Absent">
                        Absent
                    </option>

                    <option value="Half Day">
                        Half Day
                    </option>

                </select>

            </div>


            <!-- BUTTON -->

            <div class="form-group">

                <button type="submit"
                        class="submit-btn">

                    <i class="fas fa-check"></i>

                    Mark Attendance

                </button>

            </div>

        </div>

    </form>

<%
    } else {
%>

    <div class="message error">

        <i class="fas fa-circle-exclamation"></i>

        Teacher information not found.

    </div>

<%
    }
%>

</div>


<!-- ================= FILTER ================= -->

<div class="card">

    <div class="card-title">

        <i class="fas fa-filter"></i>

        View Attendance

    </div>


    <form action="<%= request.getContextPath() %>/teacher-attendance"
          method="get">

        <input type="hidden"
               name="action"
               value="view">

        <!-- IMPORTANT:
             Same teacher ki ID dobara servlet ko bhejni hai.
        -->

        <input type="hidden"
               name="teacherId"
               value="<%= teacher != null ? teacher.getId() : "" %>">


        <div class="filter-form">


            <div class="form-group">

                <label for="fromDate">

                    From Date

                </label>

                <input type="date"
                       id="fromDate"
                       name="fromDate"
                       required>

            </div>


            <div class="form-group">

                <label for="toDate">

                    To Date

                </label>

                <input type="date"
                       id="toDate"
                       name="toDate"
                       required>

            </div>


            <div class="form-group">

                <button type="submit"
                        class="filter-btn">

                    <i class="fas fa-search"></i>

                    View Attendance

                </button>

            </div>

        </div>

    </form>

</div>


<%

    List<TeacherAttendance> attendanceList =
        (List<TeacherAttendance>)
        request.getAttribute("attendanceList");

    Integer presentCount =
        (Integer) request.getAttribute("presentCount");

    Integer absentCount =
        (Integer) request.getAttribute("absentCount");

    Integer halfDayCount =
        (Integer) request.getAttribute("halfDayCount");


    if (presentCount == null) {
        presentCount = 0;
    }

    if (absentCount == null) {
        absentCount = 0;
    }

    if (halfDayCount == null) {
        halfDayCount = 0;
    }

%>


<!-- ================= SUMMARY ================= -->

<div class="summary">


    <div class="summary-card">

        <div class="summary-icon present-icon">

            <i class="fas fa-check"></i>

        </div>

        <div>

            <h3>
                <%= presentCount %>
            </h3>

            <p>
                Total Present
            </p>

        </div>

    </div>


    <div class="summary-card">

        <div class="summary-icon absent-icon">

            <i class="fas fa-xmark"></i>

        </div>

        <div>

            <h3>
                <%= absentCount %>
            </h3>

            <p>
                Total Absent
            </p>

        </div>

    </div>


    <div class="summary-card">

        <div class="summary-icon half-icon">

            <i class="fas fa-clock"></i>

        </div>

        <div>

            <h3>
                <%= halfDayCount %>
            </h3>

            <p>
                Total Half Day
            </p>

        </div>

    </div>

</div>


<!-- ================= ATTENDANCE TABLE ================= -->

<div class="card">

    <div class="card-title">

        <i class="fas fa-table"></i>

        Attendance Details

    </div>


    <div class="table-wrapper">

        <table>

            <thead>

                <tr>

                    <th>
                        Date
                    </th>

                    <th>
                        Teacher
                    </th>

                    <th>
                        Status
                    </th>

                </tr>

            </thead>


            <tbody>

<%

    if (attendanceList != null
            && !attendanceList.isEmpty()) {

        for (TeacherAttendance attendance :
             attendanceList) {

%>

                <tr>

                    <td>

                        <%= attendance.getAttendanceDate() %>

                    </td>


                    <td>

                        <%= attendance.getTeacherName() %>

                    </td>


                    <td>

<%

            if ("Present".equals(attendance.getStatus())) {

%>

                        <span class="status status-present">

                            <i class="fas fa-check"></i>

                            Present

                        </span>

<%

            } else if ("Absent".equals(attendance.getStatus())) {

%>

                        <span class="status status-absent">

                            <i class="fas fa-xmark"></i>

                            Absent

                        </span>

<%

            } else {

%>

                        <span class="status status-half">

                            <i class="fas fa-clock"></i>

                            Half Day

                        </span>

<%

            }

%>

                    </td>

                </tr>

<%

        }

    } else {

%>

                <tr>

                    <td colspan="3"
                        class="empty">

                        <i class="fas fa-calendar-xmark"
                           style="font-size:30px;margin-bottom:10px;">
                        </i>

                        <br>

                        No attendance records found
                        for the selected date range.

                    </td>

                </tr>

<%

    }

%>

            </tbody>

        </table>

    </div>

</div>


</div>


<!-- ================= FOOTER ================= -->

<footer>

    <p>
        © 2026 Modern Life Public School. All Rights Reserved.
    </p>

</footer>


<script>

    // ==============================
    // TODAY'S DATE
    // ==============================

    const today = new Date();

    const year = today.getFullYear();

    const month =
        String(today.getMonth() + 1).padStart(2, '0');

    const day =
        String(today.getDate()).padStart(2, '0');

    const todayString =
        year + "-" + month + "-" + day;


    const attendanceDate =
        document.getElementById("attendanceDate");

    if (attendanceDate) {

        attendanceDate.value = todayString;

        // Future date select na ho
        attendanceDate.max = todayString;
    }


    // ==============================
    // LAST 30 DAYS
    // ==============================

    const fromDate =
        document.getElementById("fromDate");

    const toDate =
        document.getElementById("toDate");


    if (fromDate && toDate) {

        const previousDate = new Date();

        previousDate.setDate(
            previousDate.getDate() - 30
        );


        const previousYear =
            previousDate.getFullYear();

        const previousMonth =
            String(
                previousDate.getMonth() + 1
            ).padStart(2, '0');

        const previousDay =
            String(
                previousDate.getDate()
            ).padStart(2, '0');


        fromDate.value =
            previousYear + "-" +
            previousMonth + "-" +
            previousDay;

        toDate.value = todayString;

        toDate.max = todayString;
        fromDate.max = todayString;
    }

</script>


</body>

</html>
