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
        <title>删除产品信息</title>
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
             int pno=Integer.parseInt(request.getParameter("pno2"));
             String sql1="SELECT PNO FROM Product WHERE PNO="+pno;
             ResultSet rs=stat.executeQuery(sql1);
             if(rs.next()==false)
             {
                  out.print("<script>alert('该产品编号不存在！请重新填写。');window.location.href='product.jsp'</script>");
             }            
             String sql="DELETE FROM Product WHERE PNO="+pno;
             stat.executeUpdate(sql);
             out.print("<script>alert('删除成功。');window.location.href='../../HP.html'</script>"); 
             stat.close();
             con.close(); 
        %>
    </body>
</html>
