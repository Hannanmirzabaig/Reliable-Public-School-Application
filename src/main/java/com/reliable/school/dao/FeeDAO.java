package com.reliable.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.reliable.school.model.Fee;
import com.reliable.school.util.DBUtil;

public class FeeDAO {

    // ADD FEE
    public boolean addFee(Fee fee) {

        String sql = "INSERT INTO fees (student_id, amount, status,student_name,father_name,class_name) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, fee.getStudentId());
            ps.setDouble(2, fee.getAmount());
            ps.setString(3, fee.getStatus());
            ps.setString(4,fee.getStudentName());
            ps.setString(5, fee.getFatherName());
            ps.setString(6, fee.getClassName());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // GET ALL FEES
    public List<Fee> getAllFees() {

        List<Fee> fees = new ArrayList<>();

        String sql = "SELECT * FROM fees ORDER BY id DESC";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Fee fee = new Fee();

                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setStudentName(rs.getString("student_name"));
                fee.setFatherName(rs.getString("father_name"));
                fee.setClassName(rs.getString("class_name"));
                fee.setAmount(rs.getDouble("amount"));
                fee.setPaymentDate(rs.getDate("payment_date"));
                fee.setStatus(rs.getString("status"));

                fees.add(fee);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return fees;
    }


    // GET FEE BY ID
    public Fee getFeeById(int id) {

        String sql = "SELECT * FROM fees WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Fee fee = new Fee();

                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setStudentName(rs.getString("student_name"));
                fee.setFatherName(rs.getString("father_name"));
                fee.setClassName(rs.getString("class_name"));
                fee.setAmount(rs.getDouble("amount"));
                fee.setPaymentDate(rs.getDate("payment_date"));
                fee.setStatus(rs.getString("status"));

                return fee;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // UPDATE FEE
    public boolean updateFee(Fee fee) {

        String sql = "UPDATE fees SET student_id=?, student_name=?, father_name=? , class_name=?, amount=?, status=? WHERE id=?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, fee.getStudentId());
            ps.setString(2, fee.getStudentName());
            ps.setString(3, fee.getFatherName());
            ps.setString(4, fee.getClassName());
            ps.setDouble(5, fee.getAmount());
            ps.setString(6, fee.getStatus());
            ps.setInt(7, fee.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // DELETE FEE
    public boolean deleteFee(int id) {

        String sql = "DELETE FROM fees WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}