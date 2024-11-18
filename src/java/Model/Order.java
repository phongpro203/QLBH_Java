/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Order {
    private int id;
    private int goodsId;
    private int shopperId;
    private int shopOwnerId;
    private Integer shipperId;
    private int addressStartId;
    private int addressEndId;
    private String tinhTrang;
    private java.sql.Date ngayDat;
    private java.sql.Date ngayGiao;
    private int thanhTien;

    // Constructor
    public Order() {}

    public Order(int id, int goodsId, int shopperId, int shopOwnerId, Integer shipperId, int addressStartId, int addressEndId, String tinhTrang, java.sql.Date ngayDat, java.sql.Date ngayGiao, int thanhTien) {
        this.id = id;
        this.goodsId = goodsId;
        this.shopperId = shopperId;
        this.shopOwnerId = shopOwnerId;
        this.shipperId = shipperId;
        this.addressStartId = addressStartId;
        this.addressEndId = addressEndId;
        this.tinhTrang = tinhTrang;
        this.ngayDat = ngayDat;
        this.ngayGiao = ngayGiao;
        this.thanhTien = thanhTien;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
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

    public Integer getShipperId() {
        return shipperId;
    }

    public void setShipperId(Integer shipperId) {
        this.shipperId = shipperId;
    }

    public int getAddressStartId() {
        return addressStartId;
    }

    public void setAddressStartId(int addressStartId) {
        this.addressStartId = addressStartId;
    }

    public int getAddressEndId() {
        return addressEndId;
    }

    public void setAddressEndId(int addressEndId) {
        this.addressEndId = addressEndId;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public java.sql.Date getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(java.sql.Date ngayDat) {
        this.ngayDat = ngayDat;
    }

    public java.sql.Date getNgayGiao() {
        return ngayGiao;
    }

    public void setNgayGiao(java.sql.Date ngayGiao) {
        this.ngayGiao = ngayGiao;
    }

    public int getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(int thanhTien) {
        this.thanhTien = thanhTien;
    }
}
