package com.reliable.school.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.reliable.school.dao.NoticeDAO;
import com.reliable.school.model.Notice;

@WebServlet("/notice")
public class NoticeServlet extends HttpServlet {

    private NoticeDAO noticeDAO;

    @Override
    public void init() {

        noticeDAO = new NoticeDAO();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {

            action = "list";

        }

        switch (action) {

        case "delete":

            deleteNotice(request, response);

            break;

        case "edit":

            showEditForm(request, response);

            break;

        case "public":

            publicNotices(request, response);

            break;

        case "list":

        default:

            listNotices(request, response);

            break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            addNotice(request, response);

        } else if ("update".equals(action)) {

            updateNotice(request, response);

        } else {

            response.sendRedirect("notice?action=list");

        }

    }


    // ADD
    private void addNotice(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String title = request.getParameter("title");

        String description = request.getParameter("description");

        String noticeDate = request.getParameter("noticeDate");

        Notice notice = new Notice(title, description, noticeDate);

        noticeDAO.addNotice(notice);

        response.sendRedirect("notice?action=list");

    }


    // LIST
    private void listNotices(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Notice> notices = noticeDAO.getAllNotices();

        request.setAttribute("notices", notices);

        request.getRequestDispatcher("/admin/notice.jsp")
               .forward(request, response);

    }


    // EDIT FORM
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Notice notice = noticeDAO.getNoticeById(id);

        request.setAttribute("notice", notice);

        request.getRequestDispatcher("/admin/edit-notice.jsp")
               .forward(request, response);

    }


    // UPDATE
    private void updateNotice(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String title = request.getParameter("title");

        String description = request.getParameter("description");

        String noticeDate = request.getParameter("noticeDate");

        Notice notice = new Notice(id, title, description, noticeDate);

        noticeDAO.updateNotice(notice);

        response.sendRedirect("notice?action=list");

    }


    // DELETE
    private void deleteNotice(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        noticeDAO.deleteNotice(id);

        response.sendRedirect("notice?action=list");

    }
    
 // PUBLIC NOTICES

    private void publicNotices(HttpServletRequest request,
                               HttpServletResponse response)
            throws ServletException, IOException {

        List<Notice> notices = noticeDAO.getAllNotices();

        request.setAttribute("notices", notices);

        request.getRequestDispatcher("/notices.jsp")
               .forward(request, response);
    }

}