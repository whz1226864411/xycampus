<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  	<ul class="pagination">
	    <li><a href="<c:url value='/jsps/find/card.jsp'/>" target="body">一卡通</a></li>
	    <li><a href="<c:url value='/jsps/find/other.jsp'/>" target="body">其他</a></li>
	    <li><a href="<c:url value='/jsps/find/query.jsp'/>" target="body">查询失物</a></li>
	</ul>
    <h2 align="center" style="color: rgba(0,127,127,20)">一卡通丢失查询</h2>
    <form action="<c:url value="/FindServlet"/>" method="post" id="Main">
    	<input type="hidden" name="method" value="query">
    	卡号:<input type="text" name="cid">
    	<input type="submit" value="查询">
    </form>
    <c:choose>
    	<c:when test="${empty requestScope.lose}"></c:when>
    	<c:when test="${requestScope.lose eq '1'}"><h3 align="center" style="color: rgba(0,127,127,20)">查询无结果</h3></c:when>
    	<c:otherwise>
    		<h3 align="center" style="color: rgba(0,127,127,20)">查询结果</h3>
    		<table border="1" cellspacing="0" id="Main">
    			<tr>
    				<td>丢失卡号</td>
    				<td>失主姓名</td>
    				<td>失主班级</td>
    				<td>拾者姓名</td>
    				<td>联系方式</td>
    			</tr>
    			<tr >
    				<td>${lose.cid }</td>
    				<td>${lose.uname }</td>
    				<td>${lose.uclass }</td>
    				<td>${lose.fname }</td>
    				<td>${lose.ftel }</td>
    			</tr>
    		</table>
    	</c:otherwise>
    </c:choose>
  </body>
</html>
