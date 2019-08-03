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
        <title>添加购买细节信息</title>
        <link rel="stylesheet" href="../../mycss.css">
    </head>
    <body style="text-align:center; background-color: aqua">
        <% 
             request.setCharacterEncoding("UTF-8");
             Class.forName("com.mysql.jdbc.Driver");//加载驱动
             String uri="jdbc:mysql://47.103.23.44:3306/psms";//地址+端口号，数据库名字
             String user="root";//登录名
             String password="111111";//登陆密码
             Connection con=DriverManager.getConnection(uri,user,password);
             Statement stat=con.createStatement();
             int dno=Integer.parseInt(request.getParameter("dno"));
             int pno=Integer.parseInt(request.getParameter("pno"));
             int pay_c=Integer.parseInt(request.getParameter("pay_c"));           
             String sql="SELECT PNO FROM Product WHERE PNO="+pno;
             ResultSet rs=stat.executeQuery(sql);
             if(rs.next()==true)
             {
                 String sql2="SELECT INVEN FROM Product WHERE PNO="+pno;
                 ResultSet rs2=stat.executeQuery(sql2);
                 if(rs2.next()==true)
                 {
                     int c=rs2.getInt("INVEN");
                     int n=c-pay_c;
                     if(n>=0)
                     {
                         String sql1="INSERT INTO Details(DNO,PNO,PAY_C) VALUES ("+dno+","+pno+","+pay_c+")";
                         stat.executeUpdate(sql1);
                         String sql3="UPDATE Product SET INVEN="+n+" WHERE PNO="+pno;
                         stat.executeUpdate(sql3);
                     }
                     else
                     {
                         out.print("<script>alert('该产品库存不够！请重新填写。');window.location.href='details.jsp'</script>");
                     }
                 }      
             }
             else
             {
                 out.print("<script>alert('该产品号不存在！请重新填写。');window.location.href='details.jsp'</script>");
             } 
             stat.close();
             con.close();
             out.print("<script>alert('添加成功。');window.location.href='../../HP.html'</script>");
                 //response.sendRedirect("../../index.html");       
        %>
        
    </body>
</html>
