/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class UserDB extends DBContext<User> {

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, User user) throws SQLException {
        pstmt.setString(1, user.getUserName());
        pstmt.setString(2, user.getPassword());
        pstmt.setInt(3, user.getRole_id());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (user.getId() != 0) {
            pstmt.setInt(3, user.getId());
        }
    }

    @Override
    protected User getEntityFromResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUserName(rs.getString("userrname"));
        user.setPassword(rs.getString("password"));
        user.setRole_id(rs.getInt("role_id"));
        // Thêm các thuộc tính khác của MatHang nếu có
        return user;
    }

    @Override
    protected List<User> getListFromResultSet(ResultSet rs) throws SQLException {
        List<User> userList = new ArrayList<>();
        while (rs.next()) {
            userList.add(getEntityFromResultSet(rs));
        }
        return userList;
    }

    public User checkLogin(String username, String password) throws SQLException {
        Connection con = getConnection();
        String sql = "SELECT * FROM user WHERE userrname = ? AND password = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            // Nếu tìm thấy người dùng, tạo đối tượng User và gán các giá trị
            User user = new User();
            user = getEntityFromResultSet(resultSet);
            return user;
        }
        return null;
    }

    // Thêm phương thức insert để thêm User vào CSDL
    public void insert(User user) throws SQLException {
        Connection con = getConnection();
        String sql = "INSERT INTO user (userrname, password, role_id) VALUES (?, ?, ?)";
        PreparedStatement statement = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, user.getUserName());
        statement.setString(2, user.getPassword());
        statement.setInt(3, user.getRole_id());
        statement.executeUpdate();

        // Lấy id vừa tạo
        ResultSet generatedKeys = statement.getGeneratedKeys();
        if (generatedKeys.next()) {
            int generatedId = generatedKeys.getInt(1);
            user.setId(generatedId);  // Lưu id vào user
        }

        statement.close();
        con.close();
    }

    // Lấy tất cả người dùng
    public ArrayList<User> getAll() throws SQLException {
        Connection con = getConnection();
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM user";
        PreparedStatement statement = con.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            userList.add(getEntityFromResultSet(rs));
        }
        return userList;
    }
    
    public void deleteUser(int id) {
        String sql = "DELETE FROM user WHERE id = ?";
        delete(id, sql);
    }
}
