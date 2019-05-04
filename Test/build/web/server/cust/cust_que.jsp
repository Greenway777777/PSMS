<%-- 
    Document   : cust_add
    Created on : 2019-4-21, 10:44:52
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="khb.Kh" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查询用户信息</title>
        <link rel="stylesheet" href="../../mycss.css">
    </head>
    <body>
        <% 
             request.setCharacterEncoding("UTF-8");
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//加载驱动
             String uri="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Product_sales_MS";//地址+端口号，数据库名字
             String user="sa";//登录名
             String password="123456";//登陆密码
             Connection con=DriverManager.getConnection(uri,user,password);
             Statement stat=con.createStatement();
             int cno=Integer.parseInt(request.getParameter("cno2"));
             String sql="SELECT * FROM Cust WHERE CNO="+cno;
             ResultSet rs=stat.executeQuery(sql);
             ArrayList khs=new ArrayList();
             while(rs.next())
             {
                  Kh kh=new Kh();
                  kh.setCno(rs.getInt("CNO"));
                  kh.setCname(rs.getString("CNAME"));
                  kh.setAddr(rs.getString("ADDR"));
                  kh.setTel(rs.getString("TEL"));
                  kh.setCredit(rs.getString("CREDIT"));
                  kh.setImpay(rs.getFloat("IMPAY"));
                  khs.add(kh);
             }
             if(khs.size()<=0)
             {
                 out.print("<script>alert('该客户号不存在！请重新填写。');window.location.href='customer.jsp'</script>");
             }
            stat.close();
            con.close();
        %>
        <table  align="center" valign="center" border="2">
            <tr>
                <td>客户号</td>
                <td>姓名</td>
                <td>地址</td>
                <td>电话</td>
                <td>信用情况</td>
                <td>预付款</td>
            </tr>
            <%
             for(int i=0;i<khs.size();i++)
             {
                 Kh kh=(Kh)khs.get(i);
            %>
            <tr>
                <td><%=kh.getCno()%></td>
                <td><%=kh.getCname()%></td>
                <td><%=kh.getAddr()%></td>
                <td><%=kh.getTel()%></td>
                <td><%=kh.getCredit()%></td>
                <td><%=kh.getImpay()%></td>
            </tr>
            <%
               }
            %>
        </table>
    </body>
</html>
