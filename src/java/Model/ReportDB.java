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
        pstmt.setString(3, report.getPhanhoi());

        // Nếu là update, thêm id ở vị trí cuối cùng
        if (report.getId() != 0) {
            pstmt.setInt(4, report.getId());
        }
    }

    @Override
    protected Report getEntityFromResultSet(ResultSet rs) throws SQLException {
        Report report = new Report();
        report.setId(rs.getInt("id"));
        report.setShopperId(rs.getInt("shopper_id"));
        report.setShopOwnerId(rs.getInt("shop_owner_id"));
        report.setPhanhoi(rs.getString("phanhoi"));
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

    // Các phương thức truy vấn cụ thể
    public List<Report> findAllReports() {
        String sql = "SELECT * FROM report";
        return findAll(sql);
    }

    public Report find(int id) {
        String sql = "SELECT * FROM report WHERE id = ?";
        return findById(id, sql);
    }

    public void updateReport(Report report) {
        String sql = "UPDATE report SET shopper_id = ?, shop_owner_id = ?, phanhoi = ? WHERE id = ?";
        update(report, sql);
    }

    public void insertReport(Report report) {
        String sql = "INSERT INTO report(shopper_id, shop_owner_id, phanhoi) VALUES (?, ?, ?)";
        insert(report, sql);
    }

    public void deleteReport(int id) {
        String sql = "DELETE FROM report WHERE id = ?";
        delete(id, sql);
    }
}
