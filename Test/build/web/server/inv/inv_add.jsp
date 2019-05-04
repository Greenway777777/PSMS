<%-- 
    Document   : cust_add
    Created on : 2019-4-21, 10:44:52
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Date"  %>
<%@ page import="d_s.Date_str"  %>
<%@ page import="fpb.Fp"  %>
<%@ page import="java.text.ParseException"  %>
<%@ page import="java.text.SimpleDateFormat"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加发票信息</title>
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
             int ino=Integer.parseInt(request.getParameter("ino"));
             String cname=request.getParameter("cname");
             String pay_d=request.getParameter("pay_d");
             float pay=Float.parseFloat(request.getParameter("pay"));
             int dno=Integer.parseInt(request.getParameter("dno"));
             String sql1="SELECT INO FROM Invoice WHERE INO="+ino;
             ResultSet rs=stat.executeQuery(sql1);
             if(rs.next()==false)
             {
                 String sql11="SELECT CNAME FROM Cust WHERE CNAME='"+cname+"'";
                 ResultSet rs11=stat.executeQuery(sql11);
                 if(rs11.next()==false)
                 {
                     out.print("<script>alert('该客户不存在！请重新填写。');window.location.href='invoice.jsp'</script>");
                  }
                 String sqll="SELECT DNO FROM Invoice WHERE DNO="+dno;
                 ResultSet rsl=stat.executeQuery(sqll);
                 if(rsl.next()==true)
                 {
                     out.print("<script>alert('该购买细节不属于您！请重新填写。');window.location.href='invoice.jsp'</script>");
                 }
                 else
                 {
                     String sql="INSERT INTO Invoice(INO,CNAME,PAY_D,PAY,DNO) VALUES ("+ino+",'"+cname+"','"+pay_d+"',"+pay+","+dno+")";
                     stat.executeUpdate(sql);
                 }   
                 stat.close();
                 con.close();
                 out.print("<script>alert('添加成功。');window.location.href='../../HP.html'</script>");
                 //response.sendRedirect("../../index.html");
             }  
             out.print("<script>alert('该发票号已存在！请重新填写。');window.location.href='invoice.jsp'</script>");
        %>
        
    </body>
</html>
