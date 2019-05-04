<%-- 
    Document   : cust_add
    Created on : 2019-4-21, 10:44:52
    Author     : Greenaway
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="cpb.Cp" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查询产品信息</title>
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
             int pno=Integer.parseInt(request.getParameter("pno2"));
             String sql="SELECT * FROM Product WHERE PNO="+pno;
             ResultSet rs=stat.executeQuery(sql);
             ArrayList cps=new ArrayList();
             while(rs.next())
             {
                  Cp cp=new Cp();
                  cp.setPno(rs.getInt("PNO"));
                  cp.setPname(rs.getString("PNAME"));
                  cp.setFno(rs.getInt("FNO"));
                  cp.setSpec(rs.getString("SPEC"));
                  cp.setPer_p(rs.getFloat("PER_P"));
                  cp.setInven(rs.getInt("INVEN"));
                  cps.add(cp);
             }
             if(cps.size()<=0)
             {
                 out.print("<script>alert('该产品号不存在！请重新填写。');window.location.href='product.jsp'</script>");
             }
        %>
        <table  align="center" valign="center" border="2">
            <tr>
                <td>产品编码</td>
                <td>产品名称</td>
                <td>类别编号</td>
                <td>类别名称</td>
                <td>规格</td>
                <td>单价</td>
                <td>库存数量</td>
            </tr>
            <%
             for(int i=0;i<cps.size();i++)
             {
                 Cp cp=(Cp)cps.get(i);
                 int fno=cp.getFno();
                 String sql1="SELECT FNAME FROM Category WHERE FNO="+fno;
                 ResultSet rs1=stat.executeQuery(sql1);
                 String fname="";
                 while(rs1.next())
                 {
                     fname=rs1.getString("FNAME");
                 }            
            %>
            <tr>
                <td><%=cp.getPno()%></td>
                <td><%=cp.getPname()%></td>
                <td><%=cp.getFno()%></td>
                <td><%=fname%></td>
                <td><%=cp.getSpec()%></td>
                <td><%=cp.getPer_p()%></td>
                <td><%=cp.getInven()%></td>
            </tr>
            <%
               }
             stat.close();
             con.close();
            %>
        </table>
    </body>
</html>
