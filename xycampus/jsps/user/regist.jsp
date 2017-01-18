<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
	<base target="body">
    <title>注册</title>
    <style type="text/css">
       #main{
           width:100%;
           height:700px;
           background-image: url("<c:url value='/images/03.jpg'/>");
           background-repeat: no-repeat;
           background-position:top;
           color: white;
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
  		vCode.src="<c:url value='/RegistVerifyServlet'></c:url>?"+new Date().getTime();
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
		var numberObj = document.getElementById("number");
        var usernameObj = document.getElementById("username");
        var passwordObj = document.getElementById("password");
        var confirmObj = document.getElementById("confirm");
        var emailObj = document.getElementById("email");
        var telObj=document.getElementById("tel");
        var classObj=document.getElementById("class");
        var vcodeObj=document.getElementById("verifyCode");

		//设置每个对象的onblur事件(对象失去焦点时发生),并调用各自的方法
		classObj.onblur = checkClass;
		numberObj.onblur = checkNumber;
        usernameObj.onblur = checkUsername;
        passwordObj.onblur = checkPassword;
        confirmObj.onblur = checkConfirm;
        emailObj.onblur = checkEmail;
        telObj.onblur = checkTel;
        vcodeObj.onblur = checkVcode;
      //获取表单对象,并且为表单提交事件写个方法
        var form = document.getElementById("form");
        form.onsubmit = function(){
           	var bClass = checkClass();
			var bNumber = checkNumber();
            var bUsername = checkUsername();
            var bPassword = checkPassword();
            var bConfirm = checkConfirm();
            var bEmail = checkEmail();
            var bTel=checkTel();
            var bVcode= checkVcode();
			//如果,每个上面的每个对象,验证成功,则还回true
            return (bVcode&&bclass&&bNumber && bUsername && bPassword && bConfirm && bEmail && bTel) ;
         };
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
			xmlHttp.send("method=checkRegistVcode&vcode="+vcodeValue);
   			return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
		}
        
        //校验班级
        function checkClass(){
            var classValue = trim(classObj.value);
            var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>"; //不懂?
            if (!classValue){
            	msg = "<font color='red'>班级必须填写!</font>";
            }
            var span = document.getElementById("classSpan");
            span.innerHTML = msg;
            return msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
        }
        
        //校验学号
        function checkNumber(){
        	var span = document.getElementById("numberSpan");
        	var xmlHttp = createXMLHttpRequest();
        	var numberValue = trim(numberObj.value);
            var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>"; 
        	var text="";
        	if (!numberValue){
            	msg = "<font color='red'>学号必须填写!</font>";
             	span.innerHTML = msg;
            }else if (numberValue.length != 8) {
                msg = "<font color='red'>学号必须位为8位</font>";
                span.innerHTML = msg;
            }
        	xmlHttp.onreadystatechange = function(){
  				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
  	      			text = xmlHttp.responseText;
  	      			if(text == "1"){
  	  					msg = "<font color='red'>学号已被注册</font>";
  	  					span.innerHTML = msg;
  	  				}else if(text == "0"){
  	  					 msg = "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
  	  					span.innerHTML = msg;
  	  				};
  	      		};
  	      	};
   			xmlHttp.open("POST","<c:url value='/UserServlet'/>",false);
   			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
   			xmlHttp.send("method=findCid&cid="+numberValue);
            return msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
		}
        
        //校验姓名
        function checkUsername(){
			var usernameValue = trim(usernameObj.value);
            var usernameRegex =  /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$/;
            var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
            if(usernameValue == null || usernameValue == ""){
            	msg ="<font color='red'>姓名必须填写!</font>";
            }else if(!usernameRegex.test(usernameValue)){
            	msg ="<font color='red'>姓名格式不正确</font>";
            }
            var span = document.getElementById("usernameSpan");
            span.innerHTML = msg;
            return msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
        }
        
		//校验密码
       function checkPassword(){
           var passwordValue = trim(passwordObj.value);
           var passwordRegex = /^\w{6,18}$/;
           var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>"; //不懂?
           if (!passwordValue){
        	   msg = "<font color='red'>密码必须填写!</font>";
           }else if (!passwordRegex.test(passwordValue)) {
               msg = "<font color='red'>密码必须6-18位</font>";
           }
           var span = document.getElementById("passwordSpan");
           span.innerHTML = msg;
           return msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
       }
		
		//确认密码
       function checkConfirm(){
           var confirmValue = confirmObj.value;
           var passwordValue = trim(passwordObj.value);
           var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
           if (!confirmValue){
           		msg = "<font color='red'>确认密码必须填写!</font>";
           }else if (confirmValue != passwordValue){
           		msg = "<font color='red'>密码必须一致!</font>";
           }
           var span = document.getElementById("confirmSpan");
           span.innerHTML = msg;
           return msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
       }
		
		//校验邮箱
        function checkEmail(){
        	var xmlHttp = createXMLHttpRequest();
        	var span = document.getElementById("emailSpan");
        	var text="";
            var emailObjValue = trim(emailObj.value);
            var emailRegex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,3}$/;
            var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
   			if(!emailObjValue){
             	msg = "<font color='red'>Email必须填写!</font>";
             	span.innerHTML = msg;
        	}else if(!emailRegex.test(emailObjValue)){
             	msg = "<font color='red'>Email格式不正确!</font>";
             	span.innerHTML = msg;
        	}
        	xmlHttp.onreadystatechange = function(){
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
					text = xmlHttp.responseText;
					if(text == "1"){
	  					msg = "<font color='red'>邮箱已被注册</font>";
						span.innerHTML = msg;
  					}else if(text =="0"){
	 					msg = "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	 					span.innerHTML = msg;
  					}
				}
			}; 
        	xmlHttp.open("POST","<c:url value='/UserServlet'/>",false);
   			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
   			xmlHttp.send("method=findEmail&email="+emailObjValue);
        	return msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
      	};
		
		//校验手机号
        function checkTel(){
           	var span = document.getElementById("telSpan");
           	var xmlHttp = createXMLHttpRequest();
            var telObjValue = trim(telObj.value);
            var telRegex =/^(\d{11})$/;
            var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
            var text="";
     		if (!telObjValue){
				msg = "<font color='red'>电话必须填写!</font>";
				span.innerHTML = msg;
            }else if (!telRegex.test(telObjValue)) {
            	msg = "<font color='red'>电话必须11位</font>";
            	span.innerHTML = msg;
            }
            xmlHttp.onreadystatechange = function(){
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
   					text = xmlHttp.responseText;
   					if(text == "1"){
				  		msg = "<font color='red'>手机号已被注册</font>";
						span.innerHTML = msg;
			  		}else if(text == "0"){
				 		msg = "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
				 		span.innerHTML = msg;
			  		}
				}
   			};
   			xmlHttp.open("POST","<c:url value='/UserServlet'/>",false);
      		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
      		xmlHttp.send("method=findTel&tel="+telObjValue);
            return msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
		};
		
	};
    </script>
</head>
<body>
<div id="main">
<fieldset style="width:55% ;margin:auto;">
    <legend style="color: black;">
        	新用户注册
    </legend>
    <form action="<c:url value='/UserServlet'/>" method="post" id="form">
    	<input type="hidden" name="method" value="regist">
        <table border="1" width="60%" align="center" cellpadding="5" cellspacing="0" style="color: white;">
            <tr>
                <td>学&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
                <td>
                    <input type="text" name="cid" id="number"/><span id="numberSpan"><font color='red'>${errors.cidError }</font></span>
                </td>
            </tr>
            <tr>
                <td width="25%">
                    	姓&nbsp;&nbsp;&nbsp;&nbsp;名:
                </td>
                <td>
                    <input type="text" name="uname" id="username"><span id="usernameSpan"><font color='red'>${errors.unameError }</font></span>
                </td>
            </tr>
            <tr>
                <td>密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
                <td>
                    <input type="password" name="password" id="password"><span id="passwordSpan"><font color='red'>${errors.passwordError }</font></span>
                </td>
            </tr>
            <tr>
                <td>确认密码:</td>
                <td>
                    <input type="password" name="confirm" id="confirm"><span id="confirmSpan"></span>
                </td>
            </tr>
            <tr>
                <td> 邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
                <td>
                    <input type="text" name="email" id="email"><span id="emailSpan"><font color='red'>${errors.emailError }</font></span>
                </td>
            </tr>
            <tr>
                <td> 班&nbsp;&nbsp;&nbsp;&nbsp;级:</td>
                <td>
                    <input type="text" name="uclass" id="class"/><span id="classSpan"><font color='red'>${errors.uclassError }</font></span>
                </td>
            </tr>
            <tr>
                <td> 电话号码：</td>
                <td>
                    <input type="text" name="tel" id="tel"/><span id="telSpan"><font color='red'>${errors.telError }</font></span>
                </td>
            </tr>
            <tr>
                <td> 验证码：</td>
                <td>
                    <input type="text"  name="verifyCode" id="verifyCode" style="width:75px"/>
                    <a href="javascript:_change()"><img id="vCode" alt="验证码" src="<c:url value='/RegistVerifyServlet'></c:url>"/></a><span id="vCodeSpan"><font color='red'>${errors.verifyCodeError }</font></span>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="新用户注册">
                </td>
            </tr>
        </table>
    </form>
</fieldset>
</div>
</body>
</html>