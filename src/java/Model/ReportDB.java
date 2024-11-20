package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReportDB extends DBContext<Report> {

    @Override
    protected void setParametersForInsertOrUpdate(PreparedStatement pstmt, Report report) throws SQLException {
        pstmt.setInt(1, report.getShopperId());
        pstmt.setInt(2, report.getShopOwnerId());
        pstmt.setInt(3, report.getGoodsId()); // Gán giá trị goods_id
        pstmt.setString(4, report.getPhanHoi());

        // Nếu là update, thêm id ở vị trí cuối cùng
        if (report.getId() != 0) {
            pstmt.setInt(5, report.getId());
        }
    }

    @Override
    protected Report getEntityFromResultSet(ResultSet rs) throws SQLException {
        Report report = new Report();
        report.setId(rs.getInt("id"));
        report.setShopperId(rs.getInt("shopper_id"));
        report.setShopOwnerId(rs.getInt("shop_owner_id"));
        report.setGoodsId(rs.getInt("goods_id")); // Lấy giá trị goods_id
        report.setPhanHoi(rs.getString("phanhoi"));
        return report;
    }

    @Override
    protected List<Report> getListFromResultSet(ResultSet rs) throws SQLException {
        List<Report> reportList = new ArrayList<>();
        while (rs.next()) {
            reportList.add(getEntityFromResultSet(rs));
        }
        return reportList;
    }

    // Lấy tất cả report
    public List<Report> findAllReports() {
        String sql = "SELECT * FROM report";
        return findAll(sql);
    }

    // Lấy report theo ID
    public Report find(int id) {
        String sql = "SELECT * FROM report WHERE id = ?";
        return findById(id, sql);
    }

    // Thêm report mới
    public void insertReport(Report report) {
        String sql = "INSERT INTO report (shopper_id, shop_owner_id, goods_id, phanhoi) VALUES (?, ?, ?, ?)";
        insert(report, sql);
    }

    // Cập nhật report
    public void updateReport(Report report) {
        String sql = "UPDATE report SET shopper_id = ?, shop_owner_id = ?, goods_id = ?, phanhoi = ? WHERE id = ?";
        update(report, sql);
    }

    // Xóa report theo ID
    public void deleteReport(int id) {
        String sql = "DELETE FROM report WHERE id = ?";
        delete(id, sql);
    }
}
