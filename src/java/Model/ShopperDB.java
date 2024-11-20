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
public class ShopperDB extends DBContext<Shopper>{

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, Shopper shopper) throws SQLException {
        pstmt.setString(1, shopper.getHoten());
        pstmt.setString(3, shopper.getSdt());
        pstmt.setInt(3, shopper.getAddress_id());
        pstmt.setInt(4, shopper.getUser_id());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (shopper.getId()!= 0) {
            pstmt.setInt(5, shopper.getId());
        }
    }

    @Override
    protected Shopper getEntityFromResultSet(ResultSet rs) throws SQLException {
        Shopper shopper = new Shopper();
        shopper.setId(rs.getInt("id"));
        shopper.setHoten(rs.getString("hoten"));
        shopper.setSdt(rs.getString("sdt"));
        shopper.setAddress_id(rs.getInt("address_id"));
        shopper.setUser_id(rs.getInt("user_id"));
        // Thêm các thuộc tính khác của shop_owner nếu có
        return shopper;
    }

    @Override
    protected List<Shopper> getListFromResultSet(ResultSet rs) throws SQLException {
        List<Shopper> shopperList = new ArrayList<>();
        while (rs.next()) {
            shopperList.add(getEntityFromResultSet(rs));
        }
        return shopperList; 
    }
    public void insert(Shopper shopper) throws SQLException {
        Connection con = getConnection();
        String sql = "INSERT INTO shopper (hoten, sdt, address_id, user_id) VALUES (?, ?, ?, ?)";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, shopper.getHoten());
        statement.setString(2, shopper.getSdt());
        statement.setInt(3, shopper.getAddress_id());
        statement.setInt(4, shopper.getUser_id());
        statement.executeUpdate();
    }
    public ArrayList<Shopper> getAll() throws SQLException {
        Connection con = getConnection();
        ArrayList<Shopper> shopperList = new ArrayList<>();
        String sql = "SELECT * FROM shopper";
        PreparedStatement statement = con.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            shopperList.add(getEntityFromResultSet(rs));
        }
        return shopperList;
    }
    public Shopper find(int id)
    {
        String sql = "SELECT * FROM shopper WHERE id = ?";
        return findById(id, sql);
    }
    public Shopper findByUser(int id)
    {
        String sql = "SELECT * FROM shopper WHERE user_id = ?";
        return findById(id, sql);
    }
    
}
