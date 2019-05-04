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
        <title>添加产品信息</title>
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
             int pno=Integer.parseInt(request.getParameter("pno"));
             String pname=request.getParameter("pname");
             int fno=Integer.parseInt(request.getParameter("fno"));
             String spec=request.getParameter("spec");
             float per_p=Float.parseFloat(request.getParameter("per_p"));
             int inven=Integer.parseInt(request.getParameter("inven"));
             String sql1="SELECT PNO FROM Product WHERE PNO="+pno;
             ResultSet rs=stat.executeQuery(sql1);
             if(rs.next()==false)
             {
                 String sql2="SELECT PNAME FROM Product WHERE PNAME='"+pname+"'";
                 ResultSet rs1=stat.executeQuery(sql2);
                 if(rs1.next()==false)
                 {
                     String sql="INSERT INTO Product(PNO,PNAME,FNO,SPEC,PER_P,INVEN) VALUES ("+pno+",'"+pname+"',"+fno+",'"+spec+"',"+per_p+","+inven+")";
                     stat.executeUpdate(sql);
                     stat.close();
                     con.close();
                     out.print("<script>alert('添加成功。');window.location.href='../../HP.html'</script>");
                     //response.sendRedirect("../../index.html");
                 }
                 out.print("<script>alert('该产品已存在！请重新填写。');window.location.href='product.jsp'</script>");
             }           
             out.print("<script>alert('该产品编号已存在！请重新填写。');window.location.href='product.jsp'</script>");
        %>
        
    </body>
</html>
