package Model;

public class Report {
    private int id;
    private int shopperId;
    private int shopOwnerId;
    private String phanhoi;

    public Report() {
    }

    public Report(int id, int shopperId, int shopOwnerId, String phanhoi) {
        this.id = id;
        this.shopperId = shopperId;
        this.shopOwnerId = shopOwnerId;
        this.phanhoi = phanhoi;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShopperId() {
        return shopperId;
    }

    public void setShopperId(int shopperId) {
        this.shopperId = shopperId;
    }

    public int getShopOwnerId() {
        return shopOwnerId;
    }

    public void setShopOwnerId(int shopOwnerId) {
        this.shopOwnerId = shopOwnerId;
    }

    public String getPhanhoi() {
        return phanhoi;
    }

    public void setPhanhoi(String phanhoi) {
        this.phanhoi = phanhoi;
    }
}
