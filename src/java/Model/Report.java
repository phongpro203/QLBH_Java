package Model;

public class Report {
    private int id;
    private int shopperId;
    private int shopOwnerId;
    private int goodsId; // Thêm goods_id
    private String phanHoi;

    // Constructors
    public Report() {
    }

    public Report(int id, int shopperId, int shopOwnerId, int goodsId, String phanHoi) {
        this.id = id;
        this.shopperId = shopperId;
        this.shopOwnerId = shopOwnerId;
        this.goodsId = goodsId;
        this.phanHoi = phanHoi;
    }

    // Getters and Setters
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

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getPhanHoi() {
        return phanHoi;
    }

    public void setPhanHoi(String phanHoi) {
        this.phanHoi = phanHoi;
    }
}
