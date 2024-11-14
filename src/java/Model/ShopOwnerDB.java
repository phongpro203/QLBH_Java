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
public class ShopOwnerDB extends DBContext<ShopOwner> {
    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, ShopOwner shopowner) throws SQLException {
        pstmt.setString(1, shopowner.getTenshop());
        pstmt.setString(2, shopowner.getTenchushop());
        pstmt.setString(3, shopowner.getSdt());
        pstmt.setString(4, shopowner.getMasothue());
        pstmt.setInt(3, shopowner.getAddress_id());
        pstmt.setInt(3, shopowner.getUser_id());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (shopowner.getId()!= 0) {
            pstmt.setInt(7, shopowner.getId());
        }
    }
    @Override
    protected ShopOwner getEntityFromResultSet(ResultSet rs) throws SQLException {
        ShopOwner shopowner = new ShopOwner();
        shopowner.setId(rs.getInt("id"));
        shopowner.setTenshop(rs.getString("tenshop"));
        shopowner.setTenchushop(rs.getString("tenchushop"));
        shopowner.setSdt(rs.getString("sdt"));
        shopowner.setMasothue(rs.getString("masothue"));
        shopowner.setAddress_id(rs.getInt("address_id"));
        shopowner.setAddress_id(rs.getInt("user_id"));
        // Thêm các thuộc tính khác của shop_owner nếu có
        return shopowner;
    }
    @Override
    protected List<ShopOwner> getListFromResultSet(ResultSet rs) throws SQLException {
        List<ShopOwner> shopownerList = new ArrayList<>();
        while (rs.next()) {
            shopownerList.add(getEntityFromResultSet(rs));
        }
        return shopownerList; 
    }
    public void insert(ShopOwner shopowner) throws SQLException {
        Connection con = getConnection();
        String sql = "INSERT INTO shop_owner (tenshop, tenchushop, sdt, masothue, address_id, user_id) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, shopowner.getTenshop());
        statement.setString(2, shopowner.getTenchushop());
        statement.setString(3, shopowner.getSdt());
        statement.setString(4, shopowner.getMasothue());
        statement.setInt(5, shopowner.getAddress_id());
        statement.setInt(6, shopowner.getUser_id());
        statement.executeUpdate();
    }
    public ArrayList<ShopOwner> getAll() throws SQLException {
        Connection con = getConnection();
        ArrayList<ShopOwner> shopOwnerList = new ArrayList<>();
        String sql = "SELECT * FROM shop_owner";
        PreparedStatement statement = con.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            shopOwnerList.add(getEntityFromResultSet(rs));
        }
        return shopOwnerList;
    }
    public ShopOwner find(int id)
    {
        String sql = "SELECT * FROM shop_owner WHERE id = ?";
        return findById(id, sql);
    }
}
