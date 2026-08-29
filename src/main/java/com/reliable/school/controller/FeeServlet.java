package com.reliable.school.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.reliable.school.dao.FeeDAO;
import com.reliable.school.model.Fee;

@WebServlet("/fee")
public class FeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FeeDAO feeDAO;

    @Override
    public void init() throws ServletException {
        feeDAO = new FeeDAO();
    }

    // GET
    // LIST, EDIT, DELETE

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("list".equals(action)) {

            listFees(request, response);

        } else if ("edit".equals(action)) {

            editFee(request, response);

        } else if ("delete".equals(action)) {

            deleteFee(request, response);

        } else {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid action"
            );
        }
    }


    // POST
    // ADD, UPDATE

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            addFee(request, response);

        } else if ("update".equals(action)) {

            updateFee(request, response);

        } else {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid action"
            );
        }
    }


    // ADD FEE

    private void addFee(HttpServletRequest request,
                        HttpServletResponse response)
            throws IOException {

        int studentId = Integer.parseInt(
            request.getParameter("studentId")
        );
        String StudentName=request.getParameter("student_name");
        
        String FatherName=request.getParameter("father_name");
        
        String ClassName=request.getParameter("class_name");

        double amount = Double.parseDouble(
            request.getParameter("amount")
        );

        String status = request.getParameter("status");

        Fee fee = new Fee();

        fee.setStudentId(studentId);
        fee.setStudentName(StudentName);
        fee.setFatherName(FatherName);
        fee.setClassName(ClassName);
        fee.setAmount(amount);
        fee.setStatus(status);

        boolean result = feeDAO.addFee(fee);

        if (result) {

            response.sendRedirect(
                request.getContextPath()
                + "/fee?action=list&success=added"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/fee?action=list&error=add"
            );
        }
    }


    // LIST FEES

    private void listFees(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Fee> fees = feeDAO.getAllFees();

        request.setAttribute("fees", fees);

        request.getRequestDispatcher(
            "/admin/fees.jsp"
        ).forward(request, response);
    }


    // EDIT FEE

    private void editFee(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParameter = request.getParameter("id");

        if (idParameter == null || idParameter.isEmpty()) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Fee ID is required"
            );

            return;
        }

        int id = Integer.parseInt(idParameter);

        Fee fee = feeDAO.getFeeById(id);

        if (fee == null) {

            response.sendError(
                HttpServletResponse.SC_NOT_FOUND,
                "Fee not found"
            );

            return;
        }

        request.setAttribute("fee", fee);

        request.getRequestDispatcher(
            "/admin/edit-fee.jsp"
        ).forward(request, response);
    }


    // UPDATE FEE

    private void updateFee(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
            request.getParameter("id")
        );

        int studentId = Integer.parseInt(
            request.getParameter("studentId")
        );
       
  String StudentName=request.getParameter("student_name");
        
        String FatherName=request.getParameter("father_name");
        
        String ClassName=request.getParameter("class_name");


        double amount = Double.parseDouble(
            request.getParameter("amount")
        );

        String status = request.getParameter("status");

        Fee fee = new Fee();

        fee.setId(id);
        fee.setStudentId(studentId);
        fee.setStudentName(StudentName);
        fee.setFatherName(FatherName);
        fee.setClassName(ClassName);
        fee.setAmount(amount);
        fee.setStatus(status);

        boolean result = feeDAO.updateFee(fee);

        if (result) {

            response.sendRedirect(
                request.getContextPath()
                + "/fee?action=list&success=updated"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/fee?action=list&error=update"
            );
        }
    }


    // DELETE FEE

    private void deleteFee(HttpServletRequest request,
                            HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
            request.getParameter("id")
        );

        boolean result = feeDAO.deleteFee(id);

        if (result) {

            response.sendRedirect(
                request.getContextPath()
                + "/fee?action=list&success=deleted"
            );

        } else {

            response.sendRedirect(
                request.getContextPath()
                + "/fee?action=list&error=delete"
            );
        }
    }
}