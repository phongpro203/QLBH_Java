/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author kohakuta
 */
public class Address {
    private int id;
    private String tinhthanh;
    private String xaphuong;
    private String quanhuyen;
    private String sonha; 
 
    public Address() {
    }

    public Address(int id, String tinhthanh, String xaphuong, String quanhuyen, String sonha) {
        this.id = id;
        this.tinhthanh = tinhthanh;
        this.xaphuong = xaphuong;
        this.quanhuyen = quanhuyen;
        this.sonha = sonha;
    }
    
    // Getters và setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTinhthanh() { return tinhthanh; }
    public void setTinhthanh(String tinhthanh) { this.tinhthanh = tinhthanh; }

    public String getXaphuong() { return xaphuong; }
    public void setXaphuong(String xaphuong) { this.xaphuong = xaphuong; }

    public String getQuanhuyen() { return quanhuyen; }
    public void setQuanhuyen(String quanhuyen) { this.quanhuyen = quanhuyen; }

    public String getSonha() { return sonha; }
    public void setSonha(String sonha) { this.sonha = sonha; }
    
    public String getDiaChi()
    {
        return this.sonha +", "+ this.xaphuong +", "+ this.quanhuyen +", "+ this.tinhthanh;
    }
}

