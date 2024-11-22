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
public class ShipperDB extends DBContext<Shipper>{

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, Shipper shipper) throws SQLException {
        pstmt.setString(1, shipper.getHoten());
        pstmt.setString(2, shipper.getSdt());
        pstmt.setInt(3, shipper.getUser_id());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (shipper.getId() != 0) {
            pstmt.setInt(4, shipper.getId());
        }
    }

    @Override
    protected Shipper getEntityFromResultSet(ResultSet rs) throws SQLException {
        Shipper shipper = new Shipper();
        shipper.setId(rs.getInt("id"));
        shipper.setHoten(rs.getString("hoten"));
        shipper.setSdt(rs.getString("sdt"));
        shipper.setUser_id(rs.getInt("user_id"));
        // Thêm các thuộc tính khác của shipper nếu có
        return shipper;
    }

    @Override
    protected List<Shipper> getListFromResultSet(ResultSet rs) throws SQLException {
        List<Shipper> shipperList = new ArrayList<>();
        while (rs.next()) {
            shipperList.add(getEntityFromResultSet(rs));
        }
        return shipperList;
    }
    public void insert(Shipper shipper) throws SQLException {
        Connection con = getConnection();
        String sql = "INSERT INTO shipper (hoten, sdt, user_id) VALUES (?, ?, ?)";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, shipper.getHoten());
        statement.setString(2, shipper.getSdt());
        statement.setInt(3, shipper.getUser_id());
        statement.executeUpdate();
    }
    public ArrayList<Shipper> getAll() throws SQLException {
        Connection con = getConnection();
        ArrayList<Shipper> shipperList = new ArrayList<>();
        String sql = "SELECT * FROM shipper";
        PreparedStatement statement = con.prepareStatement(sql);
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            shipperList.add(getEntityFromResultSet(rs));
        }
        return shipperList;
    }
    public Shipper find(int id)
    {
        String sql = "SELECT * FROM shipper WHERE id = ?";
        return findById(id, sql);
    }
    public Shipper checkSDT(String sdt) throws SQLException{
        Connection con = getConnection();
        String sql = "SELECT * FROM shipper WHERE sdt = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, sdt);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            // Nếu tìm thấy người dùng, tạo đối tượng User và gán các giá trị
            Shipper shipper = new Shipper();
            shipper = getEntityFromResultSet(resultSet);
            return shipper;
        }
        return null;  
    }
    public Shipper findByUserId(int userId) throws SQLException {
    String sql = "SELECT * FROM shipper WHERE user_id = ?";
    try (PreparedStatement ps = getConnection().prepareStatement(sql)) {
        ps.setInt(1, userId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return getEntityFromResultSet(rs);
            }
        }
    }
    return null; // Không tìm thấy shipper
}
}
