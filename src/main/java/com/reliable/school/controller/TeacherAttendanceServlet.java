package com.reliable.school.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.reliable.school.dao.TeacherAttendanceDAO;
import com.reliable.school.dao.TeacherDAO;
import com.reliable.school.model.Teacher;
import com.reliable.school.model.TeacherAttendance;

@WebServlet("/teacher-attendance")
public class TeacherAttendanceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TeacherAttendanceDAO attendanceDAO;
    private TeacherDAO teacherDAO;

    // =========================================================
    // INIT
    // =========================================================

    @Override
    public void init() throws ServletException {

        attendanceDAO = new TeacherAttendanceDAO();
        teacherDAO = new TeacherDAO();
    }

    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("attendance".equals(action)
                || "view".equals(action)
                || action == null
                || action.trim().isEmpty()) {

            viewAttendance(request, response);

        } else {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid action"
            );
        }
    }

    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("mark".equals(action)) {

            addAttendance(request, response);

        } else {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid action"
            );
        }
    }

    // =========================================================
    // ADD / MARK ATTENDANCE
    // =========================================================

    private void addAttendance(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String teacherIdParameter =
                request.getParameter("teacherId");

        String attendanceDateParameter =
                request.getParameter("attendanceDate");

        String status =
                request.getParameter("status");

        // =====================================================
        // VALIDATION
        // =====================================================

        if (teacherIdParameter == null
                || attendanceDateParameter == null
                || status == null
                || teacherIdParameter.trim().isEmpty()
                || attendanceDateParameter.trim().isEmpty()
                || status.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher-attendance?action=view"
                    + "&error=invalid"
            );

            return;
        }

        try {

            int teacherId =
                    Integer.parseInt(
                            teacherIdParameter
                    );

            Date attendanceDate =
                    Date.valueOf(
                            attendanceDateParameter
                    );

            // =================================================
            // CHECK TEACHER
            // =================================================

            Teacher teacher =
                    teacherDAO.getTeacherById(
                            teacherId
                    );

            if (teacher == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Teacher not found"
                );

                return;
            }

            // =================================================
            // VALIDATE STATUS
            // =================================================

            if (!"Present".equals(status)
                    && !"Absent".equals(status)
                    && !"Half Day".equals(status)) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/teacher-attendance?action=view"
                        + "&teacherId="
                        + teacherId
                        + "&error=invalidStatus"
                );

                return;
            }

            // =================================================
            // PREVENT FUTURE DATE
            // =================================================

            LocalDate selectedDate =
                    attendanceDate.toLocalDate();

            LocalDate today =
                    LocalDate.now();

            if (selectedDate.isAfter(today)) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/teacher-attendance?action=view"
                        + "&teacherId="
                        + teacherId
                        + "&error=futureDate"
                );

                return;
            }

            // =================================================
            // DUPLICATE CHECK
            // =================================================

            boolean alreadyMarked =
                    attendanceDAO.isAttendanceAlreadyMarked(
                            teacherId,
                            attendanceDate
                    );

            if (alreadyMarked) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/teacher-attendance?action=view"
                        + "&teacherId="
                        + teacherId
                        + "&error=already"
                );

                return;
            }

            // =================================================
            // CREATE ATTENDANCE
            // =================================================

            TeacherAttendance attendance =
                    new TeacherAttendance();

            attendance.setTeacherId(
                    teacherId
            );

            attendance.setAttendanceDate(
                    attendanceDate
            );

            attendance.setStatus(
                    status
            );

            // =================================================
            // SAVE
            // =================================================

            boolean result =
                    attendanceDAO.addAttendance(
                            attendance
                    );

            if (result) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/teacher-attendance?action=view"
                        + "&teacherId="
                        + teacherId
                        + "&success=marked"
                );

            } else {

                response.sendRedirect(
                        request.getContextPath()
                        + "/teacher-attendance?action=view"
                        + "&teacherId="
                        + teacherId
                        + "&error=failed"
                );
            }

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Teacher ID"
            );

        } catch (IllegalArgumentException e) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/teacher-attendance?action=view"
                    + "&error=invalidDate"
            );
        }
    }

    // =========================================================
    // VIEW ATTENDANCE
    // =========================================================

    private void viewAttendance(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // =====================================================
        // GET ALL TEACHERS
        // =====================================================
        // Ye sabse important change hai.
        // Dropdown ke liye saare teachers JSP ko bhej rahe hain.

        request.setAttribute(
                "teachers",
                teacherDAO.getAllTeachers()
        );

        // =====================================================
        // GET TEACHER ID
        // =====================================================

        String teacherIdParameter =
                request.getParameter("teacherId");

        /*
         * teacherId ab mandatory nahi hai.
         *
         * Agar teacherId nahi hai:
         * page normally open hoga aur dropdown mein
         * saare teachers dikhenge.
         */

        if (teacherIdParameter == null
                || teacherIdParameter.trim().isEmpty()) {

            request.getRequestDispatcher(
                    "/admin/attendance.jsp"
            ).forward(
                    request,
                    response
            );

            return;
        }

        try {

            int teacherId =
                    Integer.parseInt(
                            teacherIdParameter
                    );

            // =================================================
            // GET SELECTED TEACHER
            // =================================================

            Teacher teacher =
                    teacherDAO.getTeacherById(
                            teacherId
                    );

            if (teacher == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Teacher not found"
                );

                return;
            }

            // =================================================
            // DATE RANGE
            // =================================================

            String fromDateParameter =
                    request.getParameter("fromDate");

            String toDateParameter =
                    request.getParameter("toDate");

            Date fromDate;
            Date toDate;

            if (fromDateParameter == null
                    || fromDateParameter.trim().isEmpty()
                    || toDateParameter == null
                    || toDateParameter.trim().isEmpty()) {

                LocalDate today =
                        LocalDate.now();

                LocalDate firstDay =
                        today.withDayOfMonth(1);

                LocalDate lastDay =
                        today.withDayOfMonth(
                                today.lengthOfMonth()
                        );

                fromDate =
                        Date.valueOf(firstDay);

                toDate =
                        Date.valueOf(lastDay);

            } else {

                fromDate =
                        Date.valueOf(
                                fromDateParameter
                        );

                toDate =
                        Date.valueOf(
                                toDateParameter
                        );
            }

            // =================================================
            // INVALID RANGE
            // =================================================

            if (fromDate.after(toDate)) {

                request.setAttribute(
                        "errorMessage",
                        "From date cannot be greater than To date."
                );

            } else {

                // =============================================
                // ATTENDANCE LIST
                // =============================================

                request.setAttribute(
                        "attendanceList",
                        attendanceDAO
                                .getAttendanceByTeacherAndDateRange(
                                        teacherId,
                                        fromDate,
                                        toDate
                                )
                );

                // =============================================
                // COUNTS
                // =============================================

                int presentCount =
                        attendanceDAO.getPresentCount(
                                teacherId,
                                fromDate,
                                toDate
                        );

                int absentCount =
                        attendanceDAO.getAbsentCount(
                                teacherId,
                                fromDate,
                                toDate
                        );

                int halfDayCount =
                        attendanceDAO.getHalfDayCount(
                                teacherId,
                                fromDate,
                                toDate
                        );

                int totalAttendance =
                        attendanceDAO.getTotalAttendance(
                                teacherId,
                                fromDate,
                                toDate
                        );

                request.setAttribute(
                        "presentCount",
                        presentCount
                );

                request.setAttribute(
                        "absentCount",
                        absentCount
                );

                request.setAttribute(
                        "halfDayCount",
                        halfDayCount
                );

                request.setAttribute(
                        "totalAttendance",
                        totalAttendance
                );
            }

            // =================================================
            // SEND SELECTED TEACHER TO JSP
            // =================================================

            request.setAttribute(
                    "teacher",
                    teacher
            );

            request.setAttribute(
                    "fromDate",
                    fromDate
            );

            request.setAttribute(
                    "toDate",
                    toDate
            );

            // =================================================
            // OPEN JSP
            // =================================================

            request.getRequestDispatcher(
                    "/admin/attendance.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid Teacher ID"
            );

        } catch (IllegalArgumentException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid date format"
            );
        }
    }
}