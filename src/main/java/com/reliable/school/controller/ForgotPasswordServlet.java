package com.reliable.school.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.reliable.school.dao.AdminDAO;
import com.reliable.school.model.Admin;
import com.reliable.school.service.EmailService;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("FORGOT PASSWORD SERVLET CALLED");

        String email = request.getParameter("email");

        // =========================
        // VALIDATE EMAIL
        // =========================

        if (email == null || email.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/forgot-password.jsp?error=invalid"
            );

            return;
        }

        email = email.trim().toLowerCase();

        // =========================
        // FIND ADMIN BY EMAIL
        // =========================

        Admin admin = adminDAO.getAdminByEmail(email);

        if (admin == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/forgot-password.jsp?error=notfound"
            );

            return;
        }

        // =========================
        // GENERATE RESET TOKEN
        // =========================

        String token = UUID.randomUUID().toString();

        // Token valid for 15 minutes
        long expiryTime =
                System.currentTimeMillis()
                + (15 * 60 * 1000);

        Timestamp expiry =
                new Timestamp(expiryTime);

        // =========================
        // SAVE TOKEN IN DATABASE
        // =========================

        boolean saved =
                adminDAO.saveResetToken(
                    admin.getId(),
                    token,
                    expiry
                );

        if (!saved) {

            response.sendRedirect(
                request.getContextPath()
                + "/forgot-password.jsp?error=failed"
            );

            return;
        }

        // =========================
        // CREATE PASSWORD RESET LINK
        // =========================
        //
        // AdminServlet already handles:
        //
        // @WebServlet("/admin")
        //
        // and:
        //
        // action=resetPassword
        //

        String resetLink =
                request.getScheme()
                + "://"
                + request.getServerName()
                + ":"
                + request.getServerPort()
                + request.getContextPath()
                + "/admin?action=resetPassword&token="
                + token;

        System.out.println("RESET LINK = " + resetLink);

        // =========================
        // SEND EMAIL
        // =========================

        boolean emailSent =
                EmailService.sendPasswordResetEmail(
                    admin.getEmail(),
                    resetLink
                );

        // =========================
        // EMAIL SENT
        // =========================

        if (emailSent) {

            response.sendRedirect(
                request.getContextPath()
                + "/forgot-password.jsp?success=sent"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/forgot-password.jsp?error=mail"
            );
        }
    }
}