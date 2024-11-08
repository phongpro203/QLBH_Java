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

/**
 *
 * @author Admin
 */
public class MatHangDB extends DBContext<MatHang>{

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, MatHang matHang) throws SQLException {
        pstmt.setString(1, matHang.getTenhang());
        pstmt.setInt(2, matHang.getGia());
        // Nếu đây là câu lệnh update, thêm id ở vị trí cuối cùng
        if (matHang.getMahang() != "0") {
            pstmt.setString(3, matHang.getMahang());
        }
    }

    @Override
    protected MatHang getEntityFromResultSet(ResultSet rs) throws SQLException {
        MatHang matHang = new MatHang();
        matHang.setMahang(rs.getString("mahang"));
        matHang.setTenhang(rs.getString("tenhang"));
        matHang.setGia(rs.getInt("gia"));
        // Thêm các thuộc tính khác của MatHang nếu có
        return matHang;
    }

    @Override
    protected List<MatHang> getListFromResultSet(ResultSet rs) throws SQLException {
        List<MatHang> matHangList = new ArrayList<>();
        while (rs.next()) {
            matHangList.add(getEntityFromResultSet(rs));
        }
        return matHangList;
    }
    public List<MatHang> findAllProducts() {
        String sql = "SELECT * FROM hanghoa";
        return findAll(sql);
    }
    public void updateProduct(MatHang matHang) {
        String sql = "UPDATE hanghoa SET tenhang = ?, gia = ? WHERE mahang = ?";
        update(matHang, sql);
    }
}
