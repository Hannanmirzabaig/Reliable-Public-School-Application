package com.reliable.school.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.reliable.school.dao.TeacherDAO;
import com.reliable.school.model.Admin;
import com.reliable.school.model.Teacher;

@WebServlet("/teacher")
public class TeacherServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TeacherDAO teacherDAO;

    @Override
    public void init() throws ServletException {
        teacherDAO = new TeacherDAO();
    }

    // =========================================================
    // CHECK SUPER ADMIN ACCESS
    // =========================================================

    private boolean isSuperAdmin(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Admin admin =
                (Admin) request.getSession().getAttribute("admin");

        if (admin == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/admin-login.jsp"
            );

            return false;
        }

        if (!"SUPER_ADMIN".equals(admin.getRole())) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Access Denied. Only Super Admin can manage teachers."
            );

            return false;
        }

        return true;
    }

    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        if (!isSuperAdmin(request, response)) {
            return;
        }

        String action = request.getParameter("action");

        if ("list".equals(action)) {

            listTeachers(request, response);

        } else if ("edit".equals(action)) {

            editTeacher(request, response);

        } else if ("delete".equals(action)) {

            deleteTeacher(request, response);

        } else if ("attendance".equals(action)) {

            openAttendance(request, response);

        } else {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid action"
            );
        }
    }

    // =========================================================
    // OPEN TEACHER ATTENDANCE
    // =========================================================

    private void openAttendance(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String idParameter =
                request.getParameter("id");

        if (idParameter == null
                || idParameter.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Teacher ID is required"
            );

            return;
        }

        int teacherId;

        try {

            teacherId =
                    Integer.parseInt(idParameter);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Teacher ID"
            );

            return;
        }

        // =====================================================
        // CHECK TEACHER
        // =====================================================

        Teacher teacher =
                teacherDAO.getTeacherById(teacherId);

        if (teacher == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Teacher not found"
            );

            return;
        }

        // =====================================================
        // REDIRECT TO ATTENDANCE SERVLET
        // =====================================================

        response.sendRedirect(
                request.getContextPath()
                + "/teacher-attendance?action=view"
                + "&teacherId=" + teacherId
        );
    }

    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        if (!isSuperAdmin(request, response)) {
            return;
        }

        String action =
                request.getParameter("action");

        if ("add".equals(action)) {

            addTeacher(request, response);

        } else if ("update".equals(action)) {

            updateTeacher(request, response);

        } else {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid action"
            );
        }
    }

    // =========================================================
    // ADD TEACHER
    // =========================================================

    private void addTeacher(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String name =
                request.getParameter("name");

        String subject =
                request.getParameter("subject");

        String qualification =
                request.getParameter("qualification");

        String mobile =
                request.getParameter("mobile");

        String email =
                request.getParameter("email");

        String address =
                request.getParameter("address");

        Teacher teacher =
                new Teacher();

        teacher.setName(name);
        teacher.setSubject(subject);
        teacher.setQualification(qualification);
        teacher.setMobile(mobile);
        teacher.setEmail(email);
        teacher.setAddress(address);

        boolean result =
                teacherDAO.addTeacher(teacher);

        if (result) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher?action=list&success=added"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher?action=list&error=add"
            );
        }
    }

    // =========================================================
    // LIST TEACHERS
    // =========================================================

    private void listTeachers(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "teachers",
                teacherDAO.getAllTeachers()
        );

        request.getRequestDispatcher(
                "/admin/teachers.jsp"
        ).forward(request, response);
    }

    // =========================================================
    // EDIT TEACHER
    // =========================================================

    private void editTeacher(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String idParameter =
                request.getParameter("id");

        if (idParameter == null
                || idParameter.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Teacher ID is required"
            );

            return;
        }

        int id;

        try {

            id =
                    Integer.parseInt(idParameter);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Teacher ID"
            );

            return;
        }

        Teacher teacher =
                teacherDAO.getTeacherById(id);

        if (teacher == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Teacher not found"
            );

            return;
        }

        request.setAttribute(
                "teacher",
                teacher
        );

        request.getRequestDispatcher(
                "/admin/edit-teacher.jsp"
        ).forward(request, response);
    }

    // =========================================================
    // UPDATE TEACHER
    // =========================================================

    private void updateTeacher(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String idParameter =
                request.getParameter("id");

        if (idParameter == null
                || idParameter.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Teacher ID is required"
            );

            return;
        }

        int id;

        try {

            id =
                    Integer.parseInt(idParameter);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Teacher ID"
            );

            return;
        }

        String name =
                request.getParameter("name");

        String subject =
                request.getParameter("subject");

        String qualification =
                request.getParameter("qualification");

        String mobile =
                request.getParameter("mobile");

        String email =
                request.getParameter("email");

        String address =
                request.getParameter("address");

        Teacher teacher =
                new Teacher();

        teacher.setId(id);
        teacher.setName(name);
        teacher.setSubject(subject);
        teacher.setQualification(qualification);
        teacher.setMobile(mobile);
        teacher.setEmail(email);
        teacher.setAddress(address);

        boolean result =
                teacherDAO.updateTeacher(teacher);

        if (result) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher?action=list"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher?action=list&error=update"
            );
        }
    }

    // =========================================================
    // DELETE TEACHER
    // =========================================================

    private void deleteTeacher(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String idParameter =
                request.getParameter("id");

        if (idParameter == null
                || idParameter.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Teacher ID is required"
            );

            return;
        }

        int id;

        try {

            id =
                    Integer.parseInt(idParameter);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Teacher ID"
            );

            return;
        }

        boolean result =
                teacherDAO.deleteTeacher(id);

        if (result) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher?action=list"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher?action=list&error=delete"
            );
        }
    }
}