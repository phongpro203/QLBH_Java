/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author kohakuta
 */
public class Shipper {
    private int id;
    private String hoten;
    private String sdt;
    private int user_id;

    public Shipper() {
    }

    public Shipper(int id, String hoten, String sdt, int user_id) {
        this.id = id;
        this.hoten = hoten;
        this.sdt = sdt;
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public String getHoten() {
        return hoten;
    }

    public String getSdt() {
        return sdt;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    
}
