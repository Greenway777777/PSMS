/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khb;

/**
 *
 * @author Greenaway
 */
public class Kh {
    private int cno;
    private String cname;
    private String addr;
    private String tel;
    private String credit;
    private float impay;
    
    public int getCno()
    {
        return cno;
    }
    public void setCno(int cno)
    {
        this.cno=cno;
    }
    
    public String getCname()
    {
        return cname;
    }
    public void setCname(String cname)
    {
        this.cname=cname;
    }
    
    public String getAddr()
    {
        return addr;
    }
    public void setAddr(String addr)
    {
        this.addr=addr;
    }
    
    public String getTel()
    {
        return tel;
    }
    public void setTel(String tel)
    {
        this.tel=tel;
    }
    
    public String getCredit()
    {
        return credit;
    }
    public void setCredit(String credit)
    {
        this.credit=credit;
    }
    
    public float getImpay()
    {
        return impay;
    }
    public void setImpay(float impay)
    {
        this.impay=impay;
    }
}
