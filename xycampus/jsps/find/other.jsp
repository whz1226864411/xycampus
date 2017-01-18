<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"/>
    <script type="application/javascript" src="<c:url value='/js/jquery-2.2.0.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<style>
        body{
            background-image:url("<c:url value='/images/35.jpg'/>");
            
        }
        #box{
            width:410px;
            height:500px;
            border: 2px solid;
            margin-left: 200px;
            padding: 20px;
            box-shadow: 5px 5px 12px #000000;
            font-weight: 300;
	    	font: 15px "微软雅黑", Arial, Helvetica, sans-serif;
	    	text-shadow: 0px 0px 20px rgba(127,255,255,2);
        }
    </style>
    <script type="text/javascript">
	  //去除用户名前后的空格
	    function trim(s){
	        return s.replace(/^\s+|\s+$/g,"");
	    }
	    
	    window.onload = function(){
	    	var lnameObj = document.getElementById("lname");
	    	var typeObj = document.getElementById("type");
	    	var uclassObj = document.getElementById("uclass");
	    	var ltelObj = document.getElementById("ltel");information
	    	var informationObj = document.getElementById("information");
	    	//添加事件
	    	lnameObj.onblur = checkLname;
	    	typeObj.onblur = checkType;
	    	uclassObj.onblur = checkUclass;
	    	ltelObj.onblur = checkLtel;
	    	informationObj.onblur = checkInformation;
	    	
	    	var form = document.getElementById("form");
	    	form.onsubmit = function(){
	           	var bLname = checkLname();
				var bType = checkType();
	            var bUclass = checkUclass();
	            var bLtel = checkLtel();
	            var bInformation = checkInformation();
				//如果,每个上面的每个对象,验证成功,则还回true
	            return (bLname&&bType&&bUclass && bLtel&&bInformation) ;
	         };
	       //校验函数
	         function checkLname(){
	     		var lnameValue = trim(lnameObj.value);
	     		var span = document.getElementById("lnameSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!lnameValue){
	 				msg = "<font color='red'>姓名必须填写!</font>";
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
	         function checkUclass(){
	     		var uclassValue = trim(uclassObj.value);
	     		var span = document.getElementById("uclassSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!uclassValue){
	 				msg = "<font color='red'>班级必须填写!</font>";
	 			}
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	 	    function checkLtel(){
	     		var ltelValue = trim(ltelObj.value);
	     		var telRegex =/^(\d{11})$/;
	     		var span = document.getElementById("ltelSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!ltelValue){
	 				msg = "<font color='red'>电话必须填写!</font>";
	 			}else if (!telRegex.test(ltelValue)) {
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
  </head>
  
  <body>
  	<ul class="pagination">
	    <li><a href="<c:url value='/jsps/find/card.jsp'/>" target="body">一卡通</a></li>
	    <li><a href="<c:url value='/jsps/find/other.jsp'/>" target="body">其他</a></li>
	    <li><a href="<c:url value='/jsps/find/query.jsp'/>" target="body">查询失物</a></li>
	</ul>
  	<div id="box">
    <h2>寻物启事</h2>
    <form action="<c:url value='/FindServlet'/>" method="post" id="form">
    	<input type="hidden" name="method" value="findThing">
    	丢失物件:<input type="text" name="type" id="type"/><span id="typeSpan"></span><br/><br/>
    	姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:<input type="text" name="lname" id="lname"/><span id="lnameSpan"></span><br/><br/>
    	班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:<input type="text" name="uclass" id="uclass"/><span id="uclassSpan"></span><br/><br/>
    	联系方式:<input type="text" name="ltel" id="ltel"/><span id="ltelSpan"></span><br/><br/>
    	描述(丢失地点，物件描述)：<br/>
    	<textarea rows="8" cols="35" name="information" id="information"></textarea><span id="informationSpan"></span><br/>
    	<input type="submit" value="发布">
    </form>
   </div>
  </body>
</html>
