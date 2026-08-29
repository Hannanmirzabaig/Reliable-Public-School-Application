package com.reliable.school.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req =
                (HttpServletRequest) request;

        HttpServletResponse res =
                (HttpServletResponse) response;

        String action = req.getParameter("action");

        /*
         * LOGIN request ko filter se allow karo.
         */
        if ("login".equals(action)) {

            chain.doFilter(request, response);
            return;
        }

        /*
         * RESET PASSWORD request ko login ke bina allow karo.
         */
        if ("resetPassword".equals(action)) {

            chain.doFilter(request, response);
            return;
        }

        /*
         * Login page ko allow karo.
         */
        String uri = req.getRequestURI();

        String contextPath = req.getContextPath();

        if (uri.equals(
                contextPath + "/admin/admin-login.jsp")) {

            chain.doFilter(request, response);
            return;
        }

        /*
         * Check admin session.
         */
        HttpSession session = req.getSession(false);

        boolean loggedIn =
                session != null &&
                session.getAttribute("admin") != null;

        if (loggedIn) {

            chain.doFilter(request, response);

        } else {

            res.sendRedirect(
                contextPath + "/admin/admin-login.jsp"
            );
        }
    }
}
