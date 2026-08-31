<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Student Fees - Modern Life Public School</title>

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
        radial-gradient(circle at top left, rgba(30,74,138,0.08), transparent 35%),
        linear-gradient(135deg, #f4f7fb, #eef3f9);
    color: #263238;
    min-height: 100vh;
}

/* ================= HEADER ================= */

header {
    background: linear-gradient(135deg, #0f3263, #1e4a8a);
    color: white;
    padding: 17px 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 6px 25px rgba(15,50,99,0.25);
    position: sticky;
    top: 0;
    z-index: 100;
}

.logo {
    font-size: 24px;
    font-weight: 700;
    letter-spacing: 0.4px;
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
    background: rgba(255,255,255,0.12);
    color: white;
    padding: 9px 18px;
    border-radius: 50px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 500;
    border: 1px solid rgba(255,255,255,0.18);
    display: inline-flex;
    align-items: center;
    gap: 8px;
    transition: 0.3s ease;
}

.dashboard-btn:hover {
    background: #fbbf24;
    color: #123c73;
    transform: translateY(-2px);
}

.admin-badge {
    background: rgba(255,255,255,0.12);
    padding: 9px 17px;
    border-radius: 50px;
    font-size: 13px;
    border: 1px solid rgba(255,255,255,0.15);
    display: flex;
    align-items: center;
    gap: 8px;
}

.admin-badge i {
    color: #fbbf24;
}

/* ================= CONTAINER ================= */

.container {
    max-width: 1200px;
    margin: 45px auto 70px;
    padding: 0 20px;
}

/* ================= TOP BAR ================= */

.top-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 28px;
    flex-wrap: wrap;
    gap: 18px;
}

.top-bar-left h2 {
    color: #123c73;
    font-size: 27px;
    font-weight: 700;
    margin-bottom: 5px;
}

.top-bar-left p {
    color: #64748b;
    font-size: 14px;
}

.top-bar-right {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}

.add-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 20px;
    border-radius: 11px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    background: linear-gradient(135deg, #123c73, #1e4a8a);
    color: white;
    box-shadow: 0 7px 20px rgba(18,60,115,0.28);
    transition: 0.3s ease;
}

.add-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 25px rgba(18,60,115,0.35);
}

.add-btn i {
    font-size: 13px;
}

/* ================= STUDENT CARD ================= */

.student-card {
    background: rgba(255,255,255,0.95);
    padding: 27px;
    border-radius: 20px;
    box-shadow: 0 12px 35px rgba(18,60,115,0.09);
    margin-bottom: 25px;
    border: 1px solid rgba(18,60,115,0.07);
    position: relative;
    overflow: hidden;
}

.student-card::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 5px;
    height: 100%;
    background: linear-gradient(#123c73, #fbbf24);
}

.student-card h3 {
    color: #123c73;
    margin-bottom: 21px;
    font-size: 19px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.student-card h3 i {
    width: 38px;
    height: 38px;
    border-radius: 10px;
    background: #e8f0fb;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #1e4a8a;
}

.student-info {
    display: grid;
    grid-template-columns: repeat(3,1fr);
    gap: 18px;
}

.info-box {
    background: linear-gradient(135deg,#f8fafc,#f3f7fc);
    padding: 17px;
    border-radius: 13px;
    border: 1px solid #e7edf5;
    transition: 0.25s ease;
}

.info-box:hover {
    transform: translateY(-2px);
    box-shadow: 0 7px 18px rgba(18,60,115,0.07);
}

.info-label {
    display: block;
    color: #64748b;
    font-size: 12px;
    margin-bottom: 6px;
}

.info-value {
    color: #123c73;
    font-size: 15px;
    font-weight: 600;
}

/* ================= SUMMARY ================= */

.summary {
    display: grid;
    grid-template-columns: repeat(3,1fr);
    gap: 18px;
    margin-bottom: 25px;
}

.summary-card {
    background: white;
    padding: 22px;
    border-radius: 17px;
    box-shadow: 0 9px 28px rgba(18,60,115,0.08);
    border: 1px solid rgba(18,60,115,0.06);
    position: relative;
    overflow: hidden;
    transition: 0.3s ease;
}

.summary-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 14px 30px rgba(18,60,115,0.13);
}

.summary-card::after {
    content: "";
    position: absolute;
    width: 75px;
    height: 75px;
    border-radius: 50%;
    background: rgba(30,74,138,0.06);
    right: -25px;
    top: -25px;
}

.summary-card i {
    font-size: 24px;
    color: #123c73;
    margin-bottom: 11px;
}

.summary-card h4 {
    color: #64748b;
    font-size: 13px;
    margin-bottom: 5px;
    font-weight: 500;
}

.summary-card p {
    color: #123c73;
    font-size: 23px;
    font-weight: 700;
}

/* ================= TABLE ================= */

.table-container {
    background: rgba(255,255,255,0.97);
    padding: 27px;
    border-radius: 20px;
    box-shadow: 0 12px 35px rgba(18,60,115,0.09);
    overflow-x: auto;
    border: 1px solid rgba(18,60,115,0.06);
}

.table-title {
    color: #123c73;
    font-size: 19px;
    font-weight: 700;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    gap: 9px;
}

.table-title i {
    color: #1e4a8a;
}

table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    min-width: 850px;
    overflow: hidden;
}

th {
    background: linear-gradient(135deg,#123c73,#1e4a8a);
    color: white;
    padding: 15px 16px;
    text-align: left;
    font-size: 13px;
    font-weight: 600;
}

th:first-child {
    border-radius: 10px 0 0 0;
}

th:last-child {
    border-radius: 0 10px 0 0;
}

td {
    padding: 15px 16px;
    border-bottom: 1px solid #edf1f6;
    font-size: 13.5px;
    color: #475569;
    vertical-align: middle;
}

tbody tr {
    transition: 0.2s ease;
}

tbody tr:hover td {
    background: #f7faff;
}

tbody tr:last-child td {
    border-bottom: none;
}

/* ================= STATUS ================= */

.status {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 6px 13px;
    border-radius: 50px;
    font-size: 11.5px;
    font-weight: 600;
}

.paid {
    background: #dcfce7;
    color: #15803d;
}

.pending {
    background: #fef3c7;
    color: #b45309;
}

/* ================= ACTION BUTTONS ================= */

.action-btns {
    display: flex;
    gap: 7px;
    flex-wrap: wrap;
}

.edit-btn,
.reason-btn {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    padding: 7px 12px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 11.5px;
    font-weight: 600;
    border: none;
    cursor: pointer;
    transition: 0.25s ease;
}

.edit-btn {
    background: #fff7db;
    color: #b45309;
}

.edit-btn:hover {
    background: #f59e0b;
    color: white;
    transform: translateY(-2px);
}

.reason-btn {
    background: #feecec;
    color: #b91c1c;
}

.reason-btn:hover {
    background: #dc2626;
    color: white;
    transform: translateY(-2px);
}

/* ================= NO DATA ================= */

.no-data {
    text-align: center;
    padding: 65px 20px;
    color: #94a3b8;
}

.no-data i {
    width: 75px;
    height: 75px;
    border-radius: 50%;
    background: #f1f5f9;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 17px;
    font-size: 32px;
    color: #94a3b8;
}

.no-data h3 {
    color: #64748b;
    margin-bottom: 7px;
}

.no-data p {
    font-size: 13px;
}

/* ================= MODAL ================= */

.modal {
    display: none;
    position: fixed;
    z-index: 999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(7,25,48,0.62);
    backdrop-filter: blur(5px);
    align-items: center;
    justify-content: center;
    padding: 20px;
}

.modal-content {
    background: white;
    width: 100%;
    max-width: 510px;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 25px 70px rgba(0,0,0,0.25);
    position: relative;
    animation: modalOpen 0.25s ease;
}

@keyframes modalOpen {
    from {
        opacity: 0;
        transform: translateY(15px) scale(0.97);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

.modal-content h3 {
    color: #123c73;
    margin-bottom: 18px;
    font-size: 19px;
    display: flex;
    align-items: center;
    gap: 9px;
}

.modal-content h3 i {
    color: #dc2626;
}

.modal-content p {
    color: #475569;
    line-height: 1.7;
    font-size: 14px;
    background: #f8fafc;
    padding: 17px;
    border-radius: 12px;
    border: 1px solid #edf1f6;
}

.close-btn {
    position: absolute;
    right: 18px;
    top: 15px;
    width: 34px;
    height: 34px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    color: #64748b;
    cursor: pointer;
    transition: 0.2s;
}

.close-btn:hover {
    background: #fee2e2;
    color: #dc2626;
}

/* ================= FOOTER ================= */

footer {
    background: linear-gradient(135deg,#0c2a52,#123c73);
    color: white;
    text-align: center;
    padding: 23px;
    font-size: 13px;
    box-shadow: 0 -5px 20px rgba(18,60,115,0.08);
}

footer p {
    opacity: 0.9;
}

/* ================= RESPONSIVE ================= */

@media(max-width: 900px) {

    .student-info,
    .summary {
        grid-template-columns: repeat(2,1fr);
    }
}

@media(max-width: 768px) {

    header {
        flex-direction: column;
        gap: 13px;
        padding: 15px 4%;
    }

    .header-right {
        flex-wrap: wrap;
        justify-content: center;
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

    .top-bar-right a {
        flex: 1;
        justify-content: center;
    }

    .student-info,
    .summary {
        grid-template-columns: 1fr;
    }

    .table-container {
        padding: 18px;
    }

    .student-card {
        padding: 22px;
    }
}

@media(max-width: 500px) {

    .logo {
        font-size: 20px;
    }

    .admin-badge,
    .dashboard-btn {
        font-size: 12px;
        padding: 8px 13px;
    }

    .top-bar-left h2 {
        font-size: 23px;
    }

    .modal-content {
        padding: 25px 20px;
    }
}

</style>

</head>

<body>

<header>

    <div class="logo">
        Modern Life <span>Public School</span>
    </div>

    <div class="header-right">

        <a href="${pageContext.request.contextPath}/admin/dashboard.jsp"
           class="dashboard-btn">

            <i class="fas fa-tachometer-alt"></i>
            Dashboard

        </a>

        <div class="admin-badge">

            <i class="fas fa-user-shield"></i>
            Admin Panel

        </div>

    </div>

</header>


<div class="container">

    <!-- TOP BAR -->

    <div class="top-bar">

        <div class="top-bar-left">

            <h2>
                Student Fees Details
            </h2>

            <p>
                Complete fee payment history of the student
            </p>

        </div>

        <div class="top-bar-right">

            <!-- ADD FEES -->

            <a href="${pageContext.request.contextPath}/student-fees?action=add&id=${studentId}&className=${fn:escapeXml(className)}"
               class="add-btn">

                <i class="fas fa-plus"></i>
                Add Fees

            </a>

            <!-- BACK TO SAME CLASS
            <a href="${pageContext.request.contextPath}/student-details?className=${fn:escapeXml(className)}"
               class="back-btn">

                <i class="fas fa-arrow-left"></i>
                Back to Class

            </a>
            -->

        </div>

    </div>


    <!-- STUDENT INFORMATION -->

    <c:if test="${not empty fees}">

        <div class="student-card">

            <h3>

                <i class="fas fa-user-graduate"></i>

                Student Information

            </h3>

            <div class="student-info">

                <div class="info-box">

                    <span class="info-label">
                        Student Name
                    </span>

                    <span class="info-value">
                        ${fees[0].studentName}
                    </span>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Father Name
                    </span>

                    <span class="info-value">
                        ${fees[0].fatherName}
                    </span>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Class
                    </span>

                    <span class="info-value">
                        ${fees[0].className}
                    </span>

                </div>

            </div>

        </div>

    </c:if>


    <!-- SUMMARY -->

    <c:if test="${not empty fees}">

        <%

            double totalPaid = 0;
            double totalPending = 0;
            int totalPayments = 0;

        %>

        <c:forEach var="fee" items="${fees}">

            <%

                com.reliable.school.model.Fee currentFee =
                    (com.reliable.school.model.Fee)
                    pageContext.getAttribute("fee");

                totalPayments++;

                if ("Paid".equalsIgnoreCase(
                        currentFee.getStatus())) {

                    totalPaid += currentFee.getAmount();

                } else if ("Pending".equalsIgnoreCase(
                        currentFee.getStatus())) {

                    totalPending += currentFee.getAmount();

                }

            %>

        </c:forEach>


        <div class="summary">

            <div class="summary-card">

                <i class="fas fa-file-invoice"></i>

                <h4>
                    Total Payments
                </h4>

                <p>
                    <%= totalPayments %>
                </p>

            </div>


            <div class="summary-card">

                <i class="fas fa-circle-check"></i>

                <h4>
                    Total Paid
                </h4>

                <p>
                    ₹ <%= String.format("%.2f", totalPaid) %>
                </p>

            </div>


            <div class="summary-card">

                <i class="fas fa-clock"></i>

                <h4>
                    Total Pending
                </h4>

                <p>
                    ₹ <%= String.format("%.2f", totalPending) %>
                </p>

            </div>

        </div>

    </c:if>


    <!-- FEE TABLE -->

    <div class="table-container">

        <div class="table-title">

            <i class="fas fa-history"></i>

            Fee Payment History

        </div>


        <c:choose>

            <c:when test="${not empty fees}">

                <table>

                    <thead>

                        <tr>

                            <th>Fee ID</th>
                            <th>Amount</th>
                            <th>Payment Date</th>
                            <th>Status</th>
                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody>

                        <c:forEach var="fee" items="${fees}">

                            <tr>

                                <td>
                                    ${fee.id}
                                </td>

                                <td>
                                    ₹ ${fee.amount}
                                </td>

                                <td>
                                    ${fee.paymentDate}
                                </td>

                                <td>

                                    <c:choose>

                                        <c:when test="${fee.status == 'Paid'}">

                                            <span class="status paid">

                                                <i class="fas fa-check-circle"></i>

                                                Paid

                                            </span>

                                        </c:when>

                                        <c:otherwise>

                                            <span class="status pending">

                                                <i class="fas fa-clock"></i>

                                                Pending

                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </td>


                                <td>

                                    <div class="action-btns">

                                        <!-- EDIT -->

                                        <a href="${pageContext.request.contextPath}/student-fees?action=edit&id=${fee.id}&className=${fn:escapeXml(className)}"
                                           class="edit-btn">

                                            <i class="fas fa-edit"></i>

                                            Edit

                                        </a>


                                        <!-- REASON -->

                                        <c:if test="${fee.status == 'Pending'}">

                                            <button type="button"
                                                    class="reason-btn"
                                                    onclick="showReason('${fee.id}', '${fn:escapeXml(fee.reason)}')">

                                                <i class="fas fa-comment"></i>

                                                Reason

                                            </button>

                                        </c:if>

                                    </div>

                                </td>

                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </c:when>


            <c:otherwise>

                <div class="no-data">

                    <i class="fas fa-file-invoice"></i>

                    <h3>
                        No Fee Records Found
                    </h3>

                    <p>
                        This student has no fee payment records yet.
                    </p>

                </div>

            </c:otherwise>

        </c:choose>

    </div>

</div>


<!-- REASON MODAL -->

<div class="modal" id="reasonModal">

    <div class="modal-content">

        <span class="close-btn"
              onclick="closeReason()">

            &times;

        </span>

        <h3>

            <i class="fas fa-comment"></i>

            Pending Fee Reason

        </h3>

        <p id="reasonText"></p>

    </div>

</div>


<footer>

    <p>
        © 2026 Modern Life Public School. All Rights Reserved.
    </p>

</footer>


<script>

function showReason(id, reason) {

    document.getElementById("reasonText").innerText =
        reason || "No reason provided.";

    document.getElementById("reasonModal").style.display =
        "flex";
}

function closeReason() {

    document.getElementById("reasonModal").style.display =
        "none";
}

window.onclick = function(event) {

    const modal =
        document.getElementById("reasonModal");

    if (event.target === modal) {

        modal.style.display = "none";

    }

}

</script>

</body>

</html>