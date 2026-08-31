<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Notice - Modern Life Public School</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
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

        .logo { font-size: 24px; font-weight: 700; letter-spacing: 0.5px; }
        .logo span { color: #fbbf24; }

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
            max-width: 800px;
            margin: 50px auto 60px;
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
            margin-bottom: 30px;
            padding-bottom: 18px;
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
            font-size: 23px;
            font-weight: 700;
        }

        .form-group { margin-bottom: 22px; }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #1e3a5f;
            font-size: 14px;
        }

        input, textarea {
            width: 100%;
            padding: 13px 16px;
            border: 1.5px solid #d1d9e6;
            border-radius: 10px;
            font-size: 15px;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            background: #fafbfc;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #123c73;
            background: white;
            box-shadow: 0 0 0 4px rgba(18, 60, 115, 0.1);
        }

        textarea {
            height: 150px;
            resize: vertical;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 10px;
        }

        .submit-btn, .back-btn {
            padding: 13px 25px;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn {
            background: linear-gradient(135deg, #123c73, #1e4a8a);
            color: white;
            border: none;
            box-shadow: 0 6px 18px rgba(18, 60, 115, 0.3);
        }
        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(18, 60, 115, 0.4);
        }

        .back-btn {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #dbe2ea;
        }
        .back-btn:hover {
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
                padding: 15px 4%;
                flex-direction: column;
                gap: 12px;
            }
            .container { width: 94%; margin: 30px auto 40px; }
            .card { padding: 25px 20px; }
            .card-header h2 { font-size: 20px; }
            .buttons { flex-direction: column; }
            .submit-btn, .back-btn { width: 100%; }
        }
    </style>
</head>

<body>

<header>
    <div class="logo">
        Modern Life <span>Public School</span>
    </div>
    <div class="admin-badge">
        <i class="fas fa-user-shield"></i>
        Admin Panel
    </div>
</header>

<div class="container">
    <div class="card">

        <div class="card-header">
            <div class="icon">
                <i class="fas fa-plus"></i>
            </div>
            <h2>Add New Notice</h2>
        </div>

        <form action="${pageContext.request.contextPath}/notice" method="post">

            <input type="hidden" name="action" value="add">

            <div class="form-group">
                <label for="title">Notice Title</label>
                <input type="text"
                       id="title"
                       name="title"
                       placeholder="Enter notice title"
                       required>
            </div>

            <div class="form-group">
                <label for="noticeDate">Notice Date</label>
                <input type="date"
                       id="noticeDate"
                       name="noticeDate"
                       required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description"
                          name="description"
                          placeholder="Enter notice details"
                          required></textarea>
            </div>

            <div class="buttons">
                <button type="submit" class="submit-btn">
                    <i class="fas fa-plus-circle"></i>
                    Add Notice
                </button>

                <a href="${pageContext.request.contextPath}/notice"
                   class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                    Back to Notices
                </a>
            </div>

        </form>

    </div>
</div>

<footer>
    <p>© 2026 Modern Life Public School. All Rights Reserved.</p>
</footer>

</body>
</html>