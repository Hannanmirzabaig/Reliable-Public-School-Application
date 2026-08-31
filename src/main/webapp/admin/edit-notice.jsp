<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Notice - Modern Life Public School</title>

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

/* HEADER */

header {
    background: #1e3a8a;
    color: white;
    padding: 20px 40px;

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 24px;
    font-weight: bold;
}

.admin {
    font-size: 14px;
}

/* CONTAINER */

.container {
    width: 90%;
    max-width: 700px;
    margin: 45px auto;
}

/* CARD */

.card {
    background: white;
    padding: 30px;

    border-radius: 12px;

    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
}

.card h2 {
    color: #1e3a8a;
    margin-bottom: 25px;

    border-bottom: 2px solid #e5e7eb;
    padding-bottom: 12px;
}

/* FORM */

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
}

input,
textarea {
    width: 100%;

    padding: 12px;

    border: 1px solid #d1d5db;

    border-radius: 7px;

    font-size: 14px;
}

textarea {
    height: 130px;
    resize: vertical;
}

input:focus,
textarea:focus {
    outline: none;
    border-color: #2563eb;
}

/* BUTTONS */

.buttons {
    margin-top: 25px;
}

.update-btn {
    background: #2563eb;
    color: white;

    border: none;

    padding: 11px 22px;

    border-radius: 7px;

    cursor: pointer;

    font-size: 14px;
}

.cancel-btn {
    background: #6b7280;
    color: white;

    padding: 11px 22px;

    border-radius: 7px;

    text-decoration: none;

    margin-left: 8px;
}

.update-btn:hover {
    background: #1d4ed8;
}

.cancel-btn:hover {
    background: #4b5563;
}

</style>

</head>

<body>


<!-- HEADER -->

<header>

    <div class="logo">
        Modern Life Public School
    </div>

    <div class="admin">
        Admin Panel
    </div>

</header>


<!-- MAIN -->

<div class="container">

    <div class="card">

        <h2>✏️ Edit Notice</h2>


        <form action="${pageContext.request.contextPath}/notice"
              method="post">


            <!-- ACTION -->

            <input type="hidden"
                   name="action"
                   value="update">


            <!-- ID -->

            <input type="hidden"
                   name="id"
                   value="${notice.id}">


            <!-- TITLE -->

            <div class="form-group">

                <label>Notice Title</label>

                <input type="text"
                       name="title"
                       value="${notice.title}"
                       required>

            </div>


            <!-- DESCRIPTION -->

            <div class="form-group">

                <label>Description</label>

                <textarea name="description"
                          required>${notice.description}</textarea>

            </div>


            <!-- DATE -->

            <div class="form-group">

                <label>Notice Date</label>

                <input type="date"
                       name="noticeDate"
                       value="${notice.noticeDate}"
                       required>

            </div>


            <!-- BUTTONS -->

            <div class="buttons">

                <button type="submit"
                        class="update-btn">

                    Update Notice

                </button>


                <a href="${pageContext.request.contextPath}/notice?action=list"
                   class="cancel-btn">

                    Cancel

                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>