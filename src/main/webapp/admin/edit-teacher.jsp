<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.reliable.school.model.Teacher"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Teacher - Reliable Public School</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }

        h1 {
            color: #1e3a8a;
            margin-bottom: 25px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full {
            grid-column: 1 / -1;
        }

        label {
            font-weight: bold;
            margin-bottom: 7px;
        }

        input {
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .btn {
            margin-top: 25px;
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

        .back {
            display: inline-block;
            margin-left: 10px;
            text-decoration: none;
            color: #1e3a8a;
        }

        @media (max-width: 768px) {

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full {
                grid-column: auto;
            }
        }

    </style>

</head>

<body>

<%
    Teacher teacher =
        (Teacher) request.getAttribute("teacher");
%>

<%
    if (teacher == null) {
%>

    <div class="container">
        <div class="box">

            <h1>Teacher Not Found</h1>

            <a href="<%= request.getContextPath() %>/teacher?action=list"
               class="back">
                Back to Teacher List
            </a>

        </div>
    </div>

<%
    } else {
%>

<div class="container">

    <div class="box">

        <h1>Edit Teacher</h1>

        <form action="<%= request.getContextPath() %>/teacher"
              method="post">

            <!-- UPDATE ACTION -->

            <input
                type="hidden"
                name="action"
                value="update"
            >

            <!-- TEACHER ID -->

            <input
                type="hidden"
                name="id"
                value="<%= teacher.getId() %>"
            >

            <div class="form-grid">

                <!-- NAME -->

                <div class="form-group">

                    <label>
                        Teacher Name
                    </label>

                    <input
                        type="text"
                        name="name"
                        value="<%= teacher.getName() %>"
                        required
                    >

                </div>


                <!-- SUBJECT -->

                <div class="form-group">

                    <label>
                        Subject
                    </label>

                    <input
                        type="text"
                        name="subject"
                        value="<%= teacher.getSubject() %>"
                        required
                    >

                </div>


                <!-- QUALIFICATION -->

                <div class="form-group">

                    <label>
                        Qualification
                    </label>

                    <input
                        type="text"
                        name="qualification"
                        value="<%= teacher.getQualification() %>"
                        required
                    >

                </div>


                <!-- MOBILE -->

                <div class="form-group">

                    <label>
                        Mobile Number
                    </label>

                    <input
                        type="tel"
                        name="mobile"
                        value="<%= teacher.getMobile() %>"
                    >

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>
                        Email
                    </label>

                    <input
                        type="email"
                        name="email"
                        value="<%= teacher.getEmail() %>"
                    >

                </div>


                <!-- ADDRESS -->

                <div class="form-group">

                    <label>
                        Address
                    </label>

                    <input
                        type="text"
                        name="address"
                        value="<%= teacher.getAddress() %>"
                    >

                </div>

            </div>


            <!-- UPDATE BUTTON -->

            <button
                type="submit"
                class="btn">

                Update Teacher

            </button>


            <!-- CANCEL -->

            <a
                href="<%= request.getContextPath() %>/teacher?action=list"
                class="back">

                Cancel

            </a>

        </form>

    </div>

</div>

<%
    }
%>

</body>
</html>