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
        <title>删除用户信息</title>
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
             String sql1="SELECT CNO FROM Cust WHERE CNO="+cno;
             ResultSet rs=stat.executeQuery(sql1);
             if(rs.next()==false)
             {
                  out.print("<script>alert('该客户号不存在！请重新填写。');window.location.href='customer.jsp'</script>");
             }            
             String sql="DELETE FROM Cust WHERE CNO="+cno;
             stat.executeUpdate(sql);
             out.print("<script>alert('删除成功。');window.location.href='../../HP.html'</script>"); 
             stat.close();
             con.close(); 
        %>
    </body>
</html>