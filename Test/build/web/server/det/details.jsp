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
        <title>购买细节管理</title>
        <link rel="stylesheet" href="../../mycss.css">
   </head>
    <body style="text-align:center; background-color: aqua">
        
        <form action="det_add.jsp" method="post" id="myform">
            <table align="center" valign="center">
                <tr>
                    <td>序号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="dno"></td>
                </tr>
                <tr>
                    <td>产品号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pno"></td>
                </tr>
                <tr>
                    <td> 购买数量：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pay_c"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" value="提 交" onclick="check()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" />
                    </td>
                </tr>
            </table>     
        </form>
        <hr />
        <form action="" method="post" id="myform2">
            <table align="center" valign="center">
                <tr>
                    <td>序号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="dno2"></br></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="删 除" onclick="myform2.action='det_del.jsp';check2()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查 询" onclick="myform2.action='det_que.jsp';check2()"/></td>
                </tr>
            </table>          
        </form>
        <hr />
        <form action="det_sum.jsp" method="post" id="myform3">
            <table align="center" valign="center">
                <tr>
                    <td>序号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="dno3"></br></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="统 计" onclick="check3()"/></td>
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
    function check3(){
        var myform3 = document.getElementById("myform3");
        for(var i=0; i<myform3.length; i++ ){
            if(myform3.elements[i].value == ""){
                alert(myform3.elements[i].title + "请填写完整信息！");
                myform3.elements[i].focus();
                return;
            }
        }
    myform3.submit();    // 表单中最后input提交标签用的是button类型，首先不提交表单，在js判断表单项都不为空时 再提交表单。
    }
  </script>
</html>
