package Model;

import java.sql.Connection;
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

    public List<String[]> getOrdersWithNames() {
    List<String[]> orders = new ArrayList<>();
    String sql = """
        SELECT
            o.id,
            g.tensp AS goods_name,    
            s.hoten AS shopper_name,     
            so.tenshop AS shop_owner_name, 
            sh.hoten AS shipper_name,     
            a_start.tinhthanh AS address_start_id,  
            a_end.tinhthanh AS address_end_id,
            o.tinhtrang,
            o.ngaydat,
            o.ngaygiao,
            o.thanhtien
        FROM
            `order` o
        JOIN goods g ON o.goods_id = g.id
        JOIN shopper s ON o.shopper_id = s.id
        JOIN shop_owner so ON o.shop_owner_id = so.id
        JOIN shipper sh ON o.shipper_id = sh.id
        JOIN address a_start ON o.address_start_id = a_start.id
        JOIN address a_end ON o.address_end_id = a_end.id
    """;

    try (
        Connection conn = getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
    ) {
        while (rs.next()) {
            String[] order = new String[11]; // Có 10 cột được select
            order[0] = String.valueOf(rs.getInt("id")); // Lấy ID đơn hàng
            order[1] = rs.getString("goods_name"); // Tên sản phẩm
            order[2] = rs.getString("shopper_name"); // Người mua hàng
            order[3] = rs.getString("shop_owner_name"); // Chủ cửa hàng
            order[4] = rs.getString("shipper_name"); // Người giao hàng
            order[5] = rs.getString("address_start_id"); // Địa chỉ bắt đầu
            order[6] = rs.getString("address_end_id"); // Địa chỉ kết thúc
            order[7] = rs.getString("tinhtrang"); // Tình trạng đơn hàng
            order[8] = rs.getString("ngaydat"); // Ngày đặt
            order[9] = rs.getString("ngaygiao"); // Ngày giao
            order[10] = rs.getString("thanhtien");
            orders.add(order);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return orders;
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

    public void updateTinhTrangOrder(int id, String tinhTrang) {
        String sql = "UPDATE `order` SET tinhtrang = ? WHERE id = ?";
        try (PreparedStatement pstmt = getConnection().prepareStatement(sql)) {
            pstmt.setString(1, tinhTrang);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
