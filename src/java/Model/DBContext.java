/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public abstract class DBContext<T> {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/qlbh";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Kết nối với CSDL
    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (Connection) DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // Phương thức thêm mới đối tượng (insert)
    public void insert(T entity, String sql) {
        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            setParametersForInsertOrUpdate(pstmt, entity); // Triển khai trong lớp con
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức cập nhật đối tượng (update)
    public void update(T entity, String sql) {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            setParametersForInsertOrUpdate(pstmt, entity); // Triển khai trong lớp con
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức xóa đối tượng (delete)
    public void delete(int id, String sql) {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức lấy một đối tượng theo ID
    public T findById(int id, String sql) {
        T entity = null;
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                entity = getEntityFromResultSet(rs); // Triển khai trong lớp con
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entity;
    }

    // Phương thức lấy tất cả các đối tượng
    public List<T> findAll(String sql) {
        List<T> entities = null;
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            entities = getListFromResultSet(rs); // Triển khai trong lớp con
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return entities;
    }

    // Các phương thức trừu tượng để chuyển đổi giữa đối tượng và CSDL
    protected abstract void setParametersForInsertOrUpdate(PreparedStatement pstmt, T entity) throws SQLException;

    protected abstract T getEntityFromResultSet(ResultSet rs) throws SQLException;

    protected abstract List<T> getListFromResultSet(ResultSet rs) throws SQLException;
}
