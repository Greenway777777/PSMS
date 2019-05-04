<%-- 
    Document   : cust_add
    Created on : 2019-4-21, 10:44:52
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="gmb.Gm" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>统计购买细节信息</title>
        <link rel="stylesheet" href="../../mycss.css">
    </head>
    <body style="text-align:center; background-color: aqua">
        <% 
             request.setCharacterEncoding("UTF-8");
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//加载驱动
             String uri="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Product_sales_MS";//地址+端口号，数据库名字
             String user="sa";//登录名
             String password="123456";//登陆密码
             Connection con=DriverManager.getConnection(uri,user,password);
             Statement stat=con.createStatement();
             int dno=Integer.parseInt(request.getParameter("dno3"));
             String sql="SELECT PNO,SUM(PAY_C) S FROM Details WHERE DNO IN (SELECT DNO FROM Details WHERE DNO="+dno+")GROUP BY PNO";
             ResultSet rs=stat.executeQuery(sql);
             ArrayList gms=new ArrayList();
             int sum=0;
             while(rs.next())
             {
                  Gm gm=new Gm();
                  gm.setDno(dno);
                  gm.setPno(rs.getInt("PNO"));
                  gm.setPay_c(rs.getInt("S"));
                  gms.add(gm);
             }
            stat.close();
            con.close();
        %>
        <table align="center" valign="center" border="2">
            <tr>
                <td>序号</td>
                <td>产品号</td>
                <td>购买数量</td>
            </tr>
            <%
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
                  sum=sum+gm.getPay_c();
               }
            %>
            <tr>
                <td></td>
                <td></td>
                <td>购买总量为<%=sum%></td>
            </tr>
        </table>
    </body>
</html>
