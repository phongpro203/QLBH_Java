package Model;

public class Goods {
    private int id;
    private String tensp;
    private String chungloai;
    private String chitiet;
    private int gia;
    private int soluong;
    private String hinhanh;
    private int shopOwnerId;
    private int giamGia;

    public Goods() {
    }

    public Goods(int id, String tensp, String chungloai, String chitiet, int gia, int soluong, String hinhanh, int shopOwnerId, int giamGia) {
        this.id = id;
        this.tensp = tensp;
        this.chungloai = chungloai;
        this.chitiet = chitiet;
        this.gia = gia;
        this.soluong = soluong;
        this.hinhanh = hinhanh;
        this.shopOwnerId = shopOwnerId;
        this.giamGia = giamGia;
    }

    // Getters and setters for all attributes

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getChungloai() {
        return chungloai;
    }

    public void setChungloai(String chungloai) {
        this.chungloai = chungloai;
    }

    public String getChitiet() {
        return chitiet;
    }

    public void setChitiet(String chitiet) {
        this.chitiet = chitiet;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public String getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(String hinhanh) {
        this.hinhanh = hinhanh;
    }

    public int getShopOwnerId() {
        return shopOwnerId;
    }

    public void setShopOwnerId(int shopOwnerId) {
        this.shopOwnerId = shopOwnerId;
    }

    public int getGiamGia() {
        return giamGia;
    }

    public void setGiamGia(int giamGia) {
        this.giamGia = giamGia;
    }
    
    public int getGiaGiam() {
        return this.gia*(this.giamGia/100);
    }
}
