package com.reliable.school.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.reliable.school.dao.StudentDAO;
import com.reliable.school.model.Student;

@WebServlet("/student-details")
public class StudentDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    // ========== GET ==========
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.isEmpty() || "classes".equals(action)) {
            showClasses(request, response);
        } else if ("students".equals(action)) {
            showStudents(request, response);
        } else if ("edit".equals(action)) {
            editStudent(request, response);
        } else if ("delete".equals(action)) {
            deleteStudent(request, response);
        } else {
            response.sendRedirect(
                request.getContextPath() + "/student-details?action=classes"
            );
        }
    }

    // ========== POST ==========
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addStudent(request, response);
        } else if ("update".equals(action)) {
            updateStudent(request, response);
        } else {
            response.sendRedirect(
                request.getContextPath() + "/student-details?action=classes"
            );
        }
    }

    // ========== SHOW CLASSES ==========
    private void showClasses(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/student-classes.jsp")
               .forward(request, response);
    }

    // ========== SHOW STUDENTS OF ONE CLASS ==========
    private void showStudents(HttpServletRequest request,
                              HttpServletResponse response)
            throws ServletException, IOException {

        String className = request.getParameter("className");

        if (className == null || className.trim().isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/student-details?action=classes"
            );
            return;
        }

        className = className.trim();

        List<Student> students = studentDAO.getStudentsByClass(className);

        request.setAttribute("students", students);
        request.setAttribute("className", className);

        request.getRequestDispatcher("/admin/student-details.jsp")
               .forward(request, response);
    }

    // ========== ADD ==========
    private void addStudent(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        String className = request.getParameter("className");

        Student student = new Student();
        student.setName(request.getParameter("name"));
        student.setFatherName(request.getParameter("fatherName"));
        student.setClassName(className);
        student.setRollNumber(request.getParameter("rollNumber"));
        student.setMobile(request.getParameter("mobile"));
        student.setAddress(request.getParameter("address"));

        studentDAO.addStudent(student);

        response.sendRedirect(
            request.getContextPath()
            + "/student-details?action=students&className="
            + (className != null ? className : "")
        );
    }

    // ========== EDIT (form open) ==========
    private void editStudent(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/student-details?action=classes"
            );
            return;
        }

        int id = Integer.parseInt(idParam);
        Student student = studentDAO.getStudentById(id);

        if (student == null) {
            response.sendRedirect(
                request.getContextPath() + "/student-details?action=classes"
            );
            return;
        }

        request.setAttribute("student", student);
        request.getRequestDispatcher("/admin/edit-student.jsp")
               .forward(request, response);
    }

    // ========== UPDATE ==========
    private void updateStudent(HttpServletRequest request,
                               HttpServletResponse response)
            throws IOException {

        String className = request.getParameter("className");

        Student student = new Student();
        student.setId(Integer.parseInt(request.getParameter("id")));
        student.setName(request.getParameter("name"));
        student.setFatherName(request.getParameter("fatherName"));
        student.setClassName(className);
        student.setRollNumber(request.getParameter("rollNumber"));
        student.setMobile(request.getParameter("mobile"));
        student.setAddress(request.getParameter("address"));

        studentDAO.updateStudent(student);

        response.sendRedirect(
            request.getContextPath()
            + "/student-details?action=students&className="
            + (className != null ? className : "")
        );
    }

    // ========== DELETE ==========
    private void deleteStudent(HttpServletRequest request,
                               HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String className = request.getParameter("className");

        if (className == null || className.isEmpty()) {
            Student s = studentDAO.getStudentById(id);
            if (s != null) {
                className = s.getClassName();
            } else {
                className = "";
            }
        }

        studentDAO.deleteStudent(id);

        response.sendRedirect(
            request.getContextPath()
            + "/student-details?action=students&className="
            + className
        );
    }
}