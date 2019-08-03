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
             Class.forName("com.mysql.jdbc.Driver");//加载驱动
             String uri="jdbc:mysql://47.103.23.44:3306/psms";//地址+端口号，数据库名字
             String user="root";//登录名
             String password="111111";//登陆密码
             Connection con=DriverManager.getConnection(uri,user,password);
             Statement stat=con.createStatement();
             int ino=Integer.parseInt(request.getParameter("ino3"));
             String cname=request.getParameter("cname3");
             String pay_d=request.getParameter("pay_d");
             float pay=Float.parseFloat(request.getParameter("pay3"));
             int dno=Integer.parseInt(request.getParameter("dno3"));
             String sql="SELECT INO FROM Invoice WHERE INO="+ino;
             ResultSet rs=stat.executeQuery(sql);
             if(rs.next()==false)
             {
                 out.print("<script>alert('该发票号不存在！请重新填写。');window.location.href='invoice.jsp'</script>");
             }
             String sql11="SELECT CNAME FROM Cust WHERE CNAME='"+cname+"'";
             ResultSet rs11=stat.executeQuery(sql11);
             if(rs11.next()==false)
             {
                 out.print("<script>alert('该客户不存在！请重新填写。');window.location.href='invoice.jsp'</script>");
             }
             String sqll="SELECT DNO FROM Details WHERE DNO="+dno;
             ResultSet rsl=stat.executeQuery(sqll);
             if(rsl.next()==false)
             {
                 out.print("<script>alert('该购买细节不存在！请重新填写。');window.location.href='invoice.jsp'</script>");
             }
             else
             {
                 String sql1="UPDATE Invoice SET CNAME='"+cname+"' WHERE INO="+ino;
                 String sql2="UPDATE Invoice SET PAY_D='"+pay_d+"' WHERE INO="+ino;
                 String sql3="UPDATE Invoice SET PAY="+pay+" WHERE INO="+ino;
                 String sql4="UPDATE Invoice SET DNO="+dno+" WHERE INO="+ino;
                 stat.executeUpdate(sql1);
                 stat.executeUpdate(sql2);
                 stat.executeUpdate(sql3);
                 stat.executeUpdate(sql4);
             }   
             stat.close();
             con.close();
             out.print("<script>alert('修改成功。');window.location.href='../../HP.html'</script>");
             //response.sendRedirect("../../index.html");    
        %>
        
    </body>
</html>
