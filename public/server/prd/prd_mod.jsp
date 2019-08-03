<%-- 
    Document   : prd_mod
    Created on : 2019-5-11, 16:36:34
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.Date"  %>
<%@ page import="cpb.Cp"  %>
<%@ page import="java.text.ParseException"  %>
<%@ page import="java.text.SimpleDateFormat"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改产品信息</title>
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
             int pno=Integer.parseInt(request.getParameter("pno3"));
             String pname=request.getParameter("pname3");
             int fno=Integer.parseInt(request.getParameter("fno3"));
             String spec=request.getParameter("spec3");
             float per_p=Float.parseFloat(request.getParameter("per_p3"));
             int inven=Integer.parseInt(request.getParameter("inven3"));
            String sql="SELECT PNO FROM Product WHERE PNO="+pno;
             ResultSet rs=stat.executeQuery(sql);
             if(rs.next()==false)
             { 
                 out.print("<script>alert('该产品编码不存在！请重新填写。');window.location.href='product.jsp'</script>");
             }
             String sql11="SELECT * FROM Category WHERE FNO="+fno;
             ResultSet rs11=stat.executeQuery(sql11);
             if(rs11.next()==true)
                 {
                    String sql1="UPDATE Product SET PNAME='"+pname+"' WHERE PNO="+pno;
                    String sql2="UPDATE Product SET FNO='"+fno+"' WHERE PNO="+pno;
                    String sql3="UPDATE Product SET SPEC='"+spec+"' WHERE PNO="+pno;
                    String sql4="UPDATE Product SET PER_P="+per_p+" WHERE PNO="+pno;
                    String sql5="UPDATE Product SET INVEN="+inven+" WHERE PNO="+pno;
                    stat.executeUpdate(sql1);
                    stat.executeUpdate(sql2);
                    stat.executeUpdate(sql3);
                    stat.executeUpdate(sql4);
                    stat.executeUpdate(sql5);
                    stat.close();
                    con.close();
                    out.print("<script>alert('修改成功。');window.location.href='../../HP.html'</script>");
                     //response.sendRedirect("../../index.html");
                 }  
             out.print("<script>alert('该类别编号不存在！请重新填写');window.location.href='product.jsp'</script>");
             %>
        
    </body>
</html>
