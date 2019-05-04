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
        <title>发票管理</title>
        <link rel="stylesheet" href="../../mycss.css">
   </head>
    <body>
         <form action="inv_add.jsp" method="post" id="myform">
            <table align="center" valign="center">
                <tr>
                    <td>发票号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="ino" ></td>
                </tr>
                <tr>
                    <td>客户名称：</td>
                    <td><input type="text" name="cname"></td>
                </tr>
                <tr>
                    <td>购买日期：</td>
                    <td>
                        <input type="date" name="pay_d" size="1"></td>
                </tr>
                <tr>
                    <td>付款金额：</td>
                    <td><input onkeyup="clearNoNum(this)" type="text" name="pay"></td>
                </tr>
                <tr>
                    <td>购买细节：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="dno"></td>
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
                    <td>发票号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="ino2"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="删 除" onclick="myform2.action='inv_del.jsp';check2()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查 询" onclick="myform2.action='inv_que.jsp';check2()"/></td>
                </tr>
            </table>
        </form>
        <hr />
        <form action="inv_mod.jsp" method="post" id="myform3">
            <table align="center" valign="center">
                <tr>
                    <td>需要修改的发票号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="ino3"></td>
                </tr>
                <tr>
                    <td>客户名称：</td>
                    <td><input type="text" name="cname3"></td>
                </tr>
                <tr>
                    <td>购买日期：</td>
                    <td>
                        <input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pay_y3" size="1">年
                        <input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pay_m3" size="1">月
                        <input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pay_d3" size="1">日</td>
                </tr>
                <tr>
                    <td>付款金额：</td>
                    <td><input onkeyup="clearNoNum(this)" type="text" name="pay3"></td>
                </tr>
                <tr>
                    <td>购买细节：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="dno3"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="修 改" onclick="check3()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" /></td>
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
