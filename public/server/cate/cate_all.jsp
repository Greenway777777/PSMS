<%-- 
    Document   : cust_add
    Created on : 2019-4-21, 10:44:52
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="flb.Fl" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查询分类信息</title>
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
             String sql="SELECT * FROM Category";
             ResultSet rs=stat.executeQuery(sql);
             ArrayList fls=new ArrayList();
             while(rs.next())
             {
                  Fl fl=new Fl();
                  fl.setFno(rs.getInt("FNO"));
                  fl.setFname(rs.getString("FNAME"));
                  fl.setCategory_f(rs.getString("CATEGORY_F"));
                  fls.add(fl);
             }
             if(fls.size()<=0)
             {
                 out.print("<script>alert('类别库为空！请添加后查询。');window.location.href='category.jsp'</script>");
             }
             stat.close();
             con.close();
            
        %>
        <button onmousemove="color='red'" style="position: absolute;left: 1%" onclick="window.location.href='../../HP.html'">返回主界面</button>
        <table  align="center" valign="center" border="2">
            <tr>
                <td>类别编号</td>
                <td>类别名称</td>
                <td>类别特性</td>
            </tr>
            <%
             for(int i=0;i<fls.size();i++)
             {
                 Fl fl=(Fl)fls.get(i);
            %>
            <tr>
                <td><%=fl.getFno()%></td>
                <td><%=fl.getFname()%></td>
                <td><%=fl.getCategory_f()%></td>
            </tr>
            <%
               }
            %>
        </table>
    </body>
</html>
