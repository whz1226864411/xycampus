<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"/>
    <script type="application/javascript" src="<c:url value='/js/jquery-2.2.0.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
</head>
  <style>
    .right1{
        float: right;
    }
    .left{
        width:300px;
        height:600px;
        margin: 10px;
    }
    .left-top{
        width:300px;
        height:250px;
        border-radius: 20px;
        background-color:#e5e5e5;
        text-align: center;
        font-size: large;
    }
    .left-bottom{
        width:300px;
        height:300px;
        margin-top:20px ;
        border-radius: 20px;
        background-color:#e5e5e5;
        text-align: center;
        font-size: large;
    }
    .main{
        width:600px;
        height:400px;
        background-color: #e5e5e5;
        margin-left: 400px;
        margin-top: -550px;
        text-align: center;
        font-size: large;
    }
    .right{
        float:right;
        width:300px;
        height:600px;
       margin-top: -450px;
    }
    .right-top{
        width:300px;
        height:250px;
        border-radius: 20px;
        background-color:#e5e5e5;
        text-align: center;
        font-size: large;
    }
    .right-bottom{
        width:300px;
        height:300px;
        margin-top:20px ;
        border-radius: 20px;
        background-color:#e5e5e5;
        text-align: center;
        font-size: large;
    }
	.navbar{
	        background-color:#c0a16b;
	        border: 1px saddlebrown solid;
	    }
</style>
<body>
	<div id="top">
	    <img src="<c:url value='/images/01.png'/>" alt="西邮校园" align="middle"/>
	</div>
	<div>
    	<nav class="navbar navbar-default" role="navigation">
	    	<ul class="nav navbar-nav">
		        <li><a href="<c:url value='/jsps/body.jsp'/>" target="body">首页</a></li>
		        <li><a href="<c:url value='/jsps/find/card.jsp'/>" target="body">寻物启事</a></li>
		        <li><a href="<c:url value='/jsps/lose/card.jsp'/>" target="body">失物招领</a></li>
		        <li><a href="<c:url value='/jsps/activity/issue.jsp'/>" target="body">活动发布</a></li>
		        <li><a href="<c:url value='/jsps/club/issue.jsp'/>" target="body">纳新发布</a></li>
		        <li><a href="<c:url value='/ActivityServlet?method=preList'/>" target="body">活动报名</a></li>
		        <li><a href="<c:url value='/ClubServlet?method=preList'/>" target="body">纳新报名</a></li>
	    	</ul>
	    	<div class="right1">
	        	<ul class="nav navbar-nav">
	            	<li>
	            		<c:choose>
		            		<c:when test="${empty session_user}">
		            			<a href="<c:url value='/jsps/user/login.jsp'/>"  target="body">登录</a>
		            		</c:when>
		            		<c:otherwise>
		            			<li><a>${session_user.uname},你好！</a></li>
		            			<li><a href="<c:url value='/UserServlet?method=quit'/>" target="_top">注销</a></li>
		            		</c:otherwise>
	            		</c:choose>
	            	</li>
	           		<li><a href="<c:url value='/jsps/user/regist.jsp'/>" target="body">注册</a></li>
	        	</ul>
			</div>
    	</nav>
	</div>
</body>
</html>
