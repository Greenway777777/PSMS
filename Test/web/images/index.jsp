<%-- 
    Document   : index
    Created on : 2019-4-28, 8:38:39
    Author     : Administrator
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>

  <body>
    <form action="LoginServlet" method="post" id="myform">
        <table align="center">
            <tr>
                <td>用户名：</td>
                <td><input type="text" name="name" title="用户名"/></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" name="pwd" title="密码" /></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>
                    <input type="radio" name="sex" value="男" title="性别"/>男
                    <input type="radio" name="sex" value="女" title="性别"/>女
                </td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><input type="text" name="age" title="年龄" /></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" title="Email" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="注 册" onclick="check()"/>
                    <input type="reset" value="重 置" />
                </td>
            </tr>
        </table>
    </form>
  </body>
  <script type="text/javascript">
  // 检查表单元素的值是否为空
    function check(){
        var myform = document.getElementById("myform");
        for(var i=0; i<myform.length; i++ ){
            if(myform.elements[i].value == ""){
                alert(myform.elements[i].title + "不能为空");
                myform.elements[i].focus();
                return;
            }
        }
    myform.submit();    // 表单中最后input提交标签用的是button类型，首先不提交表单，在js判断表单项都不为空时 再提交表单。
    }
  </script>
</html>

