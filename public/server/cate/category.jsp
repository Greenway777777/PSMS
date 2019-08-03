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
        <title>类别管理</title>
        <link rel="stylesheet" href="../../mycss.css">
   </head>
   <body>
       <button onmousemove="color='red'" style="position: absolute;left: 1%" onclick="window.location.href='../../HP.html'">返回主界面</button>
        <form style="position: absolute;width: 300px;height: 150px;left: 40%;top: 10%" action="cate_add.jsp" method="post" id="myform">
            <fieldset style="margin: 0 auto;float: none;">
            <legend>添加</legend>
            <table  align="center" valign="center">
                <tr>
                    <td>类别编号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="fno"></td>
                </tr>
                <tr>
                    <td>类别名称：</td>
                    <td><input type="text" name="fname"></td>
                </tr>
                <tr>
                    <td>类别特性：</td>
                    <td><input type="text" name="category_f"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="提 交" onclick="check()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" /></td>
                </tr>
            </table>
            </fieldset>
      
        </form>
        <form style="position: absolute;width: 300px;height: 150px;left: 40%;top: 33%" action="" method="post" id="myform2">
            <fieldset>
            <legend>查询 删除</legend>
            <table align="center" valign="center">
                <tr>
                    <td>类别编号：</td>
                    <td> <input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="fno2"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="删 除" onclick="myform2.action='cate_del.jsp';check2()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查 询" onclick="myform2.action='cate_que.jsp';check2()"/></td>
                </tr>
            </table>  
            </fieldset>
        </form>
        <form style="position: absolute;width: 300px;height: 150px;left: 40%;top: 49%" action="cate_all.jsp" method="post" id="myform3">
            <fieldset>
            <legend>查询全部</legend>
            <table align="center" valign="center">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="查询全部" onclick="myform3.submit();"/></td>
                </tr>
            </table>    
            </fieldset>
        </form>
    </body>
    <script type="text/javascript">
  // 检查表单元素的值是否为空
    function check(){
        var myform = document.getElementById("myform");
        for(var i=0; i<myform.length; i++ ){
            if(myform.elements[i].value == ""){
                alert(myform.elements[i].title + "请填写完整信息!");
                myform.elements[i].focus();
                return;
            }
        }
    myform.submit();    // 表单中最后input提交标签用的是button类型，首先不提交表单，在js判断表单项都不为空时 再提交表单。
    }
    function check2(){
        var myform2 = document.getElementById("myform2");
        for(var i=0; i<myform2.length; i++ ){
            if(myform2.elements[i].value == ""){
                alert(myform2.elements[i].title + "请填写完整信息！");
                myform2.elements[i].focus();
                return;
            }
        }
    myform2.submit();    // 表单中最后input提交标签用的是button类型，首先不提交表单，在js判断表单项都不为空时 再提交表单。
    }
  </script>
</html>
