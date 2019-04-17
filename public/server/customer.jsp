    <%--
        Document   : index
        Created on : 2019-4-11, 8:33:23
        Author     : Administrator
    --%>

        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!DOCTYPE html>
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>登录</title>
        </head>
        <body>
        <form action="login.jsp" method="post">
        <table>
        <tr>
        <td>
        <label for="username">用户名：</label>
        </td>
        <td>
        <input type="text" name="username" id="username">
        </td>
        </tr>
        <tr>
        <td>
        <label for="userpwd">用户密码：</label>
        </td>
        <td>
        <input type="password" name="userpwd" id="userpwd">
        </td>
        </tr>
        </table>
        <input type="submit" name="submit" id="submit" value="登录">
        </form>
        </body>
        </html>
