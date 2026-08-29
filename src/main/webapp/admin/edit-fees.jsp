<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.reliable.school.model.Fee" %>

<!DOCTYPE html>

<html lang="en">

<head>

```
<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Edit Fee - Reliable Public School</title>

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
        background: #f0f4f9;
        min-height: 100vh;
    }

    header {
        background: linear-gradient(135deg,#123c73,#1e4a8a);
        color: white;
        padding: 18px 5%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        font-size: 24px;
        font-weight: 700;
    }

    .logo span {
        color: #fbbf24;
    }

    .admin-badge {
        background: rgba(255,255,255,0.15);
        padding: 8px 18px;
        border-radius: 50px;
    }

    .admin-badge i {
        color: #fbbf24;
        margin-right: 7px;
    }

    .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 0 20px;
    }

    .card {
        background: white;
        padding: 35px;
        border-radius: 18px;
        box-shadow: 0 10px 30px rgba(18,60,115,0.10);
    }

    .title {
        text-align: center;
        margin-bottom: 30px;
    }

    .title i {
        font-size: 45px;
        color: #123c73;
        margin-bottom: 10px;
    }

    .title h2 {
        color: #123c73;
    }

    .student-info {
        background: #eff6ff;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 25px;
        color: #1d4ed8;
        font-size: 14px;
        font-weight: 600;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-size: 14px;
        font-weight: 600;
        color: #334155;
    }

    input,
    select,
    textarea {
        width: 100%;
        padding: 13px 15px;
        border: 1px solid #dbe2ea;
        border-radius: 10px;
        font-family: 'Poppins',sans-serif;
        font-size: 14px;
        outline: none;
    }

    textarea {
        min-height: 100px;
        resize: vertical;
    }

    input:focus,
    select:focus,
    textarea:focus {
        border-color: #123c73;
    }

    .error {
        background: #fee2e2;
        color: #b91c1c;
        padding: 12px 15px;
        border-radius: 10px;
        margin-bottom: 20px;
        font-size: 13px;
    }

    .buttons {
        display: flex;
        gap: 12px;
        margin-top: 25px;
    }

    .btn {
        flex: 1;
        padding: 12px;
        border-radius: 10px;
        text-decoration: none;
        text-align: center;
        border: none;
        cursor: pointer;
        font-family: 'Poppins',sans-serif;
        font-size: 14px;
        font-weight: 600;
    }

    .update-btn {
        background: linear-gradient(135deg,#123c73,#1e4a8a);
        color: white;
    }

    .back-btn {
        background: #f1f5f9;
        color: #123c73;
        border: 1px solid #dbe2ea;
    }

    footer {
        background: #0c2a52;
        color: white;
        text-align: center;
        padding: 22px;
        margin-top: 60px;
        font-size: 14px;
    }

    @media(max-width:600px) {

        header {
            flex-direction: column;
            gap: 12px;
        }

        .card {
            padding: 25px 20px;
        }

        .buttons {
            flex-direction: column;
        }
    }

</style>
```

</head>

<body>

<%
Fee fee =
    (Fee) request.getAttribute("fee");

String error =
    (String) request.getAttribute("error");

%>

<header>

```
<div class="logo">
    Reliable <span>Public School</span>
</div>

<div class="admin-badge">

    <i class="fas fa-user-shield"></i>

    Admin Panel

</div>
```

</header>

<div class="container">

```
<div class="card">

    <div class="title">

        <i class="fas fa-pen-to-square"></i>

        <h2>Edit Fee</h2>

    </div>


    <% if (error != null) { %>

        <div class="error">

            <i class="fas fa-exclamation-circle"></i>

            <%= error %>

        </div>

    <% } %>


    <% if (fee != null) { %>


        <div class="student-info">

            <i class="fas fa-user-graduate"></i>

            Student:
            <%= fee.getStudentName() %>

            &nbsp; | &nbsp;

            Class:
            <%= fee.getClassName() %>

        </div>


        <form action="${pageContext.request.contextPath}/student-fees"
              method="post">


            <input type="hidden"
                   name="action"
                   value="update">


            <input type="hidden"
                   name="feeId"
                   value="<%= fee.getId() %>">


            <input type="hidden"
                   name="studentId"
                   value="<%= fee.getStudentId() %>">


            <div class="form-group">

                <label for="amount">

                    <i class="fas fa-rupee-sign"></i>

                    Fee Amount

                </label>

                <input type="number"
                       id="amount"
                       name="amount"
                       value="<%= fee.getAmount() %>"
                       step="0.01"
                       min="0.01"
                       required>

            </div>


            <div class="form-group">

                <label for="status">

                    <i class="fas fa-circle-check"></i>

                    Payment Status

                </label>

                <select id="status"
                        name="status"
                        onchange="toggleReason()"
                        required>

                    <option value="Paid"
                        <%= "Paid".equalsIgnoreCase(fee.getStatus()) ? "selected" : "" %>>
                        Paid
                    </option>

                    <option value="Pending"
                        <%= "Pending".equalsIgnoreCase(fee.getStatus()) ? "selected" : "" %>>
                        Pending
                    </option>

                </select>

            </div>


            <div class="form-group"
                 id="reasonGroup"
                 style="<%= "Pending".equalsIgnoreCase(fee.getStatus()) ? "display:block;" : "display:none;" %>">

                <label for="reason">

                    <i class="fas fa-comment"></i>

                    Reason for Pending

                </label>

                <textarea id="reason"
                          name="reason"
                          placeholder="Enter reason for pending fee"><%= fee.getReason() != null ? fee.getReason() : "" %></textarea>

            </div>


            <div class="buttons">

                <a href="${pageContext.request.contextPath}/student-fees?action=view&id=<%= fee.getStudentId() %>"
                   class="btn back-btn">

                    <i class="fas fa-arrow-left"></i>

                    Back

                </a>


                <button type="submit"
                        class="btn update-btn">

                    <i class="fas fa-save"></i>

                    Update Fee

                </button>

            </div>


        </form>


    <% } %>

</div>
```

</div>

<footer>

```
<p>
    © 2026 Reliable Public School. All Rights Reserved.
</p>
```

</footer>

<script>

    function toggleReason() {

        const status =
            document.getElementById("status").value;

        const group =
            document.getElementById("reasonGroup");

        const reason =
            document.getElementById("reason");


        if (status === "Pending") {

            group.style.display = "block";

            reason.required = true;

        } else {

            group.style.display = "none";

            reason.required = false;

            reason.value = "";

        }
    }


    window.onload = function() {

        toggleReason();

    };

</script>

</body>

</html>
