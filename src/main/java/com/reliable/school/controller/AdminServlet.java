package com.reliable.school.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.reliable.school.dao.AdminDAO;
import com.reliable.school.model.Admin;
import com.reliable.school.service.EmailService;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================
    // POST
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("login".equals(action)) {

            login(request, response);

        } else if ("changePassword".equals(action)) {

            changePassword(request, response);

        } else if ("forgotPassword".equals(action)) {

            forgotPassword(request, response);

        } else if ("resetPassword".equals(action)) {

            resetPassword(request, response);

        } else {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid Action"
            );
        }
    }


    // =========================
    // GET
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("logout".equals(action)) {

            logout(request, response);

        } else if ("resetPassword".equals(action)) {

            showResetPassword(request, response);

        } else {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid Action"
            );
        }
    }


    // =========================
    // LOGIN
    // =========================
    private void login(HttpServletRequest request,
                       HttpServletResponse response)
            throws IOException {

        String username =
            request.getParameter("username");

        String password =
            request.getParameter("password");

        AdminDAO adminDAO = new AdminDAO();

        Admin admin =
            adminDAO.login(username, password);

        if (admin != null) {

            HttpSession session =
                request.getSession();

            session.setAttribute("admin", admin);

            response.sendRedirect(
                request.getContextPath()
                + "/admin/dashboard.jsp"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/admin-login.jsp?error=invalid"
            );
        }
    }


    // =========================
    // FORGOT PASSWORD
    // =========================
    private void forgotPassword(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String email =
            request.getParameter("email");

        if (email == null || email.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/forgot-password.jsp?error=invalid"
            );

            return;
        }

        email = email.trim().toLowerCase();

        AdminDAO adminDAO =
            new AdminDAO();

        Admin admin =
        	    adminDAO.getAdminByEmail(email);


        // =========================
        // EMAIL NOT FOUND
        // =========================
        if (admin == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/forgot-password.jsp?error=notfound"
            );

            return;
        }


        // =========================
        // GENERATE RESET TOKEN
        // =========================
        String token =
            UUID.randomUUID().toString();


        // Token valid for 15 minutes
        long expiryTime =
            System.currentTimeMillis()
            + (15 * 60 * 1000);

        Timestamp expiry =
            new Timestamp(expiryTime);


        boolean saved =
            adminDAO.saveResetToken(
                admin.getId(),
                token,
                expiry
            );


        if (!saved) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/forgot-password.jsp?error=failed"
            );

            return;
        }


        // =========================
        // CREATE RESET LINK
        // =========================
        String resetLink =
            request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/admin?action=resetPassword&token="
            + token;


        // =========================
        // SEND EMAIL
        // =========================
        boolean emailSent =
            EmailService.sendPasswordResetEmail(
                email,
                resetLink
            );


        if (emailSent) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/forgot-password.jsp?success=sent"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/forgot-password.jsp?error=email"
            );
        }
    }


    // =========================
    // SHOW RESET PASSWORD PAGE
    // =========================
    private void showResetPassword(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String token =
            request.getParameter("token");

        if (token == null || token.trim().isEmpty()) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid reset token."
            );

            return;
        }


        AdminDAO adminDAO =
            new AdminDAO();

        Admin admin =
        	    adminDAO.getAdminByResetToken(token);


        if (admin == null) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Reset link is invalid or expired."
            );

            return;
        }


        request.setAttribute(
            "token",
            token
        );


        request.getRequestDispatcher(
            "/admin/reset-password.jsp"
        ).forward(request, response);
    }


    // =========================
    // RESET PASSWORD
    // =========================
    private void resetPassword(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String token =
            request.getParameter("token");

        String newPassword =
            request.getParameter("newPassword");

        String confirmPassword =
            request.getParameter("confirmPassword");


        // =========================
        // BASIC VALIDATION
        // =========================
        if (token == null ||
            token.trim().isEmpty()) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid reset token."
            );

            return;
        }


        if (newPassword == null ||
            newPassword.length() < 8) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin?action=resetPassword&token="
                + token
                + "&error=short"
            );

            return;
        }


        if (!newPassword.equals(confirmPassword)) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin?action=resetPassword&token="
                + token
                + "&error=mismatch"
            );

            return;
        }


        // =========================
        // FIND ADMIN BY TOKEN
        // =========================
        AdminDAO adminDAO =
            new AdminDAO();

        Admin admin =
        	    adminDAO.getAdminByResetToken(token);


        if (admin == null) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Reset link is invalid or expired."
            );

            return;
        }


        // =========================
        // UPDATE PASSWORD
        // =========================
        boolean updated =
            adminDAO.updatePassword(
                admin.getId(),
                newPassword
            );


        if (!updated) {

            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "Unable to reset password."
            );

            return;
        }


        // =========================
        // CLEAR TOKEN
        // =========================
        adminDAO.clearResetToken(
            admin.getId()
        );


        // =========================
        // SUCCESS
        // =========================
        response.sendRedirect(
            request.getContextPath()
            + "/admin/admin-login.jsp?passwordReset=true"
        );
    }


    // =========================
    // CHANGE PASSWORD
    // =========================
    private void changePassword(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session =
            request.getSession(false);


        // Check login session
        if (session == null ||
            session.getAttribute("admin") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/admin-login.jsp"
            );

            return;
        }


        Admin admin =
            (Admin) session.getAttribute("admin");


        String currentPassword =
            request.getParameter("currentPassword");

        String newPassword =
            request.getParameter("newPassword");

        String confirmPassword =
            request.getParameter("confirmPassword");


        // Check new password match
        if (newPassword == null ||
            !newPassword.equals(confirmPassword)) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/change-password.jsp?error=mismatch"
            );

            return;
        }


        // Get current password from database
        AdminDAO adminDAO =
            new AdminDAO();

        Admin dbAdmin =
            adminDAO.login(
                admin.getUsername(),
                currentPassword
            );


        // Current password incorrect
        if (dbAdmin == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/change-password.jsp?error=wrong"
            );

            return;
        }


        // Update new password
        boolean updated =
            adminDAO.updatePassword(
                admin.getId(),
                newPassword
            );


        if (updated) {

            session.invalidate();

            response.sendRedirect(
                request.getContextPath()
                + "/admin/admin-login.jsp?passwordChanged=true"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/change-password.jsp?error=failed"
            );
        }
    }


    // =========================
    // LOGOUT
    // =========================
    private void logout(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session =
            request.getSession(false);


        if (session != null) {

            session.invalidate();
        }


        response.sendRedirect(
            request.getContextPath()
            + "/admin/admin-login.jsp"
        );
    }
}