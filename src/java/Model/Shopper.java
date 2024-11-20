/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author kohakuta
 */
public class Shopper {
    private int id;
    private String hoten;
    private String sdt;
    private int address_id;
    private int user_id;

    public Shopper() {
    }

    public Shopper(int id, String hoten, String sdt, int address_id, int user_id) {
        this.id = id;
        this.hoten = hoten;
        this.sdt = sdt;
        this.address_id = address_id;
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

    public int getAddress_id() {
        return address_id;
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

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    
}
