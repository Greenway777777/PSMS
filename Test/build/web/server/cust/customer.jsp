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
        <title>客户管理</title>
        <link rel="stylesheet" href="../../mycss.css">
   </head>
    <body>
        
        <form action="cust_add.jsp" method="post" id="myform">
            <table align="center" valign="center">
                <tr>
                    <td>客户号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="cno"></td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td><input type="text" name="cname"></td>
                </tr>
                <tr>
                    <td>地址：</td>
                    <td><input type="text" name="addr"></td>
                </tr>
                <tr>
                    <td>电话：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="tel"></td>
                </tr>
                <tr>
                    <td>信用情况：</td>
                    <td> <label for="creit1">优</label>
                     <input id="credit1" type="radio" value="优" name="credit">
                     <label for="creit2">良</label>
                     <input id="credit2" type="radio" value="良" name="credit">
                     <label for="creit3">一般</label>
                     <input id="credit3" type="radio" value="一般" name="credit">
                     <label for="creit3">差</label>
                     <input id="credit3" type="radio" value="差" name="credit"></td>
                </tr>
                <tr>
                    <td>预付款：</td>
                    <td><input onkeyup="clearNoNum(this)" type="text" name="impay"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="提 交" onclick="check()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" /></td>
                </tr>
            </table>     
        </form>
        <hr />
        <form action="" method="post" id="myform2">
            <table align="center" valign="center">
                <tr>
                    <td>客户号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="cno2"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="删 除" onclick="myform2.action='cust_del.jsp';check2()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查 询" onclick="myform2.action='cust_que.jsp';check2()"/></td>
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
    function clearNoNum(obj){ 
    obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符  
    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数  
    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
        obj.value= parseFloat(obj.value); 
    } 
} 
  </script>
</html>
