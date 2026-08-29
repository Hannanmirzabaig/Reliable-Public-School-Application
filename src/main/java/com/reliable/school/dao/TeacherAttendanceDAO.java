package com.reliable.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.reliable.school.model.TeacherAttendance;
import com.reliable.school.util.DBUtil;

public class TeacherAttendanceDAO {

    // =========================================
    // ADD ATTENDANCE
    // =========================================

    public boolean addAttendance(TeacherAttendance attendance) {

        String sql = "INSERT INTO teacher_attendance "
                   + "(teacher_id, attendance_date, status) "
                   + "VALUES (?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, attendance.getTeacherId());
            ps.setDate(2, attendance.getAttendanceDate());
            ps.setString(3, attendance.getStatus());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // =========================================
    // CHECK DUPLICATE ATTENDANCE
    // =========================================

    public boolean isAttendanceAlreadyMarked(int teacherId, Date attendanceDate) {

        String sql = "SELECT id FROM teacher_attendance "
                   + "WHERE teacher_id = ? "
                   + "AND attendance_date = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, teacherId);
            ps.setDate(2, attendanceDate);

            try (ResultSet rs = ps.executeQuery()) {

                return rs.next();
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // =========================================
    // GET ATTENDANCE BY TEACHER AND DATE RANGE
    // =========================================

    public List<TeacherAttendance> getAttendanceByTeacherAndDateRange(
            int teacherId,
            Date fromDate,
            Date toDate) {

        List<TeacherAttendance> attendanceList = new ArrayList<>();

        String sql =
                "SELECT ta.id, ta.teacher_id, t.name, "
              + "ta.attendance_date, ta.status "
              + "FROM teacher_attendance ta "
              + "JOIN teachers t ON ta.teacher_id = t.id "
              + "WHERE ta.teacher_id = ? "
              + "AND ta.attendance_date BETWEEN ? AND ? "
              + "ORDER BY ta.attendance_date DESC";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, teacherId);
            ps.setDate(2, fromDate);
            ps.setDate(3, toDate);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    TeacherAttendance attendance =
                            new TeacherAttendance();

                    attendance.setId(
                            rs.getInt("id")
                    );

                    attendance.setTeacherId(
                            rs.getInt("teacher_id")
                    );

                    attendance.setTeacherName(
                            rs.getString("name")
                    );

                    attendance.setAttendanceDate(
                            rs.getDate("attendance_date")
                    );

                    attendance.setStatus(
                            rs.getString("status")
                    );

                    attendanceList.add(attendance);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return attendanceList;
    }


    // =========================================
    // GET PRESENT COUNT
    // =========================================

    public int getPresentCount(
            int teacherId,
            Date fromDate,
            Date toDate) {

        return getStatusCount(
                teacherId,
                fromDate,
                toDate,
                "Present"
        );
    }


    // =========================================
    // GET ABSENT COUNT
    // =========================================

    public int getAbsentCount(
            int teacherId,
            Date fromDate,
            Date toDate) {

        return getStatusCount(
                teacherId,
                fromDate,
                toDate,
                "Absent"
        );
    }


    // =========================================
    // GET HALF DAY COUNT
    // =========================================

    public int getHalfDayCount(
            int teacherId,
            Date fromDate,
            Date toDate) {

        return getStatusCount(
                teacherId,
                fromDate,
                toDate,
                "Half Day"
        );
    }


    // =========================================
    // COMMON STATUS COUNT METHOD
    // =========================================

    private int getStatusCount(
            int teacherId,
            Date fromDate,
            Date toDate,
            String status) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM teacher_attendance "
              + "WHERE teacher_id = ? "
              + "AND attendance_date BETWEEN ? AND ? "
              + "AND status = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, teacherId);
            ps.setDate(2, fromDate);
            ps.setDate(3, toDate);
            ps.setString(4, status);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }


    // =========================================
    // GET TOTAL ATTENDANCE
    // =========================================

    public int getTotalAttendance(
            int teacherId,
            Date fromDate,
            Date toDate) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM teacher_attendance "
              + "WHERE teacher_id = ? "
              + "AND attendance_date BETWEEN ? AND ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, teacherId);
            ps.setDate(2, fromDate);
            ps.setDate(3, toDate);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
}
