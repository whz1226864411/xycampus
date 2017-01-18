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
	    	var unameObj = document.getElementById("uname");
	    	var cidObj = document.getElementById("cid");
	    	var uclassObj = document.getElementById("uclass");
	    	var ftelObj = document.getElementById("ftel");
	    	//添加事件
	    	fnameObj.onblur = checkFname;
	    	unameObj.onblur = checkUname;
	    	cidObj.onblur = checkCid;
	    	uclassObj.onblur = checkUclass;
	    	ftelObj.onblur = checkFtel;
	    	
	    	var form = document.getElementById("form");
	    	form.onsubmit = function(){
	           	var bFname = checkFname();
	           	var bUname = checkUname();
				var bCid = checkCid();
	            var bUclass = checkUclass();
	            var bFtel = checkFtel();
				//如果,每个上面的每个对象,验证成功,则还回true
	            return (bFname&&bUname&&bCid&&bUclass && bFtel) ;
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
	         function checkUname(){
		     		var unameValue = trim(unameObj.value);
		     		var span = document.getElementById("unameSpan");
		     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
		     		if (!unameValue){
		 				msg = "<font color='red'>联系人必须填写!</font>";
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
	 	    function checkFtel(){
	     		var ftelValue = trim(ftelObj.value);
	     		var telRegex =/^(\d{11})$/;
	     		var span = document.getElementById("ftelSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!ftelValue){
	 				msg = "<font color='red'>联系方式必须填写!</font>";
	 			}else if (!telRegex.test(ftelValue)) {
	            	msg = "<font color='red'>电话必须11位</font>";
	            }
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	    };
    </script>
    
	<style>
        *{
            margin: 0;
            padding:0;
        }
        body{
            background-image: url("<c:url value='/images/20.jpg'/>");
        }
        #box{
            width:400px;
            height:400px;
            border: 3px solid;
           margin-top: 100px;
            margin-left: 550px;
            box-shadow: 5px 5px 5px #000;
        }
    </style>
  </head>
  
  <body>
   <ul class="pagination">
	    <li><a href="<c:url value='/jsps/lose/card.jsp'/>" target="body">一卡通</a></li>
	    <li><a href="<c:url value='/jsps/lose/other.jsp'/>" target="body">其他</a></li>
	</ul>
	<div id="box">
	  	<h2>一卡通招领</h2>
	    <form action="<c:url value='/LoseServlet'/>" method="post" id="form">
	    	<input type="hidden" name="method" value="loseCard">
	    	<input type="hidden" name="type" value="card"/>
	    	联系人姓名:<input type="text" name="fname" id="fname"/><span id="fnameSpan"></span><br/><br/>
	    	联&nbsp;系&nbsp;方&nbsp;式:<input type="text" name="ftel" id="ftel"/><span id="ftelSpan"></span><br/><br/>
	    	失&nbsp;主&nbsp;卡&nbsp;号:<input type="text" name="cid" id="cid"/><span id="cidSpan"></span><br/><br/>
	    	失&nbsp;主&nbsp;姓&nbsp;名:<input type="text" name="uname" id="uname"/><span id="unameSpan"></span><br/><br/>
	    	失&nbsp;主&nbsp;班&nbsp;级:<input type="text" name="uclass" id="uclass"/><span id="uclassSpan"></span><br/><br/>
	    	<input type="submit" value="发布"><br/>
	    </form>
    </div>
  </body>
</html>
