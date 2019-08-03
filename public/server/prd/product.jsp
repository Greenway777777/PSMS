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
        <title>产品管理</title>
        <link rel="stylesheet" href="../../mycss.css">
   </head>
    <body>
        <button onmousemove="color='red'" style="position: absolute;left: 1%" onclick="window.location.href='../../HP.html'">返回主界面</button>
        <form style="position: absolute;width: 300px;height: 150px;left: 40%;top: 10%" action="prd_add.jsp" method="post" id="myform">
            <fieldset>
                <legend>添加</legend>
            <table align="center" valign="center">
                <tr>
                    <td>产品编码：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pno"></td>
                </tr>
                <tr>
                    <td>产品名称：</td>
                    <td><input type="text" name="pname"></td>
                </tr>
                <tr>
                    <td>类别编号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="fno"></td>
                </tr>
                <tr>
                    <td>规格：</td>
                    <td><input type="text" name="spec"></td>
                </tr>
                <tr>
                    <td>单价：</td>
                    <td><input onkeyup="clearNoNum(this)" type="text" name="per_p"></td>
                </tr>
                <tr>
                    <td>库存数量：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="inven"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="提 交" onclick="check()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" /></td>
                </tr>
            </table>   
            </fieldset>
        </form>
        <form style="position: absolute;width: 300px;height: 150px;left: 40%;top: 44%" action="" method="post" id="myform2">
             <fieldset>
             <legend>查询 删除</legend>
            <table align="center" valign="center">
                <tr>
                    <td>产品编号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pno2"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="删 除" onclick="myform2.action='prd_del.jsp';check2()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="查 询" onclick="myform2.action='prd_que.jsp';check2()"/></td>
                </tr>
            </table>   
             </fieldset>
        </form>
        <form style="position: absolute;width: 300px;height: 150px;left: 40%;top: 58%" action="prd_mod.jsp" method="post" id="myform3">
            <fieldset>
                <legend>添加</legend>
            <table align="center" valign="center">
                <tr>
                    <td>产品编码：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="pno3"></td>
                </tr>
                <tr>
                    <td>产品名称：</td>
                    <td><input type="text" name="pname3"></td>
                </tr>
                <tr>
                    <td>类别编号：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="fno3"></td>
                </tr>
                <tr>
                    <td>规格：</td>
                    <td><input type="text" name="spec3"></td>
                </tr>
                <tr>
                    <td>单价：</td>
                    <td><input onkeyup="clearNoNum(this)" type="text" name="per_p3"></td>
                </tr>
                <tr>
                    <td>库存数量：</td>
                    <td><input onkeyup="this.value=this.value.replace(/\D/g,'')" type="text" name="inven3"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" value="修 改" onclick="check3()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" /></td>
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
