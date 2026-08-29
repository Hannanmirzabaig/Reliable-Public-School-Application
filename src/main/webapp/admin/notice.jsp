<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notice Management - Reliable Public School</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f4f9;
            color: #333;
            line-height: 1.6;
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
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo { font-size: 24px; font-weight: 700; letter-spacing: 0.5px; }
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
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
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
            width: 94%;
            max-width: 1200px;
            margin: 40px auto 60px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .top-bar h2 {
            color: #123c73;
            font-size: 24px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .add-btn {
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            padding: 12px 24px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 15px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 6px 18px rgba(18, 60, 115, 0.3);
            transition: all 0.3s ease;
        }
        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(18, 60, 115, 0.4);
        }

        .card {
            background: white;
            padding: 32px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(18, 60, 115, 0.08);
            border: 1px solid rgba(18, 60, 115, 0.06);
        }

        .table-wrapper {
            overflow-x: auto;
            border-radius: 12px;
            border: 1px solid #e5eaf2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 700px;
        }

        th {
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            padding: 16px 18px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
        }
        th:first-child { border-radius: 12px 0 0 0; }
        th:last-child { border-radius: 0 12px 0 0; }

        td {
            padding: 16px 18px;
            border-bottom: 1px solid #eef2f7;
            vertical-align: middle;
            font-size: 14.5px;
        }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #f8fafd; }

        .notice-id {
            font-weight: 600;
            color: #64748b;
            background: #f1f5f9;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 13px;
        }
        .notice-title {
            font-weight: 600;
            color: #123c73;
            font-size: 15px;
        }
        .description {
            max-width: 380px;
            color: #64748b;
            line-height: 1.5;
        }
        .notice-date {
            color: #475569;
            font-weight: 500;
            white-space: nowrap;
        }

        .action-btns {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .edit-btn,
        .delete-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 14px;
            text-decoration: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.25s ease;
        }
        .edit-btn {
            background: #fef3c7;
            color: #b45309;
        }
        .edit-btn:hover {
            background: #f59e0b;
            color: white;
            transform: translateY(-2px);
        }
        .delete-btn {
            background: #fee2e2;
            color: #b91c1c;
        }
        .delete-btn:hover {
            background: #dc2626;
            color: white;
            transform: translateY(-2px);
        }

        .empty {
            text-align: center;
            padding: 50px 20px;
            color: #94a3b8;
        }
        .empty i {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.5;
            display: block;
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
                padding: 15px 4%;
                flex-direction: column;
                gap: 12px;
            }
            .header-right {
                flex-wrap: wrap;
                justify-content: center;
            }
            .container { width: 96%; margin: 25px auto 40px; }
            .card { padding: 22px 18px; }
            .top-bar h2 { font-size: 20px; }
            .add-btn { width: 100%; justify-content: center; }
            th, td { padding: 12px 14px; }
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
        Reliable <span>Public School</span>
    </div>

    <div class="header-right">
        <!-- GO TO DASHBOARD BUTTON -->
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

    <div class="top-bar">
        <h2>
            <i class="fas fa-clipboard-list"></i>
            All Notices
        </h2>

        <a href="${pageContext.request.contextPath}/admin/addNotice.jsp"
           class="add-btn">
            <i class="fas fa-plus-circle"></i>
            Add Notice
        </a>
    </div>

    <div class="card">
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty notices}">
                            <c:forEach var="notice" items="${notices}">
                                <tr>
                                    <td>
                                        <span class="notice-id">#${notice.id}</span>
                                    </td>
                                    <td class="notice-title">
                                        ${notice.title}
                                    </td>
                                    <td class="description">
                                        ${notice.description}
                                    </td>
                                    <td class="notice-date">
                                        <i class="far fa-calendar-alt" style="margin-right:6px; opacity:0.7;"></i>
                                        ${notice.noticeDate}
                                    </td>
                                    <td>
                                        <div class="action-btns">

                                            <a href="${pageContext.request.contextPath}/notice?action=edit&id=${notice.id}"
                                               class="edit-btn">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>

                                            <a href="${pageContext.request.contextPath}/notice?action=delete&id=${notice.id}"
                                               class="delete-btn"
                                               onclick="return confirm('Are you sure you want to delete this notice?');">
                                                <i class="fas fa-trash-alt"></i> Delete
                                            </a>

                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5" class="empty">
                                    <i class="fas fa-inbox"></i>
                                    <p>No notices available.</p>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<footer>
    <p>© 2026 Reliable Public School. All Rights Reserved.</p>
</footer>

</body>
</html>