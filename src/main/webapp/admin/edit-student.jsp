<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.reliable.school.model.Student"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Student - Reliable Public School</title>

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

/* Class locked */
.readonly-field {
    background: #eef2f7;
    color: #475569;
    font-weight: 600;
    cursor: not-allowed;
}

.class-note {
    font-size: 12px;
    color: #64748b;
    margin-top: 5px;
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
    background: #16316f;
}

.back {
    display: inline-block;
    margin-left: 10px;
    text-decoration: none;
    color: #1e3a8a;
}

.back:hover {
    text-decoration: underline;
}

.error {
    background: #fee2e2;
    color: #991b1b;
    padding: 12px;
    border-radius: 6px;
    margin-bottom: 20px;
}

@media (max-width: 768px) {

    .form-grid {
        grid-template-columns: 1fr;
    }

    .btn {
        width: 100%;
    }

    .back {
        margin-left: 0;
        margin-top: 15px;
    }
}

</style>

</head>

<body>

<div class="container">

```
<div class="box">

    <h1>
        Edit Student
    </h1>

    <%

        Student student =
            (Student) request.getAttribute("student");

        if (student == null) {

    %>

        <div class="error">

            Student data not found.

            <br><br>

            Please open the Edit page from Student Details.

        </div>

        <a
            href="<%= request.getContextPath() %>/student-details?action=classes"
            class="back">

            Back to Classes

        </a>

    <%

        } else {

    %>


    <!-- ================= UPDATE FORM ================= -->

    <form
        action="<%= request.getContextPath() %>/student-details"
        method="post">


        <!-- Action -->

        <input
            type="hidden"
            name="action"
            value="update">


        <!-- Student ID -->

        <input
            type="hidden"
            name="id"
            value="<%= student.getId() %>">


        <!-- Class value -->
        <!-- Class change nahi hogi -->

        <input
            type="hidden"
            name="className"
            value="<%= student.getClassName() %>">


        <div class="form-grid">


            <!-- Student Name -->

            <div class="form-group">

                <label>
                    Student Name
                </label>

                <input
                    type="text"
                    name="name"
                    value="<%= student.getName() %>"
                    required>

            </div>


            <!-- Father's Name -->

            <div class="form-group">

                <label>
                    Father's Name
                </label>

                <input
                    type="text"
                    name="fatherName"
                    value="<%= student.getFatherName() %>"
                    required>

            </div>


            <!-- Class -->

            <div class="form-group">

                <label>
                    Class
                </label>

                <input
                    type="text"
                    class="readonly-field"
                    value="Class <%= student.getClassName() %>"
                    readonly>

                <div class="class-note">
                    Class cannot be changed while editing.
                </div>

            </div>


            <!-- Roll Number -->

            <div class="form-group">

                <label>
                    Roll Number
                </label>

                <input
                    type="text"
                    name="rollNumber"
                    value="<%= student.getRollNumber() %>"
                    required>

            </div>


            <!-- Mobile -->

            <div class="form-group">

                <label>
                    Mobile Number
                </label>

                <input
                    type="tel"
                    name="mobile"
                    value="<%= student.getMobile() %>">

            </div>


            <!-- Address -->

            <div class="form-group">

                <label>
                    Address
                </label>

                <input
                    type="text"
                    name="address"
                    value="<%= student.getAddress() %>">

            </div>


        </div>


        <!-- UPDATE BUTTON -->

        <button
            type="submit"
            class="btn">

            Update Student

        </button>


        <!-- CANCEL -->

        <a
            href="<%= request.getContextPath() %>/student-details?action=students&className=<%= student.getClassName() %>"
            class="back">

            Cancel

        </a>


    </form>


    <%

        }

    %>

</div>
```

</div>

</body>

</html>
