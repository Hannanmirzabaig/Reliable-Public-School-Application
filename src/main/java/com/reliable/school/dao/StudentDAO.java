package com.reliable.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.reliable.school.model.Student;
import com.reliable.school.util.DBUtil;

public class StudentDAO {

    // ADD STUDENT

    public boolean addStudent(Student student) {

        String sql = "INSERT INTO students " +
                     "(name, father_name, class_name, roll_number, mobile, address) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, student.getName());
            ps.setString(2, student.getFatherName());
            ps.setString(3, student.getClassName());
            ps.setString(4, student.getRollNumber());
            ps.setString(5, student.getMobile());
            ps.setString(6, student.getAddress());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // GET ALL STUDENTS

    public List<Student> getAllStudents() {

        List<Student> students = new ArrayList<>();

        String sql = "SELECT * FROM students ORDER BY id DESC";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Student student = new Student();

                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setFatherName(rs.getString("father_name"));
                student.setClassName(rs.getString("class_name"));
                student.setRollNumber(rs.getString("roll_number"));
                student.setMobile(rs.getString("mobile"));
                student.setAddress(rs.getString("address"));

                students.add(student);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return students;
    }


    // GET STUDENT BY ID

    public Student getStudentById(int id) {

        Student student = null;

        String sql = "SELECT * FROM students WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                student = new Student();

                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setFatherName(rs.getString("father_name"));
                student.setClassName(rs.getString("class_name"));
                student.setRollNumber(rs.getString("roll_number"));
                student.setMobile(rs.getString("mobile"));
                student.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return student;
    }


    // UPDATE STUDENT

    public boolean updateStudent(Student student) {

        String sql = "UPDATE students SET " +
                     "name = ?, father_name = ?, class_name = ?, " +
                     "roll_number = ?, mobile = ?, address = ? " +
                     "WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, student.getName());
            ps.setString(2, student.getFatherName());
            ps.setString(3, student.getClassName());
            ps.setString(4, student.getRollNumber());
            ps.setString(5, student.getMobile());
            ps.setString(6, student.getAddress());
            ps.setInt(7, student.getId());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }


    // DELETE STUDENT

    public boolean deleteStudent(int id) {

        String sql = "DELETE FROM students WHERE id = ?";

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
    
    public List<Student> getStudentsByClass(String className) {

        List<Student> students = new ArrayList<>();

        String sql = "SELECT * FROM students WHERE class_name = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, className);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student student = new Student();

                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setFatherName(rs.getString("father_name"));
                student.setClassName(rs.getString("class_name"));
                student.setRollNumber(rs.getString("roll_number"));
                student.setMobile(rs.getString("mobile"));
                student.setAddress(rs.getString("address"));

                students.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return students;
    }
}
