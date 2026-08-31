<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Manage Fees - Modern Life Public School</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #333;
        }

        /* Header */

        header {
            background: #1e3a8a;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .back {
            color: white;
            text-decoration: none;
            background: #162d6b;
            padding: 10px 18px;
            border-radius: 6px;
        }

        .back:hover {
            background: #0f2457;
        }

        /* Container */

        .container {
            max-width: 1100px;
            margin: auto;
            padding: 40px 20px;
        }

        .title {
            text-align: center;
            color: #1e3a8a;
            margin-bottom: 30px;
        }

        /* Add Fee Card */

        .form-card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            margin-bottom: 35px;
        }

        .form-card h2 {
            color: #1e3a8a;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        label {
            font-weight: bold;
            margin-bottom: 7px;
            display: block;
        }

        input,
        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #1e3a8a;
        }

        .btn {
            margin-top: 24px;
            background: #1e3a8a;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
        }

        .btn:hover {
            background: #162d6b;
        }

        /* Table */

        .table-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        .table-card h2 {
            color: #1e3a8a;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #1e3a8a;
            color: white;
            padding: 13px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f8fafc;
        }

        .edit {
            background: #f59e0b;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
            text-decoration: none;
        }

        .delete {
            background: #dc2626;
            color: white;
            padding: 7px 12px;
            border-radius: 5px;
            text-decoration: none;
        }

        .edit:hover {
            background: #d97706;
        }

        .delete:hover {
            background: #b91c1c;
        }

        .success {
            background: #dcfce7;
            color: #166534;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        .empty {
            text-align: center;
            padding: 25px;
            color: #777;
        }

        /* Mobile */

        @media (max-width: 768px) {

            header {
                flex-direction: column;
                gap: 15px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>

</head>

<body>

<!-- Header -->

<header>

    <div class="logo">
        Modern Life Public School
    </div>

    <a href="${pageContext.request.contextPath}/admin/dashboard.jsp"
       class="back">
        ← Dashboard
    </a>

</header>


<div class="container">

    <h1 class="title">
        Student Fee Management
    </h1>


    <!-- SUCCESS MESSAGE -->

    <c:if test="${param.success == 'added'}">

        <div class="success">
            Fee added successfully!
        </div>

    </c:if>

    <c:if test="${param.success == 'updated'}">

        <div class="success">
            Fee updated successfully!
        </div>

    </c:if>

    <c:if test="${param.success == 'deleted'}">

        <div class="success">
            Fee deleted successfully!
        </div>

    </c:if>


    <!-- ERROR MESSAGE -->

    <c:if test="${param.error != null}">

        <div class="error">
            Something went wrong. Please try again.
        </div>

    </c:if>


    <!-- ADD FEE -->

    <div class="form-card">

        <h2>
            Add Student Fee
        </h2>

        <form action="${pageContext.request.contextPath}/fee"
              method="post">

            <input type="hidden"
                   name="action"
                   value="add">


            <div class="form-grid">

                <div>

                    <label>
                        Student ID
                    </label>

                    <input type="number"
                           name="studentId"
                           placeholder="Enter Student ID"
                           required>

                </div>

               <div>

                    <label>
                        Student Name
                    </label>

                    <input type="text"
                           name="student_name"
                           placeholder="Enter Student Name"
                           required>

                </div>
               
                <div>

                    <label>
                        Student father name
                    </label>

                    <input type="text"
                           name="father_name"
                           placeholder="Enter Student father name"
                           >

                </div>
                
                <div>

                    <label>
                        Student Class Name
                    </label>

                    <input type="text"
                           name="class_name"
                           placeholder="Enter class name"
                           required>

                </div>
                





                <div>

                    <label>
                        Fee Amount
                    </label>

                    <input type="number"
                           name="amount"
                           placeholder="Enter Amount"
                           step="0.01"
                           required>

                </div>


                <div>

                    <label>
                        Status
                    </label>

                    <select name="status" required>

                        <option value="">
                            Select Status
                        </option>

                        <option value="Paid">
                            Paid
                        </option>

                        <option value="Pending">
                            Pending
                        </option>

                    </select>

                </div>

            </div>


            <button type="submit" class="btn">
                + Add Fee
            </button>

        </form>

    </div>


    <!-- FEE LIST -->

    <div class="table-card">

        <h2>
            Fee Records
        </h2>


        <c:choose>

            <c:when test="${not empty fees}">

                <table>

                    <thead>

                        <tr>

                            <th>ID</th>

                            <th>Student ID</th>
                            <th>Name</th>
                            <th>F Name</th>
                             <th>Class</th>
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
                                    ${fee.studentId}
                                </td>
                                 <td>
                                    ${fee.studentName}
                                </td>
                                 <td>
                                    ${fee.fatherName}
                                </td>
                                <td>
                                    ${fee.className}
                                </td>
                                <td>
                                    ₹ ${fee.amount}
                                </td>

                                <td>
                                    ${fee.paymentDate}
                                </td>

                                <td>
                                    ${fee.status}
                                </td>

                                <td>

                                    <a class="edit"
                                       href="${pageContext.request.contextPath}/fee?action=edit&id=${fee.id}">
                                        Edit
                                    </a>

                                    &nbsp;

                                    <a class="delete"
                                       href="${pageContext.request.contextPath}/fee?action=delete&id=${fee.id}"
                                       onclick="return confirm('Are you sure you want to delete this fee?');">
                                        Delete
                                    </a>

                                </td>

                            </tr>

                        </c:forEach>

                    </tbody>

                </table>

            </c:when>


            <c:otherwise>

                <div class="empty">

                    No fee records available.

                </div>

            </c:otherwise>

        </c:choose>

    </div>

</div>


</body>
</html>