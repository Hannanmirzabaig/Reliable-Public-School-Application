package com.reliable.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.reliable.school.model.Notice;
import com.reliable.school.util.DBUtil;

public class NoticeDAO {

    // ADD NOTICE
    public boolean addNotice(Notice notice) {

        boolean status = false;

        try {
            Connection con = DBUtil.getConnection();

            String sql = "INSERT INTO notices (title, description, notice_date) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, notice.getTitle());
            ps.setString(2, notice.getDescription());
            ps.setString(3, notice.getNoticeDate());

            int result = ps.executeUpdate();

            if (result > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // GET ALL NOTICES
    public List<Notice> getAllNotices() {

        List<Notice> list = new ArrayList<>();

        try {
            Connection con = DBUtil.getConnection();

            String sql = "SELECT * FROM notices ORDER BY id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Notice notice = new Notice();

                notice.setId(rs.getInt("id"));
                notice.setTitle(rs.getString("title"));
                notice.setDescription(rs.getString("description"));
                notice.setNoticeDate(rs.getString("notice_date"));

                list.add(notice);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // GET NOTICE BY ID
    public Notice getNoticeById(int id) {

        Notice notice = null;

        try {
            Connection con = DBUtil.getConnection();

            String sql = "SELECT * FROM notices WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                notice = new Notice();

                notice.setId(rs.getInt("id"));
                notice.setTitle(rs.getString("title"));
                notice.setDescription(rs.getString("description"));
                notice.setNoticeDate(rs.getString("notice_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return notice;
    }


    // UPDATE NOTICE
    public boolean updateNotice(Notice notice) {

        boolean status = false;

        try {
            Connection con = DBUtil.getConnection();

            String sql = "UPDATE notices SET title=?, description=?, notice_date=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, notice.getTitle());
            ps.setString(2, notice.getDescription());
            ps.setString(3, notice.getNoticeDate());
            ps.setInt(4, notice.getId());

            int result = ps.executeUpdate();

            if (result > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // DELETE NOTICE
    public boolean deleteNotice(int id) {

        boolean status = false;

        try {
            Connection con = DBUtil.getConnection();

            String sql = "DELETE FROM notices WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int result = ps.executeUpdate();

            if (result > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}