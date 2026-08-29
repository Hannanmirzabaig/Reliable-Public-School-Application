package com.reliable.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.reliable.school.model.Teacher;
import com.reliable.school.util.DBUtil;

public class TeacherDAO {

    // ADD TEACHER

    public boolean addTeacher(Teacher teacher) {

        String sql = "INSERT INTO teachers "
                   + "(name, subject, qualification, mobile, email, address) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, teacher.getName());
            ps.setString(2, teacher.getSubject());
            ps.setString(3, teacher.getQualification());
            ps.setString(4, teacher.getMobile());
            ps.setString(5, teacher.getEmail());
            ps.setString(6, teacher.getAddress());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // GET ALL TEACHERS

    public List<Teacher> getAllTeachers() {

        List<Teacher> teachers = new ArrayList<>();

        String sql = "SELECT * FROM teachers ORDER BY id DESC";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Teacher teacher = new Teacher();

                teacher.setId(rs.getInt("id"));
                teacher.setName(rs.getString("name"));
                teacher.setSubject(rs.getString("subject"));
                teacher.setQualification(rs.getString("qualification"));
                teacher.setMobile(rs.getString("mobile"));
                teacher.setEmail(rs.getString("email"));
                teacher.setAddress(rs.getString("address"));

                teachers.add(teacher);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return teachers;
    }


    // GET TEACHER BY ID

    public Teacher getTeacherById(int id) {

        Teacher teacher = null;

        String sql = "SELECT * FROM teachers WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                teacher = new Teacher();

                teacher.setId(rs.getInt("id"));
                teacher.setName(rs.getString("name"));
                teacher.setSubject(rs.getString("subject"));
                teacher.setQualification(rs.getString("qualification"));
                teacher.setMobile(rs.getString("mobile"));
                teacher.setEmail(rs.getString("email"));
                teacher.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return teacher;
    }


    // UPDATE TEACHER

    public boolean updateTeacher(Teacher teacher) {

        String sql = "UPDATE teachers SET "
                   + "name = ?, subject = ?, qualification = ?, "
                   + "mobile = ?, email = ?, address = ? "
                   + "WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, teacher.getName());
            ps.setString(2, teacher.getSubject());
            ps.setString(3, teacher.getQualification());
            ps.setString(4, teacher.getMobile());
            ps.setString(5, teacher.getEmail());
            ps.setString(6, teacher.getAddress());
            ps.setInt(7, teacher.getId());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // DELETE TEACHER

    public boolean deleteTeacher(int id) {

        String sql = "DELETE FROM teachers WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}