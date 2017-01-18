<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="refresh" content ="3;url=<c:url value='/jsps/body.jsp'/>">
	<script type="text/javascript"> 
		var i = 4; 
		function shownum(){ 
			i=i-1; 
			document.getElementById("time").innerHTML=i+"秒后自动跳转主界面";
			setTimeout('shownum()',1000); 
		} 
	</script>
	
  </head>
  
 <body onload="shownum()" style="height: 500px">
	<div align="center" style="margin-top: 200px">
		${msg },<p id="time"></p>
	</div>
  </body>
</html>
