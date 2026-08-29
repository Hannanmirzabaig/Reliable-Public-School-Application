package com.reliable.school.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.reliable.school.dao.StudentFeesDAO;
import com.reliable.school.model.Fee;

@WebServlet("/student-fees")
public class StudentFeesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private StudentFeesDAO feesDAO;

    @Override
    public void init() {
        feesDAO = new StudentFeesDAO();
    }

    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String idParam = request.getParameter("id");

        // IMPORTANT:
        // className is passed from student-details.jsp
        String className = request.getParameter("className");

        // -----------------------------------------------------
        // VIEW FEES
        // -----------------------------------------------------

        if ("view".equals(action)) {

            if (idParam == null || idParam.trim().isEmpty()) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin/student-classes.jsp"
                );

                return;
            }

            try {

                int studentId = Integer.parseInt(idParam);

                List<Fee> fees =
                    feesDAO.getFeesByStudentId(studentId);

                request.setAttribute("fees", fees);
                request.setAttribute("studentId", studentId);

                // Preserve selected class
                request.setAttribute("className", className);

                request.getRequestDispatcher(
                    "/admin/student-fees.jsp"
                ).forward(request, response);

            } catch (NumberFormatException e) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin/student-classes.jsp"
                );
            }

            return;
        }

        // -----------------------------------------------------
        // ADD FEE PAGE
        // -----------------------------------------------------

        if ("add".equals(action)) {

            if (idParam == null || idParam.trim().isEmpty()) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin/student-classes.jsp"
                );

                return;
            }

            try {

                int studentId = Integer.parseInt(idParam);

                request.setAttribute(
                    "studentId",
                    studentId
                );

                // Preserve selected class
                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/add-fees.jsp"
                ).forward(request, response);

            } catch (NumberFormatException e) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin/student-classes.jsp"
                );
            }

            return;
        }

        // -----------------------------------------------------
        // EDIT FEE PAGE
        // -----------------------------------------------------

        if ("edit".equals(action)) {

            if (idParam == null || idParam.trim().isEmpty()) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin/student-classes.jsp"
                );

                return;
            }

            try {

                int feeId = Integer.parseInt(idParam);

                Fee fee = feesDAO.getFeeById(feeId);

                if (fee == null) {

                    response.sendRedirect(
                        request.getContextPath()
                        + "/admin/student-classes.jsp"
                    );

                    return;
                }

                request.setAttribute("fee", fee);

                request.setAttribute(
                    "studentId",
                    fee.getStudentId()
                );

                // Preserve selected class
                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/edit-fees.jsp"
                ).forward(request, response);

            } catch (NumberFormatException e) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin/student-classes.jsp"
                );
            }

            return;
        }

        // -----------------------------------------------------
        // DEFAULT
        // -----------------------------------------------------

        response.sendRedirect(
            request.getContextPath()
            + "/admin/student-classes.jsp"
        );
    }

    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            addFee(request, response);

            return;
        }

        if ("update".equals(action)) {

            updateFee(request, response);

            return;
        }

        response.sendRedirect(
            request.getContextPath()
            + "/admin/student-classes.jsp"
        );
    }

    // =========================================================
    // ADD FEE METHOD
    // =========================================================

    private void addFee(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String studentIdParam =
            request.getParameter("studentId");

        String amountParam =
            request.getParameter("amount");

        String status =
            request.getParameter("status");

        String reason =
            request.getParameter("reason");

        String className =
            request.getParameter("className");

        try {

            if (studentIdParam == null ||
                amountParam == null ||
                status == null ||
                studentIdParam.trim().isEmpty() ||
                amountParam.trim().isEmpty() ||
                status.trim().isEmpty()) {

                request.setAttribute(
                    "error",
                    "Please fill all required fields."
                );

                request.setAttribute(
                    "studentId",
                    studentIdParam
                );

                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/add-fees.jsp"
                ).forward(request, response);

                return;
            }

            int studentId =
                Integer.parseInt(studentIdParam);

            double amount =
                Double.parseDouble(amountParam);

            if (amount <= 0) {

                request.setAttribute(
                    "error",
                    "Amount must be greater than 0."
                );

                request.setAttribute(
                    "studentId",
                    studentId
                );

                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/add-fees.jsp"
                ).forward(request, response);

                return;
            }

            // Reason required only for Pending

            if ("Pending".equalsIgnoreCase(status)
                    && (reason == null
                    || reason.trim().isEmpty())) {

                request.setAttribute(
                    "error",
                    "Please enter reason for pending fee."
                );

                request.setAttribute(
                    "studentId",
                    studentId
                );

                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/add-fees.jsp"
                ).forward(request, response);

                return;
            }

            boolean success =
                feesDAO.addFee(
                    studentId,
                    amount,
                    status,
                    reason
                );

            if (success) {

                String encodedClassName =
                    URLEncoder.encode(
                        className == null ? "" : className,
                        StandardCharsets.UTF_8
                    );

                response.sendRedirect(
                    request.getContextPath()
                    + "/student-fees?action=view&id="
                    + studentId
                    + "&className="
                    + encodedClassName
                );

            } else {

                request.setAttribute(
                    "error",
                    "Unable to add fee."
                );

                request.setAttribute(
                    "studentId",
                    studentId
                );

                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/add-fees.jsp"
                ).forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute(
                "error",
                "Please enter a valid amount."
            );

            request.setAttribute(
                "studentId",
                studentIdParam
            );

            request.setAttribute(
                "className",
                className
            );

            request.getRequestDispatcher(
                "/admin/add-fees.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                "error",
                "Something went wrong while adding fee."
            );

            request.setAttribute(
                "studentId",
                studentIdParam
            );

            request.setAttribute(
                "className",
                className
            );

            request.getRequestDispatcher(
                "/admin/add-fees.jsp"
            ).forward(request, response);
        }
    }

    // =========================================================
    // UPDATE FEE METHOD
    // =========================================================

    private void updateFee(HttpServletRequest request,
                            HttpServletResponse response)
            throws ServletException, IOException {

        String feeIdParam =
            request.getParameter("feeId");

        String studentIdParam =
            request.getParameter("studentId");

        String amountParam =
            request.getParameter("amount");

        String status =
            request.getParameter("status");

        String reason =
            request.getParameter("reason");

        String className =
            request.getParameter("className");

        try {

            int feeId =
                Integer.parseInt(feeIdParam);

            int studentId =
                Integer.parseInt(studentIdParam);

            double amount =
                Double.parseDouble(amountParam);

            if (amount <= 0) {

                request.setAttribute(
                    "error",
                    "Amount must be greater than 0."
                );

                Fee fee =
                    feesDAO.getFeeById(feeId);

                request.setAttribute(
                    "fee",
                    fee
                );

                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/edit-fees.jsp"
                ).forward(request, response);

                return;
            }

            // Reason required when status is Pending

            if ("Pending".equalsIgnoreCase(status)
                    && (reason == null
                    || reason.trim().isEmpty())) {

                request.setAttribute(
                    "error",
                    "Please enter reason for pending fee."
                );

                Fee fee =
                    feesDAO.getFeeById(feeId);

                request.setAttribute(
                    "fee",
                    fee
                );

                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/edit-fees.jsp"
                ).forward(request, response);

                return;
            }

            boolean success =
                feesDAO.updateFee(
                    feeId,
                    amount,
                    status,
                    reason
                );

            if (success) {

                String encodedClassName =
                    URLEncoder.encode(
                        className == null ? "" : className,
                        StandardCharsets.UTF_8
                    );

                response.sendRedirect(
                    request.getContextPath()
                    + "/student-fees?action=view&id="
                    + studentId
                    + "&className="
                    + encodedClassName
                );

            } else {

                request.setAttribute(
                    "error",
                    "Unable to update fee."
                );

                Fee fee =
                    feesDAO.getFeeById(feeId);

                request.setAttribute(
                    "fee",
                    fee
                );

                request.setAttribute(
                    "className",
                    className
                );

                request.getRequestDispatcher(
                    "/admin/edit-fees.jsp"
                ).forward(request, response);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                "error",
                "Invalid fee information."
            );

            request.setAttribute(
                "className",
                className
            );

            request.getRequestDispatcher(
                "/admin/student-fees.jsp"
            ).forward(request, response);
        }
    }
}

