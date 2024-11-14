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
public class AddressDB extends DBContext<Address> {
    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, Address address) throws SQLException {
        pstmt.setString(1, address.getTinhthanh());
        pstmt.setString(2, address.getXaphuong());
        pstmt.setString(3, address.getQuanhuyen());
        pstmt.setString(4, address.getSonha());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (address.getId()!= 0) {
            pstmt.setInt(7, address.getId()); 
        }
    }

   // Phương thức lấy danh sách Address từ ResultSet
    @Override
    protected List<Address> getListFromResultSet(ResultSet rs) throws SQLException {
        List<Address> addressList = new ArrayList<>();
        while (rs.next()) {
            Address address = new Address();
            address.setId(rs.getInt("id")); // Sửa theo cột ID trong bảng Address nếu cần
            address.setTinhthanh(rs.getString("tinhthanh"));
            address.setXaphuong(rs.getString("xaphuong"));
            address.setQuanhuyen(rs.getString("quanhuyen"));
            address.setSonha(rs.getString("sonha"));
            addressList.add(address);
        }
        return addressList;
    }
    // Phương thức lấy đối tượng Address từ ResultSet
    @Override
    protected Address getEntityFromResultSet(ResultSet rs) throws SQLException {
        Address address = new Address();
        address.setId(rs.getInt("id")); // Sửa theo cột ID trong bảng Address nếu cần
        address.setTinhthanh(rs.getString("tinhthanh"));
        address.setXaphuong(rs.getString("xaphuong"));
        address.setQuanhuyen(rs.getString("quanhuyen"));
        address.setSonha(rs.getString("sonha"));
        return address;
    }
    
    // Phương thức thêm Address vào database
    public int insert(Address address) throws SQLException {
        String sql = "INSERT INTO address (tinhthanh, xaphuong, quanhuyen, sonha) VALUES (?, ?, ?, ?)";
        Connection con = getConnection();
        PreparedStatement statement = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

        statement.setString(1, address.getTinhthanh());
        statement.setString(2, address.getXaphuong());
        statement.setString(3, address.getQuanhuyen());
        statement.setString(4, address.getSonha());
        statement.executeUpdate();

        // Lấy ID của địa chỉ vừa thêm
        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            } else {
                throw new SQLException("Thêm địa chỉ không thành công, không lấy được ID.");
            }
        }
    }
}
