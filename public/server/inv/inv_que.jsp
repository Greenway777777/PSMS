<%-- 
    Document   : cust_add
    Created on : 2019-4-21, 10:44:52
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fpb.Fp"  %>
<%@ page import="gmb.Gm" %>
<%@ page import="d_s.Date_str"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查询产品信息</title>
        <link rel="stylesheet" href="../../mycss.css">
    </head>
    <body>
        <% 
             request.setCharacterEncoding("UTF-8");
             Class.forName("com.mysql.jdbc.Driver");//加载驱动
             String uri="jdbc:mysql://47.103.23.44:3306/psms";//地址+端口号，数据库名字
             String user="root";//登录名
             String password="111111";//登陆密码
             Connection con=DriverManager.getConnection(uri,user,password);
             Statement stat=con.createStatement();
             int ino=Integer.parseInt(request.getParameter("ino2"));
             String sql="SELECT * FROM Invoice WHERE INO="+ino;
             ResultSet rs=stat.executeQuery(sql);
             ArrayList fps=new ArrayList();
             while(rs.next())
             {
                  Fp fp=new Fp();
                  fp.setIno(rs.getInt("INO"));
                  fp.setCname(rs.getString("CNAME"));
                  fp.setPay_d(rs.getDate("PAY_D"));
                  fp.setPay(rs.getFloat("PAY"));
                  fp.setDno(rs.getInt("DNO"));
                  fps.add(fp);
             }
            if(fps.size()<=0)
             {
                 out.print("<script>alert('该发票号不存在！请重新填写。');window.location.href='invoice.jsp'</script>");
             }
        %>
        <button onmousemove="color='red'" style="position: absolute;left: 1%" onclick="window.location.href='../../HP.html'">返回主界面</button>
        <table  align="center" valign="center" border="2">
            <tr>
                <td>发票号</td>
                <td>客户名称</td>
                <td>购买日期</td>
                <td>付款金额</td>
                <td>购买细节</td>
            </tr>
            <%
             for(int i=0;i<fps.size();i++)
             {
                 Fp fp=(Fp)fps.get(i);
            %>
            <tr>
                <td><%=fp.getIno()%></td>
                <td><%=fp.getCname()%></td>
                <td><%=fp.getPay_d()%></td>
                <td><%=fp.getPay()%></td>
                <td><%=fp.getDno()%></td>
            </tr>
            <%
               }
            %>
        </table>
        <br>
        <br>
        <br>
        <table align="center" valign="center" border="2">
            <caption>细节信息</caption>
            <tr>
                <td>序号</td>
                <td>产品号</td>
                <td>购买数量</td>
            </tr>
            <%
                String sql1="SELECT DNO FROM Invoice WHERE INO="+ino;
                ResultSet rs1=stat.executeQuery(sql1);
                int dno=0;
                while(rs1.next())
                {
                    dno=rs1.getInt("DNO");
                }  
                String sql2="SELECT * FROM Details WHERE DNO="+dno;
                ResultSet rs2=stat.executeQuery(sql2);
                ArrayList gms=new ArrayList();
                while(rs2.next())
                {
                     Gm gm=new Gm();
                     gm.setDno(rs2.getInt("DNO"));
                     gm.setPno(rs2.getInt("PNO"));
                     gm.setPay_c(rs2.getInt("PAY_C"));
                     gms.add(gm);
                }
                for(int i=0;i<gms.size();i++)
                {
                    Gm gm=(Gm)gms.get(i);
            %>
            <tr>
                <td><%=gm.getDno()%></td>
                <td><%=gm.getPno()%></td>
                <td><%=gm.getPay_c()%></td>
            </tr>
            <%
               } 
            stat.close();
            con.close();
            %>
        </table>
    </body>
</html>
