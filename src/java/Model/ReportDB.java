package Model;

import java.sql.Connection;
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
    public List<String[]> getReportsWithDetailsByUser(int userId) {
        List<String[]> reports = new ArrayList<>();
        String sql = """
        SELECT
            r.id AS report_id,
            r.phanhoi AS feedback,
            g.tensp AS goods_name,
            s.hoten AS shopper_name,
            so.tenshop AS shop_name
        FROM
            report r
        JOIN goods g ON r.goods_id = g.id
        JOIN shopper s ON r.shopper_id = s.id
        JOIN shop_owner so ON r.shop_owner_id = so.id
        JOIN user u ON so.user_id = u.id
        WHERE
            u.id = ?;
    """;

        try (
                Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId); // Gán user_id từ session
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String[] reportDetails = new String[5];
                    reportDetails[0] = String.valueOf(rs.getInt("report_id")); // ID phản hồi
                    reportDetails[1] = rs.getString("feedback"); // Nội dung phản hồi
                    reportDetails[2] = rs.getString("goods_name"); // Tên sản phẩm
                    reportDetails[3] = rs.getString("shopper_name"); // Tên người mua
                    reportDetails[4] = rs.getString("shop_name"); // Tên cửa hàng
                    reports.add(reportDetails);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }
}
