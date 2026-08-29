package com.reliable.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.reliable.school.model.Fee;
import com.reliable.school.util.DBUtil;

public class StudentFeesDAO {
// =========================================================
// GET ALL FEES OF STUDENT
// =========================================================

public List<Fee> getFeesByStudentId(int studentId) {

    List<Fee> fees = new ArrayList<>();

    String sql = "SELECT id, student_id, amount, payment_date, status, "
               + "student_name, father_name, class_name, reason "
               + "FROM fees "
               + "WHERE student_id = ? "
               + "ORDER BY payment_date DESC, id DESC";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, studentId);

        try (ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Fee fee = new Fee();

                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setAmount(rs.getDouble("amount"));
                fee.setPaymentDate(rs.getDate("payment_date"));
                fee.setStatus(rs.getString("status"));
                fee.setStudentName(rs.getString("student_name"));
                fee.setFatherName(rs.getString("father_name"));
                fee.setClassName(rs.getString("class_name"));
                fee.setReason(rs.getString("reason"));

                fees.add(fee);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return fees;
}


// =========================================================
// GET ONE FEE BY FEE ID
// =========================================================

public Fee getFeeById(int feeId) {

    String sql = "SELECT id, student_id, amount, payment_date, status, "
               + "student_name, father_name, class_name, reason "
               + "FROM fees "
               + "WHERE id = ?";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, feeId);

        try (ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {

                Fee fee = new Fee();

                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setAmount(rs.getDouble("amount"));
                fee.setPaymentDate(rs.getDate("payment_date"));
                fee.setStatus(rs.getString("status"));
                fee.setStudentName(rs.getString("student_name"));
                fee.setFatherName(rs.getString("father_name"));
                fee.setClassName(rs.getString("class_name"));
                fee.setReason(rs.getString("reason"));

                return fee;
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}


// =========================================================
// ADD NEW FEE
// =========================================================

public boolean addFee(int studentId,
                      double amount,
                      String status,
                      String reason) {

    String sql = "INSERT INTO fees "
               + "(student_id, amount, status, reason, "
               + "student_name, father_name, class_name) "
               + "SELECT id, ?, ?, ?, name, father_name, class_name "
               + "FROM students "
               + "WHERE id = ?";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setDouble(1, amount);
        ps.setString(2, status);

        if (reason == null || reason.trim().isEmpty()) {
            ps.setNull(3, java.sql.Types.VARCHAR);
        } else {
            ps.setString(3, reason.trim());
        }

        ps.setInt(4, studentId);

        int rows = ps.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
}


// =========================================================
// UPDATE EXISTING FEE
// =========================================================

public boolean updateFee(int feeId,
                         double amount,
                         String status,
                         String reason) {

    String sql = "UPDATE fees "
               + "SET amount = ?, status = ?, reason = ? "
               + "WHERE id = ?";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setDouble(1, amount);
        ps.setString(2, status);

        if (reason == null || reason.trim().isEmpty()) {
            ps.setNull(3, java.sql.Types.VARCHAR);
        } else {
            ps.setString(3, reason.trim());
        }

        ps.setInt(4, feeId);

        int rows = ps.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
}

}
