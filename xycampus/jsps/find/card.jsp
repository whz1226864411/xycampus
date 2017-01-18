<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"/>
    <script type="application/javascript" src="<c:url value='/js/jquery-2.2.0.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <style>
       *{
            margin: 0;
            padding: 0;
        }
       body{
           background-image: url("<c:url value='/images/23.jpg'/>");
           background-repeat: repeat-x;
       }
        #box1{
            width:350px;
            height:300px;
            padding: 10px;
            margin-top: 150px;
            margin-left: 300px;
            border: 3px skyblue solid;
            box-shadow: 5px 4px 12px ;
            border-radius: 30px;
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
	    	var cidObj = document.getElementById("cid");
	    	var uclassObj = document.getElementById("uclass");
	    	var ltelObj = document.getElementById("ltel");
	    	//添加事件
	    	lnameObj.onblur = checkLname;
	    	cidObj.onblur = checkCid;
	    	uclassObj.onblur = checkUclass;
	    	ltelObj.onblur = checkLtel;
	    	
	    	var form = document.getElementById("form");
	    	form.onsubmit = function(){
	           	var bLname = checkLname();
				var bCid = checkCid();
	            var bUclass = checkUclass();
	            var bLtel = checkLtel();
				//如果,每个上面的每个对象,验证成功,则还回true
	            return (bLname&&bCid&&bUclass && bLtel) ;
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
	         function checkCid(){
	     		var cidValue = trim(cidObj.value);
	     		var span = document.getElementById("cidSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!cidValue){
	 				msg = "<font color='red'>学号必须填写!</font>";
	 			}else if (cidValue.length != 8) {
	                msg = "<font color='red'>学号必须位为8位</font>";
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
	    };
    </script>
  </head>
  
  <body>
  	<ul class="pagination">
	    <li><a href="<c:url value='/jsps/find/card.jsp'/>" target="body">一卡通</a></li>
	    <li><a href="<c:url value='/jsps/find/other.jsp'/>" target="body">其他</a></li>
	    <li><a href="<c:url value='/jsps/find/query.jsp'/>" target="body">查询失物</a></li>
	</ul>
  <div id="box1">
  	<h2>寻找丢失的一卡通</h2>
    <form action="<c:url value='/FindServlet'/>" method="post" id="form">
    	<input type="hidden" name="method" value="findThing">
    	<input type="hidden" name="type" value="card"/>
    	姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:<input type="text" name="lname" id="lname"/><span id="lnameSpan"></span><br/><br/>
    	卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:<input type="text" name="cid" id="cid"/><span id="cidSpan"></span><br/><br/>
    	班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:<input type="text" name="uclass" id="uclass"/><span id="uclassSpan"></span><br/><br/>
    	联系方式:<input type="text" name="ltel" id="ltel"/><span id="ltelSpan"></span><br/><br/>
    	<input type="submit" value="发布"><br/>
    </form>
    </div>
  </body>
</html>
