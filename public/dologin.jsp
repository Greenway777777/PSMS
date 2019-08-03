<%-- 
    Document   : dologin
    Created on : 2019-4-25, 9:45:45
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
   <title>登录确认</title>
   <meta http-equiv="keywords" content="jsp,登陆">
<!--
<link rel="stylesheet" type="text/css" href="styles.css">
-->
</head>
    <body>
       <div align="center">
       <%
             request.setCharacterEncoding("UTF-8");
             //获取用户名
             String strUserName = request.getParameter("txtUserName");
             //获取密码
             String strPassword = request.getParameter("txtPassword");
             
             Class.forName("com.mysql.jdbc.Driver");//加载驱动
             String uri="jdbc:mysql://47.103.23.44:3306/psms";//地址+端口号，数据库名字
             String user="root";//登录名
             String password="111111";//登陆密码
             Connection con=DriverManager.getConnection(uri,user,password);
             Statement stat=con.createStatement(); 
            
            String clientCheckcode = request.getParameter("imageMask");//接收客户端浏览器提交上来的验证码
            String serverCheckcode = (String) request.getSession().getAttribute("imageMask");//从服务器端的session中取出验证码
            if (clientCheckcode.equals(serverCheckcode))
            {//将客户端验证码和服务器端验证比较，如果相等，则表示验证通过
             //System.out.println("验证码验证通过！");
              String sql = "SELECT * FROM Users WHERE USERNAME='" + strUserName
              + "' AND USERPASSWORD = '" + strPassword + "'";
              ResultSet rs = stat.executeQuery(sql); //返回查询结果
              //如果记录集非空，表明有匹配的用户名和密码，登陆成功
              if (rs.next())
              {
                request.getRequestDispatcher("HP.html").forward(request, response);
                //response.sendRedirect("HP.html");
              } else
              //否则登录失败
              {
                 out.print ( "<script>alert('用户名不存在或者密码错误！');window.location.href='index.jsp'</script>" );
              }
              rs.close ( );
              stat.close ( );
              con.close ( );
        }
       else 
     {
            out.print("<script>alert('验证码错误！');window.location.href='index.jsp'</script>");
        }
        //SQL语句
        
       %>
       </div>
    </body>
</html>

