<%-- 
    Document   : cust_add
    Created on : 2019-4-21, 10:44:52
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加用户信息</title>
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
             int cno=Integer.parseInt(request.getParameter("cno"));
             String cname=request.getParameter("cname");
             String addr=request.getParameter("addr");
             String tel=request.getParameter("tel");
             String credit=request.getParameter("credit");
             float impay=Float.parseFloat(request.getParameter("impay"));
             String sql1="SELECT CNO FROM Cust WHERE CNO="+cno;
             ResultSet rs=stat.executeQuery(sql1);
             if(rs.next()==false)
             {
                 String sql2="SELECT CNAME FROM Cust WHERE CNAME='"+cname+"'";
                 ResultSet rs1=stat.executeQuery(sql2);
                 if(rs1.next()==false)
                 {
                     String sql="INSERT INTO Cust(CNO,CNAME,ADDR,TEL,CREDIT,IMPAY) VALUES ("+cno+",'"+cname+"','"+addr+"','"+tel+"','"+credit+"',"+impay+")";
                     stat.executeUpdate(sql);
                     stat.close();
                     con.close();
                     out.print("<script>alert('添加成功。');window.location.href='../../HP.html'</script>");
                     //response.sendRedirect("../../index.html");
                  }
                  out.print("<script>alert('该客户已存在！请重新填写。');window.location.href='customer.jsp'</script>");
             }
             out.print("<script>alert('该客户号已存在！请重新填写。');window.location.href='customer.jsp'</script>");
        %>
        
    </body>
</html>
