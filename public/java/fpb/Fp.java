/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fpb;
import java.util.Date;
/**
 *
 * @author Greenaway
 */
public class Fp {
    private int ino;
    private String cname;
    private Date pay_d;
    private float pay;
    private int dno;
    
    public int getIno()
    {
        return ino;
    }
    public void setIno(int ino)
    {
        this.ino=ino;
    }
    
    public String getCname()
    {
        return cname;
    }
    public void setCname(String cname)
    {
        this.cname=cname;
    }
    
    public Date getPay_d()
    {
        return pay_d;
    }
    public void setPay_d(Date pay_d)
    {
        this.pay_d=pay_d;
    }
    
    public float getPay()
    {
        return pay;
    }
    public void setPay(float pay)
    {
        this.pay=pay;
    }
    
    public int getDno()
    {
        return dno;
    }
    public void setDno(int dno)
    {
        this.dno=dno;
    }
    
    
}
