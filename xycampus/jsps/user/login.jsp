<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
	<base target="body">
    <title>登录</title>
    <style type="text/css">
        #box{
                width:650px;
                 height:500px;
                 margin: auto;
                 position: relative;
                 background-image: url("<c:url value='/images/05.jpg'/>");
                 background-repeat: no-repeat;
                 background-position:top;
                 color:white;
               	box-shadow: 5px 5px 12px #000000;
        }
    </style>
    <script type="text/javascript">

  	//去除用户名前后的空格
    function trim(s){
        return s.replace(/^\s+|\s+$/g,"");
    }
    //更改验证码图片
    function _change(){
	  		var vCode = document.getElementById("vCode");
	  		vCode.src="<c:url value='/LoginVerifyServlet'></c:url>?"+new Date().getTime();
	 }
    //获取XMLHttpRequest对象
    function createXMLHttpRequest(){
		try {
			return new XMLHttpRequest();
		} catch (e) {
			try {
				return new ActiveXObject("MAXml2.XMLHTTP");
			} catch (e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					alert("Your browser does not support XMLHTTP");
					throw e;
				}
			}
		}
	}
	//js脚本代码:
    window.onload = function(){
		//通过ID或名字获取每个对象
        var vcodeObj=document.getElementById("verifyCode");
        var numberObj = document.getElementById("number");
        var passwordObj = document.getElementById("password");
		//设置每个对象的onblur事件(对象失去焦点时发生),并调用各自的方法
        vcodeObj.onblur = checkVcode;
        numberObj.onblur = checkNumber;
        passwordObj.onblur = checkPassword;
      //获取表单对象,并且为表单提交事件写个方法
        var form = document.getElementById("form");
        form.onsubmit = function(){
           	var bVcode= checkVcode();
            var bNumber = checkNumber();
            var bPassword = checkPassword();
			//如果,每个上面的每个对象,验证成功,则还回true
           return (bVcode && bNumber &&bPassword);
         };
        //验证密码
        function checkPassword(){
            var passwordValue = trim(passwordObj.value);
            var msg =""; 
            if (!passwordValue){
            	msg = "<font color='red'>密码必须填写!</font>";
            }
            var span = document.getElementById("passwordSpan");
            span.innerHTML = msg;
            return ( msg == "");
        }
        //验证学号
        function checkNumber(){
            var numberValue = trim(numberObj.value);
            var msg =""; 
            if (!numberValue){
            	msg = "<font color='red'>学号必须填写!</font>";
            }
            var span = document.getElementById("numberSpan");
            span.innerHTML = msg;
            return ( msg == "");
        }
        //校验验证码
        function checkVcode(){
			var vcodeValue = trim(vcodeObj.value);
			var xmlHttp = createXMLHttpRequest();
			var span = document.getElementById("vCodeSpan");
			var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>"; //不懂?
			var text="";
			if (!vcodeValue){
				msg = "<font color='red'>验证码必须填写!</font>";
				span.innerHTML = msg;
			}
			xmlHttp.onreadystatechange = function(){
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
	   				text = xmlHttp.responseText;
	   				if(text == "1"){
					  	msg = "<font color='red'>验证码错误</font>";
					  	span.innerHTML = msg;
				  	}else if(text == "0"){
					 	msg = "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
					 	span.innerHTML = msg;
				  	}
   				};
   			}; 
			xmlHttp.open("POST","<c:url value='/UserServlet'/>",false);
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xmlHttp.send("method=checkLoginVcode&vcode="+vcodeValue);
   			return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
		}
	};
    </script>
</head>
<body>
<div id="box">
	<p>${msg }</p>
    <fieldset style="width:500px ;margin:auto; margin-top:50px;">
        <legend>登录</legend>
        <form action="<c:url value='/UserServlet'/>" method="post" id="form" target="_top">
        	<input type="hidden" name="method" value="login"/>
        	<font color='red'>${error}</font>
            <table border="1" width="80%" align="center" cellpadding="5" cellspacing="0" style="color: white;">
                <tr>
                    <td>学号：</td>
                    <td>
                        <input type="text" name="cid" id="number"/><span id="numberSpan"></span>
                    </td>
                </tr>
                <tr>
                    <td> 密码:</td>
                    <td>
                        <input type="password" name="password" id="password"><span id="passwordSpan"></span>
                    </td>
                </tr>
                <tr>
                	<td> 验证码：</td>
                	<td>
                   		<input type="text"  name="verifyCode" id="verifyCode" style="width:75px"/>
                    	<a href="javascript:_change()"><img id="vCode" alt="验证码" src="<c:url value='/LoginVerifyServlet'></c:url>"/></a><span id="vCodeSpan"></span>
                	</td>
            	</tr>
                <tr>
                    <td colspan="2" align="center">
                		<input type="submit" value="登录"/>
                    </td>
                </tr>
                </table>
            </form>
        </fieldset>
    </div>
</body>
</html>