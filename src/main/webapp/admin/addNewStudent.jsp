<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Student - Modern Life Public School</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f4f9;
            color: #333;
            min-height: 100vh;
        }

        header {
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            padding: 18px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 20px rgba(18, 60, 115, 0.25);
        }

        .logo { font-size: 24px; font-weight: 700; }
        .logo span { color: #fbbf24; }

        .header-right {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .dashboard-btn {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            padding: 8px 18px;
            border-radius: 50px;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: 0.3s;
        }
        .dashboard-btn:hover {
            background: #fbbf24;
            color: #123c73;
            border-color: #fbbf24;
        }

        .admin-badge {
            background: rgba(255, 255, 255, 0.15);
            padding: 8px 18px;
            border-radius: 50px;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .admin-badge i { color: #fbbf24; }

        .container {
            max-width: 900px;
            margin: 40px auto 60px;
            padding: 0 20px;
        }

        .card {
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(18, 60, 115, 0.08);
            border: 1px solid rgba(18, 60, 115, 0.06);
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 28px;
            padding-bottom: 16px;
            border-bottom: 2px solid #eef2f7;
        }

        .card-header .icon {
            width: 44px;
            height: 44px;
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .card-header h2 {
            color: #123c73;
            font-size: 22px;
            font-weight: 700;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full {
            grid-column: 1 / -1;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #1e3a5f;
            font-size: 14px;
        }

        input, select {
            padding: 13px 16px;
            border: 1.5px solid #d1d9e6;
            border-radius: 10px;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
            background: #fafbfc;
            transition: 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #123c73;
            background: white;
            box-shadow: 0 0 0 4px rgba(18, 60, 115, 0.1);
        }

        /* Class field locked style */
        input.readonly-field {
            background: #eef2f7;
            color: #475569;
            font-weight: 600;
            cursor: not-allowed;
        }

        .class-note {
            font-size: 12px;
            color: #64748b;
            margin-top: 6px;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 28px;
            flex-wrap: wrap;
        }

        .submit-btn, .cancel-btn {
            padding: 13px 28px;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: 0.3s;
            border: none;
        }

        .submit-btn {
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            box-shadow: 0 6px 18px rgba(18, 60, 115, 0.3);
        }
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(18, 60, 115, 0.4);
        }

        .cancel-btn {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #dbe2ea;
        }
        .cancel-btn:hover {
            background: #e2e8f0;
            color: #123c73;
        }

        footer {
            background: #0c2a52;
            color: white;
            text-align: center;
            padding: 22px;
            font-size: 14px;
        }
        footer p { opacity: 0.9; }

        @media (max-width: 768px) {
            header {
                flex-direction: column;
                gap: 12px;
                padding: 15px 4%;
            }
            .form-grid { grid-template-columns: 1fr; }
            .buttons { flex-direction: column; }
            .submit-btn, .cancel-btn { width: 100%; justify-content: center; }
        }
    </style>
</head>

<body>

<%
    // Jo class student-details se aayi hai
    String selectedClass = request.getParameter("className");
    if (selectedClass == null || selectedClass.trim().isEmpty()) {
        selectedClass = "";
    }
%>

<header>
    <div class="logo">
        Modern Life <span>Public School</span>
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

<div class="container">
    <div class="card">

        <div class="card-header">
            <div class="icon">
                <i class="fas fa-user-plus"></i>
            </div>
            <h2>Add New Student</h2>
        </div>

        <form action="${pageContext.request.contextPath}/student-details" method="post">

            <input type="hidden" name="action" value="add">

            <!-- Class locked - value form se bhejne ke liye hidden -->
            <input type="hidden" name="className" value="<%= selectedClass %>">

            <div class="form-grid">

                <div class="form-group">
                    <label>Student Name *</label>
                    <input type="text"
                           name="name"
                           placeholder="Enter student name"
                           required>
                </div>

                <div class="form-group">
                    <label>Father's Name *</label>
                    <input type="text"
                           name="fatherName"
                           placeholder="Enter father's name"
                           required>
                </div>

                <div class="form-group">
                    <label>Class *</label>
                    <input type="text"
                           class="readonly-field"
                           value="<%= selectedClass.isEmpty() ? "Not selected" : "Class " + selectedClass %>"
                           readonly>
                    <div class="class-note">
                        Class auto-selected from previous page (cannot change)
                    </div>
                </div>

                <div class="form-group">
                    <label>Roll Number *</label>
                    <input type="text"
                           name="rollNumber"
                           placeholder="Enter roll number"
                           required>
                </div>

                <div class="form-group">
                    <label>Mobile Number</label>
                    <input type="tel"
                           name="mobile"
                           placeholder="Enter mobile number">
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input type="text"
                           name="address"
                           placeholder="Enter address">
                </div>

            </div>

            <div class="buttons">
                <button type="submit" class="submit-btn">
                    <i class="fas fa-check-circle"></i>
                    Submit
                </button>

                <a href="${pageContext.request.contextPath}/student-details<%= selectedClass.isEmpty() ? "" : "?className=" + selectedClass %>"
                   class="cancel-btn">
                    <i class="fas fa-times"></i>
                    Cancel
                </a>
            </div>

        </form>

    </div>
</div>

<footer>
    <p>© 2026 Modern Life Public SchoolModern Life Public School. All Rights Reserved.</p>
</footer>

</body>
</html>