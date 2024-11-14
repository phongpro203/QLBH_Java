/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author kohakuta
 */

public class SellerSignUp {
    private int id;
    private String tenshop;
    private String tenchushop;
    private String sdt;
    private String masothue;
    private int address_id;
    private int user_id;

    public SellerSignUp() {
    } 

    public SellerSignUp(int id, String tenshop, String tenchushop, String sdt, String masothue, int address_id, int user_id) {
        this.id = id;
        this.tenshop = tenshop;
        this.tenchushop = tenchushop;
        this.sdt = sdt;
        this.masothue = masothue;
        this.address_id = address_id;
        this.user_id = user_id;
    }
    
    // Getters và setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTenshop() { return tenshop; }
    public void setTenshop(String tenshop) { this.tenshop = tenshop; }

    public String getTenchushop() { return tenchushop; }
    public void setTenchushop(String tenchushop) { this.tenchushop = tenchushop; }

    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }

    public String getMasothue() { return masothue; }
    public void setMasothue(String masothue) { this.masothue = masothue; }

    public int getAddress_id() { return address_id; }
    public void setAddress_id(int address_id) { this.address_id = address_id; }

    public int getUser_id() { return user_id; }
    public void setUser_id(int user_id) { this.user_id = user_id; }
}
