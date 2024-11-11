/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDB extends DBContext<User>{

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, User user) throws SQLException {
        pstmt.setString(1, user.getUserName());
        pstmt.setString(2, user.getPassword());
        pstmt.setInt(3, user.getRole_id());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (user.getId()!= 0) {
            pstmt.setInt(3, user.getId());
        }
    }

    @Override
    protected User getEntityFromResultSet(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected List<User> getListFromResultSet(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
