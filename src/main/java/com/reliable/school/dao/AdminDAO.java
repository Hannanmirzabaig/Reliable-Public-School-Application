package com.reliable.school.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.reliable.school.model.Admin;
import com.reliable.school.util.DBUtil;

public class AdminDAO {

    // =========================
    // LOGIN
    // =========================

    public Admin login(String username, String password) {

        Admin admin = null;

        String sql =
                "SELECT * FROM admin WHERE username = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String storedPassword =
                        rs.getString("password");

                // BCrypt password
                if (storedPassword.startsWith("$2a$")
                        || storedPassword.startsWith("$2b$")
                        || storedPassword.startsWith("$2y$")) {

                    if (!BCrypt.checkpw(password, storedPassword)) {
                        return null;
                    }

                } else {

                    // Old plain-text password
                    if (!password.equals(storedPassword)) {
                        return null;
                    }

                    String newHash =
                            BCrypt.hashpw(
                                    password,
                                    BCrypt.gensalt(12)
                            );

                    updatePasswordHash(
                            rs.getInt("id"),
                            newHash
                    );

                    storedPassword = newHash;
                }

                // Check account status
                String status =
                        rs.getString("status");

                if (!"ACTIVE".equalsIgnoreCase(status)) {
                    return null;
                }

                admin = new Admin();

                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(storedPassword);
                admin.setRole(rs.getString("role"));
                admin.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }


    // =========================
    // CREATE NEW ADMIN
    // =========================

    public boolean createAdmin(String username,
                               String email,
                               String password,
                               String role) {

        String hashedPassword =
                BCrypt.hashpw(
                        password,
                        BCrypt.gensalt(12)
                );

        String sql =
                "INSERT INTO admin "
                + "(username, email, password, role, status) "
                + "VALUES (?, ?, ?, ?, 'ACTIVE')";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, hashedPassword);
            ps.setString(4, role);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // UPDATE PASSWORD HASH
    // =========================

    private boolean updatePasswordHash(int id,
                                       String hashedPassword) {

        String sql =
                "UPDATE admin SET password = ? WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, hashedPassword);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // CHANGE / RESET PASSWORD
    // =========================

    public boolean updatePassword(int id,
                                  String newPassword) {

        String hashedPassword =
                BCrypt.hashpw(
                        newPassword,
                        BCrypt.gensalt(12)
                );

        String sql =
                "UPDATE admin SET password = ? WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, hashedPassword);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // DEACTIVATE ADMIN
    // =========================

    public boolean deactivateAdmin(int id) {

        String sql =
                "UPDATE admin "
                + "SET status = 'INACTIVE' "
                + "WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // ACTIVATE ADMIN
    // =========================

    public boolean activateAdmin(int id) {

        String sql =
                "UPDATE admin "
                + "SET status = 'ACTIVE' "
                + "WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // DELETE ADMIN
    // =========================

    public boolean deleteAdmin(int id) {

        String sql =
                "DELETE FROM admin WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // GET ALL ADMINS
    // =========================

    public List<Admin> getAllAdmins() {

        List<Admin> admins =
                new ArrayList<>();

        String sql =
                "SELECT id, username, email, role, status "
                + "FROM admin ORDER BY id";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Admin admin = new Admin();

                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setEmail(rs.getString("email"));
                admin.setRole(rs.getString("role"));
                admin.setStatus(rs.getString("status"));

                admins.add(admin);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admins;
    }


    // =========================
    // ACTIVE SUPER ADMIN COUNT
    // =========================

    public int getActiveSuperAdminCount() {

        int count = 0;

        String sql =
                "SELECT COUNT(*) FROM admin "
                + "WHERE role = 'SUPER_ADMIN' "
                + "AND status = 'ACTIVE'";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }


    // =========================
    // CHECK WHETHER ADMIN IS SUPER ADMIN
    // =========================

    public boolean isSuperAdmin(int id) {

        String sql =
                "SELECT role FROM admin WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return "SUPER_ADMIN".equals(
                            rs.getString("role")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // CHECK USERNAME EXISTS
    // =========================

    public boolean usernameExists(String username) {

        String sql =
                "SELECT id FROM admin WHERE username = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // CHECK EMAIL EXISTS
    // =========================

    public boolean emailExists(String email) {

        String sql =
                "SELECT id FROM admin WHERE email = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =================================================
    // PASSWORD RESET METHODS
    // =================================================


    // =========================
    // GET ADMIN BY EMAIL
    // =========================

    public Admin getAdminByEmail(String email) {

        Admin admin = null;

        String sql =
                "SELECT id, username, email, role, status "
                + "FROM admin WHERE email = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    admin = new Admin();

                    admin.setId(rs.getInt("id"));
                    admin.setUsername(
                            rs.getString("username")
                    );
                    admin.setEmail(
                            rs.getString("email")
                    );
                    admin.setRole(
                            rs.getString("role")
                    );
                    admin.setStatus(
                            rs.getString("status")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }


    // =========================
    // SAVE RESET TOKEN
    // =========================

    public boolean saveResetToken(int adminId,
                                  String token,
                                  Timestamp expiry) {

        String sql =
                "UPDATE admin "
                + "SET reset_token = ?, "
                + "reset_token_expiry = ? "
                + "WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, token);
            ps.setTimestamp(2, expiry);
            ps.setInt(3, adminId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================
    // GET ADMIN BY RESET TOKEN
    // =========================

    public Admin getAdminByResetToken(String token) {

        Admin admin = null;

        String sql =
                "SELECT id, username, email, role, status "
                + "FROM admin "
                + "WHERE reset_token = ? "
                + "AND reset_token_expiry > NOW()";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, token);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    admin = new Admin();

                    admin.setId(rs.getInt("id"));
                    admin.setUsername(
                            rs.getString("username")
                    );
                    admin.setEmail(
                            rs.getString("email")
                    );
                    admin.setRole(
                            rs.getString("role")
                    );
                    admin.setStatus(
                            rs.getString("status")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }


    // =========================
    // CLEAR RESET TOKEN
    // =========================

    public boolean clearResetToken(int adminId) {

        String sql =
                "UPDATE admin "
                + "SET reset_token = NULL, "
                + "reset_token_expiry = NULL "
                + "WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, adminId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}