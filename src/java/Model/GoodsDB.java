package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GoodsDB extends DBContext<Goods> {

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, Goods goods) throws SQLException {
        pstmt.setString(1, goods.getTensp());
        pstmt.setString(2, goods.getChungloai());
        pstmt.setString(3, goods.getChitiet());
        pstmt.setInt(4, goods.getGia());
        pstmt.setInt(5, goods.getSoluong());
        pstmt.setString(6, goods.getHinhanh());
        pstmt.setInt(7, goods.getShopOwnerId());
        pstmt.setInt(8, goods.getGiamGia());
        
        // Nếu là update, thêm id ở vị trí cuối cùng
        if (goods.getId() != 0) {
            pstmt.setInt(9, goods.getId());
        }
    }

    @Override
    protected Goods getEntityFromResultSet(ResultSet rs) throws SQLException {
        Goods goods = new Goods();
        goods.setId(rs.getInt("id"));
        goods.setTensp(rs.getString("tensp"));
        goods.setChungloai(rs.getString("chungloai"));
        goods.setChitiet(rs.getString("chitiet"));
        goods.setGia(rs.getInt("gia"));
        goods.setSoluong(rs.getInt("soluong"));
        goods.setHinhanh(rs.getString("hinhanh"));
        goods.setShopOwnerId(rs.getInt("shop_owner_id"));
        goods.setGiamGia(rs.getInt("giam_gia"));
        return goods;
    }

    @Override
    protected List<Goods> getListFromResultSet(ResultSet rs) throws SQLException {
        List<Goods> goodsList = new ArrayList<>();
        while (rs.next()) {
            goodsList.add(getEntityFromResultSet(rs));
        }
        return goodsList;
    }

    public List<Goods> findAllGoods() {
        String sql = "SELECT * FROM goods";
        return findAll(sql);
    }
    public List<Goods> findAllGoodsByShop(int id) {
        String sql = "SELECT * FROM goods where shop_owner_id = "+id;
        return findAll(sql);
    }
    public Goods find(int id)
    {
        String sql = "SELECT * FROM goods WHERE id = ?";
        return findById(id, sql);
    }
    public void updateGoods(Goods goods) {
        String sql = "UPDATE goods SET tensp = ?, chungloai = ?, chitiet = ?, gia = ?, soluong = ?, hinhanh = ?, shop_owner_id = ?, giam_gia = ? WHERE id = ?";
        update(goods, sql);
    }

    public void insertGoods(Goods goods) {
        String sql = "INSERT INTO goods(tensp, chungloai, chitiet, gia, soluong, hinhanh, shop_owner_id, giam_gia) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        insert(goods, sql);
    }

    public void deleteGoods(int id) {
        String sql = "DELETE FROM goods WHERE id = ?";
        delete(id, sql);
    }
}
