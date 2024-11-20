package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDB extends DBContext<Order> {

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, Order order) throws SQLException {
        pstmt.setInt(1, order.getGoodsId());
        pstmt.setInt(2, order.getShopperId());
        pstmt.setInt(3, order.getShopOwnerId());
        pstmt.setObject(4, order.getShipperId(), java.sql.Types.INTEGER); // Hỗ trợ NULL cho shipper_id
        pstmt.setInt(5, order.getAddressStartId());
        pstmt.setInt(6, order.getAddressEndId());
        pstmt.setString(7, order.getTinhTrang());
        pstmt.setDate(8, order.getNgayDat());
        pstmt.setDate(9, order.getNgayGiao());
        pstmt.setInt(10, order.getThanhTien());

        // Nếu là update, thêm id ở vị trí cuối cùng
        if (order.getId() != 0) {
            pstmt.setInt(11, order.getId());
        }
    }

    @Override
    protected Order getEntityFromResultSet(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setId(rs.getInt("id"));
        order.setGoodsId(rs.getInt("goods_id"));
        order.setShopperId(rs.getInt("shopper_id"));
        order.setShopOwnerId(rs.getInt("shop_owner_id"));
        order.setShipperId((Integer) rs.getObject("shipper_id")); // Có thể nhận giá trị NULL
        order.setAddressStartId(rs.getInt("address_start_id"));
        order.setAddressEndId(rs.getInt("address_end_id"));
        order.setTinhTrang(rs.getString("tinhtrang"));
        order.setNgayDat(rs.getDate("ngaydat"));
        order.setNgayGiao(rs.getDate("ngaygiao"));
        order.setThanhTien(rs.getInt("thanhtien"));
        return order;
    }

    @Override
    protected List<Order> getListFromResultSet(ResultSet rs) throws SQLException {
        List<Order> orderList = new ArrayList<>();
        while (rs.next()) {
            orderList.add(getEntityFromResultSet(rs));
        }
        return orderList;
    }

    // Lấy tất cả đơn hàng
    public List<Order> findAllOrders() {
        String sql = "SELECT * FROM `order`";
        return findAll(sql);
    }

    // Lấy đơn hàng theo ID
    public Order find(int id) {
        String sql = "SELECT * FROM `order` WHERE id = ?";
        return findById(id, sql);
    }
    
    public List<Order> findByShopper(int id) {
        String sql = "SELECT * FROM `order` WHERE shopper_id = " + id;
        return findAll(sql);
    }


    // Thêm đơn hàng mới
    public void insertOrder(Order order) {
        String sql = "INSERT INTO `order` (goods_id, shopper_id, shop_owner_id, shipper_id, address_start_id, address_end_id, tinhtrang, ngaydat, ngaygiao, thanhtien) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        insert(order, sql);
    }

    // Cập nhật đơn hàng
    public void updateOrder(Order order) {
        String sql = "UPDATE `order` SET goods_id = ?, shopper_id = ?, shop_owner_id = ?, shipper_id = ?, address_start_id = ?, address_end_id = ?, tinhtrang = ?, ngaydat = ?, ngaygiao = ?, thanhtien = ? WHERE id = ?";
        update(order, sql);
    }

    // Xóa đơn hàng theo ID
    public void deleteOrder(int id) {
        String sql = "DELETE FROM `order` WHERE id = ?";
        delete(id, sql);
    }
}
