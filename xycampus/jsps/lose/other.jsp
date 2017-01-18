<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"/>
    <script type="application/javascript" src="<c:url value='/js/jquery-2.2.0.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script type="text/javascript">
	  //去除用户名前后的空格
	    function trim(s){
	        return s.replace(/^\s+|\s+$/g,"");
	    }
	    
	    window.onload = function(){
	    	var fnameObj = document.getElementById("fname");
	    	var typeObj = document.getElementById("type");
	    	var ftelObj = document.getElementById("ftel");
	    	var informationObj = document.getElementById("information");
	    	//添加事件
	    	fnameObj.onblur = checkFname;
	    	typeObj.onblur = checkType;
	    	ftelObj.onblur = checkFtel;
	    	informationObj.onblur = checkInformation;
	    	
	    	var form = document.getElementById("form");
	    	form.onsubmit = function(){
	           	var bFname = checkFname();
				var bType = checkType();
	            var bFtel = checkFtel();
	            var bInformation = checkInformation();
				//如果,每个上面的每个对象,验证成功,则还回true
	            return (bFname&&bType && bFtel&&bInformation) ;
	         };
	       //校验函数
	         function checkFname(){
	     		var fnameValue = trim(fnameObj.value);
	     		var span = document.getElementById("fnameSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!fnameValue){
	 				msg = "<font color='red'>联系人必须填写!</font>";
	 			}
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	         function checkType(){
	     		var typeValue = trim(typeObj.value);
	     		var span = document.getElementById("typeSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!typeValue){
	 				msg = "<font color='red'>物件必须填写!</font>";
	 			}
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	 	    function checkFtel(){
	     		var ftelValue = trim(ftelObj.value);
	     		var telRegex =/^(\d{11})$/;
	     		var span = document.getElementById("ftelSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!ftelValue){
	 				msg = "<font color='red'>电话必须填写!</font>";
	 			}else if (!telRegex.test(ftelValue)) {
	            	msg = "<font color='red'>电话必须11位</font>";
	            }
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	 	   function checkInformation(){
	     		var informationValue = trim(informationObj.value);
	     		var span = document.getElementById("informationSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!informationValue){
	 				msg = "<font color='red'>描述必须填写!</font>";
	 			}else if (informationValue.length > 39) {
	            	msg = "<font color='red'>字数在39以内!</font>";
	            }
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	    };
    </script>
	<style>
        body {
            background-color: #bce8f1;
        }
        #box{
            width:750px;
            height:490px;
            margin-left:300px;
            margin-top: 50px;
            background-image: url("<c:url value='/images/22.jpeg'/>");
            border: 3px solid black;
            border-radius: 50px;
        }
    </style>
  </head>
  
  <body>
  <ul class="pagination">
	    <li><a href="<c:url value='/jsps/lose/card.jsp'/>" target="body">一卡通</a></li>
	    <li><a href="<c:url value='/jsps/lose/other.jsp'/>" target="body">其他</a></li>
	</ul>
  <div id="box">
    <h2>失物招领</h2>
    <form action="<c:url value='/LoseServlet'/>" method="post" id="form">
    			<input type="hidden" name="method" value="loseOther">
    	失&nbsp;物&nbsp;名&nbsp;称:<input type="text" name="type" id="type"/><span id="typeSpan"></span><br/><br/>
    	联系人姓名:<input type="text" name="fname" id="fname"/><span id="fnameSpan"></span><br/><br/>
    	联&nbsp;系&nbsp;方&nbsp;式:<input type="text" name="ftel" id="ftel"/><span id="ftelSpan"></span><br/><br/>
    	失物描述(丢失地点，失物特征):<br/>
    	<textarea rows="8" cols="35" name="information" id="information"></textarea><br/><span id="informationSpan"></span><br/>
    	<input type="submit" value="发布" style="margin-left: 185px"><br/>
    </form>
    </div>
  </body>
</html>
