<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>"/>
    <script type="application/javascript" src="<c:url value='/js/jquery-2.2.0.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <style type="text/css">
    	#Main {
    width: 600px;
    text-align: center;
    margin: 0 auto;
	}
	table {
		background-color:#000000;
	    width: 600px;
	    border-collapse: collapse;
	    text-align: left;
	    margin: 10px 5px 5px 10px;
	    cursor: default;
	    border: 1px solid #ccc;
	    margin-top:20px;
	    box-shadow: 0px 0px 10px rgba(0,255,255,0.75);
	    border: 1px solid rgba(127,255,255,0.75);
	    -webkit-box-shadow: 0px 0px 8px rgba(0,255,255,0.75);
	    -moz-box-shadow: 0px 0px 8px rgba(0,255,255,0.75);
	    box-shadow: 0px 0px 8px rgba(0,255,255,0.75);
	}
	.tbTitle>th {
	    font-weight: 300;
	    text-align: center;
	    padding: 10px 0 10px 0;
	    font: 15px "微软雅黑", Arial, Helvetica, sans-serif;
	    background-color: rgba(0,93,93,0.8);
	    color: #efefef;
	    text-shadow: 0px 0px 20px rgba(127,255,255,1);
	}
	th, td {
	    border: 1px solid rgba(127,255,255,0.55);
	     
	}
	.tbContext:hover {
	    background-color: rgba(0,99,99,0.9) !important;
	}
	td,td>a {
	    font: 13px "微软雅黑", Arial, Helvetica, sans-serif;
	    text-align: center;
	    padding: 6px 0 6px 0;
	    color: rgba(127,255,255,0.75);
	    text-shadow: 0px 0px 20px rgba(0,255,255,0.75);/*-webkit-filter: drop-shadow(0px 0px 20px rgba(0,255,255,0.95));
	    -moz-filter: drop-shadow(0px 0px 20px rgba(0,255,255,0.95));
	    -o-filter: drop-shadow(0px 0px 20px rgba(0,255,255,0.95));
	    -ms-filter: drop-shadow(0px 0px 20px rgba(0,255,255,0.95));
	    filter: drop-shadow(0px 0px 20px rgba(0,255,255,0.95));*/
	}
	.tbContext:nth-child(2n 1) {
	    background-color: rgba(0,127,127,0.1);
	}
    </style>
  </head>
  
  <body>
  	<h2 align="center" style="color: rgba(0,127,127,20)">${requestScope.activity.aname}</h2>
   <table border="1" id="Main">
   	<tr>
   		<td>主办方</td>
   		<td>${requestScope.activity.sponsor}</td>
   	</tr>
   	<tr>
   		<td>承办方</td>
   		<td>${requestScope.activity.organizer}</td>
   	</tr>
   	<tr>
   		<td>报名时间</td>
   		<td> ${fn:substring(requestScope.activity.start,0,10)}至${fn:substring(requestScope.activity.end,0,10)}</td>
   	</tr>
   	<tr>
   		<td>活动简介</td>
   		<td>${requestScope.activity.introduction}</td>
   	</tr>
   	<c:if test="${session_user.cid != requestScope.activity.cid}">
   	<tr>
   		<td colspan="2"><a href="<c:url value='/ActivityServlet?method=apply&uid=${session_user.uid }&aid=${requestScope.activity.aid}'/>">点击报名</a></td>
   	</tr>
   	</c:if>
   </table>
   <button style="margin-left: 900px" onclick="history.back()">返回</button>
  </body>
</html>
