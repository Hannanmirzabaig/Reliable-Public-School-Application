package com.reliable.school.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.reliable.school.dao.AdminDAO;
import com.reliable.school.model.Admin;

@WebServlet("/admin-management")
public class AdminManagementServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        adminDAO = new AdminDAO();
    }


    // =========================
    // GET REQUEST
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        if (!checkSuperAdmin(request, response)) {
            return;
        }

        String action = request.getParameter("action");


        // =========================
        // ACTIVATE ADMIN
        // =========================
        if ("activate".equals(action)) {

            int id = Integer.parseInt(
                request.getParameter("id")
            );

            adminDAO.activateAdmin(id);

            response.sendRedirect(
                request.getContextPath()
                + "/admin-management"
            );
        }


        // =========================
        // DEACTIVATE ADMIN
        // =========================
        else if ("deactivate".equals(action)) {

            int id = Integer.parseInt(
                request.getParameter("id")
            );

            Admin currentAdmin =
                (Admin) request.getSession(false)
                              .getAttribute("admin");


            // Cannot deactivate yourself
            if (currentAdmin.getId() == id) {

                response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "You cannot deactivate your own account."
                );

                return;
            }


            // Last Super Admin protection
            if (adminDAO.isSuperAdmin(id)) {

                int activeSuperAdmins =
                    adminDAO.getActiveSuperAdminCount();

                if (activeSuperAdmins <= 1) {

                    response.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "At least one active Super Admin must remain."
                    );

                    return;
                }
            }

            adminDAO.deactivateAdmin(id);

            response.sendRedirect(
                request.getContextPath()
                + "/admin-management"
            );
        }


        // =========================
        // DELETE ADMIN
        // =========================
        else if ("delete".equals(action)) {

            int id = Integer.parseInt(
                request.getParameter("id")
            );

            Admin currentAdmin =
                (Admin) request.getSession(false)
                              .getAttribute("admin");


            // Cannot delete yourself
            if (currentAdmin.getId() == id) {

                response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "You cannot delete your own account."
                );

                return;
            }


            // Last Super Admin protection
            if (adminDAO.isSuperAdmin(id)) {

                int activeSuperAdmins =
                    adminDAO.getActiveSuperAdminCount();

                if (activeSuperAdmins <= 1) {

                    response.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "At least one active Super Admin must remain."
                    );

                    return;
                }
            }

            adminDAO.deleteAdmin(id);

            response.sendRedirect(
                request.getContextPath()
                + "/admin-management"
            );
        }


        // =========================
        // SHOW ADMIN MANAGEMENT
        // =========================
        else {

            showAdmins(request, response);
        }
    }


    // =========================
    // POST REQUEST
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        if (!checkSuperAdmin(request, response)) {
            return;
        }

        String action = request.getParameter("action");


        // =========================
        // CREATE ADMIN
        // =========================
        if ("create".equals(action)) {

            String username =
                request.getParameter("username");

            String email =
                request.getParameter("email");

            String password =
                request.getParameter("password");

            String role =
                request.getParameter("role");


            // Remove spaces
            if (username != null) {
                username = username.trim();
            }

            if (email != null) {
                email = email.trim().toLowerCase();
            }


            // =========================
            // USERNAME VALIDATION
            // =========================
            if (username == null || username.isEmpty()) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Username is required."
                );

                return;
            }


            // =========================
            // EMAIL VALIDATION
            // =========================
            if (email == null || email.isEmpty()
                    || !email.matches(
                        "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"
                    )) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Valid email is required."
                );

                return;
            }


            // =========================
            // PASSWORD VALIDATION
            // =========================
            if (password == null || password.length() < 8) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Password must be at least 8 characters."
                );

                return;
            }


            // =========================
            // ROLE VALIDATION
            // =========================
            if (!"ADMIN".equals(role)
                    && !"SUPER_ADMIN".equals(role)) {

                response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid role."
                );

                return;
            }


            // =========================
            // DUPLICATE USERNAME
            // =========================
            if (adminDAO.usernameExists(username)) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin-management?error=usernameExists"
                );

                return;
            }


            // =========================
            // DUPLICATE EMAIL
            // =========================
            if (adminDAO.emailExists(email)) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin-management?error=emailExists"
                );

                return;
            }


            // =========================
            // CREATE ADMIN
            // =========================
            boolean created =
                adminDAO.createAdmin(
                    username,
                    email,
                    password,
                    role
                );


            if (created) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/admin-management"
                );

            } else {

                response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to create admin."
                );
            }

        } else {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid Action"
            );
        }
    }


    // =========================
    // SHOW ALL ADMINS
    // =========================
    private void showAdmins(HttpServletRequest request,
                            HttpServletResponse response)
            throws ServletException, IOException {

        List<Admin> admins =
            adminDAO.getAllAdmins();

        request.setAttribute(
            "admins",
            admins
        );

        request.getRequestDispatcher(
            "/admin/manage-admin.jsp"
        ).forward(request, response);
    }


    // =========================
    // SUPER ADMIN SECURITY CHECK
    // =========================
    private boolean checkSuperAdmin(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session =
            request.getSession(false);


        // No session
        if (session == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/admin-login.jsp"
            );

            return false;
        }


        Admin admin =
            (Admin) session.getAttribute("admin");


        // No logged-in admin
        if (admin == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/admin-login.jsp"
            );

            return false;
        }


        // Only SUPER_ADMIN allowed
        if (!"SUPER_ADMIN".equals(admin.getRole())) {

            response.sendError(
                HttpServletResponse.SC_FORBIDDEN,
                "Access Denied"
            );

            return false;
        }

        return true;
    }
}