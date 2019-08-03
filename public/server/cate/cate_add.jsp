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
        <title>添加分类信息</title>
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
             int fno=Integer.parseInt(request.getParameter("fno"));
             String fname=request.getParameter("fname");
             String category_f=request.getParameter("category_f");
             String sql1="SELECT FNO FROM Category WHERE FNO="+fno;
             ResultSet rs=stat.executeQuery(sql1);
             if(rs.next()==false)
             {
                 String sql2="SELECT FNAME FROM Category WHERE FNAME='"+fname+"'";
                 ResultSet rs1=stat.executeQuery(sql2);
                 if(rs1.next()==false)
                 {
                     String sql="INSERT INTO Category(FNO,FNAME,CATEGORY_F) VALUES ("+fno+",'"+fname+"','"+category_f+"')";
                     stat.executeUpdate(sql);
                     stat.close();
                     con.close();
                     out.print("<script>alert('添加成功。');window.location.href='../../HP.html'</script>");
                     //response.sendRedirect("../../index.html");
                 }  
                 out.print("<script>alert('该类别已存在！请重新填写。');window.location.href='category.jsp'</script>");
             }
             
             out.print("<script>alert('该分类编号已存在！请重新填写。');window.location.href='category.jsp'</script>");
        %>
        
    </body>
</html>
