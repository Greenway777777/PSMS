<%-- 
    Document   : test
    Created on : 2019-4-20, 18:02:38
    Author     : Greenaway
--%>


<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<HTML><BODY bgcolor=cyan>
 <% Connection con;
    Statement sql; 
    ResultSet rs;
    try {  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//加载驱动
         out.println("加载驱动成功！");
         try{ String uri="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Product_sales_MS";//地址+端口号，数据库名字
			  String user="sa";//登录名
			  String password="123456";//登陆密码
			  con=DriverManager.getConnection(uri,user,password);
			  out.println("连接数据库成功！");
            }
		catch(SQLException e){
		      out.print("SQL Server连接失败！");}         
        }
    catch(Exception e){
  	     out.println("加载驱动失败！");}   
 %>
</BODY></HTML>