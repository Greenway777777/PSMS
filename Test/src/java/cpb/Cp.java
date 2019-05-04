/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cpb;

/**
 *
 * @author Greenaway
 */
public class Cp {
    private int pno;
    private String pname;
    private int fno;
    private String spec;
    private float per_p;
    private int inven;
    
    public int getPno()
    {
        return pno;
    }
    public void setPno(int pno)
    {
        this.pno=pno;
    }
    
    public String getPname()
    {
        return pname;
    }
    public void setPname(String pname)
    {
        this.pname=pname;
    }
    
    public int getFno()
    {
        return fno;
    }
    public void setFno(int fno)
    {
        this.fno=fno;
    }
    
    public String getSpec()
    {
        return spec;
    }
    public void setSpec(String spec)
    {
        this.spec=spec;
    }
    
    public float getPer_p()
    {
        return per_p;
    }
    public void setPer_p(float per_p)
    {
        this.per_p=per_p;
    }
    
    public int getInven()
    {
        return inven;
    }
    public void setInven(int inven)
    {
        this.inven=inven;
    }
    
}
