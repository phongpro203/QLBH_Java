/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kohakuta
 */
public class SellerSignUpDB extends DBContext<SellerSignUp> {
    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, SellerSignUp seller) throws SQLException {
        pstmt.setString(1, seller.getTenshop());
        pstmt.setString(2, seller.getTenchushop());
        pstmt.setString(3, seller.getSdt());
        pstmt.setString(4, seller.getMasothue());
        pstmt.setInt(3, seller.getAddress_id());
        pstmt.setInt(3, seller.getUser_id());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (seller.getId()!= 0) {
            pstmt.setInt(7, seller.getId());
        }
    }
    @Override
    protected SellerSignUp getEntityFromResultSet(ResultSet rs) throws SQLException {
        SellerSignUp seller = new SellerSignUp();
        seller.setId(rs.getInt("id"));
        seller.setTenshop(rs.getString("tenshop"));
        seller.setTenchushop(rs.getString("tenchushop"));
        seller.setSdt(rs.getString("sdt"));
        seller.setMasothue(rs.getString("masothue"));
        seller.setAddress_id(rs.getInt("address_id"));
        seller.setAddress_id(rs.getInt("user_id"));
        // Thêm các thuộc tính khác của shop_owner nếu có
        return seller;
    }
    @Override
    protected List<SellerSignUp> getListFromResultSet(ResultSet rs) throws SQLException {
        List<SellerSignUp> sellerList = new ArrayList<>();
        while (rs.next()) {
            sellerList.add(getEntityFromResultSet(rs));
        }
        return sellerList;
    }
    public void insert(SellerSignUp seller) throws SQLException {
        Connection con = getConnection();
        String sql = "INSERT INTO shop_owner (tenshop, tenchushop, sdt, masothue, address_id, user_id) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, seller.getTenshop());
        statement.setString(2, seller.getTenchushop());
        statement.setString(3, seller.getSdt());
        statement.setString(4, seller.getMasothue());
        statement.setInt(5, seller.getAddress_id());
        statement.setInt(6, seller.getUser_id());
        statement.executeUpdate();

    }
}
