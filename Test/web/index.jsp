<%-- 
    Document   : login
    Created on : 2019-4-25, 10:14:12
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
     <title>登录</title>
     <meta http-equiv="content-type" content="text/html; charset=UTF-8">
     <meta http-equiv="Content-Language" content="ch-cn">
     <script type="text/javascript">
      <!-- javaScript 函数 validateLogin(),用来验证用户名和密码是否为空 -->
     function validateLogin()
     {
        var sUserName = document.frmLogin.txtUserName.value;
      var sPassword = document.frmLogin.txtPassword.value;
      if( sUserName==""||sPassword=="" )
      {
       alert("用户名或密码不能为空！");
       return false;
      }
        if (sUserName.length()>20 ){
        alert("用户名不能超过20个字符！");
        return false;
     }     
     if (sPassword.length()>32 ){
        alert("密码不能超过32位！");
        return false; }   
     }
    </script>
    <script type="text/javascript">
	    //用于刷新验证码
        function myReload(){   
            document.getElementById("imageMask").src=document.getElementById("imageMask").src+"?nocache="+new Date().getTime();  }  
    </script>          
    <link rel="stylesheet" href="mycss.css">
   </head>
   <body id="body" >
   <!-- Form 用来提取用户填入并提交的信息-->
   <form method="post"  name="frmLogin" action="dologin.jsp">
            <div align="center">
                <table>
                    <caption>用户登录</caption>
                    <tr>     
                        <td> 用户名:</td>
                        <td><input type="text" name="txtUserName" value=""
                         onfocus="" maxlength=20 required="required"></td>
                        <td></td>
                    </tr>
                    <tr>                     
                        <td>密码：</td>
                        <td><input type="password" name="txtPassword" value=""
                         onfocus="" maxlength=32 required="required"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>验证码：</td>
                        <td><input type="text" name="imageMask" ></td>
                        <td><img border=0 src="ImageMaskServlet" width="50" height="30" id="imageMask" name="imageMask">
                         <a href = "#" style = "font-size: 13px;margin-left: 5px;" onclick = "myReload()">看不清换一张</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="确 定" onclick="validateLogin()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置"><br /></td>
                        <td></td>
                    </tr>
                </table>                    
            </div>
        </form>

    </body>
</html>
