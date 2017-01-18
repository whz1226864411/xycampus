<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>西邮校园</title>
    <base target="_top">
	<style type="text/css">
		*{
			font-size:10pt;
		}
		body{
			text-align:center;
		}
		.table{
			width:1300px;
			border:0px;/*固定边框,1像素*/
		    border-collapse: collapse;/*单线的列表边框*/
		}
		.table td{
			border:0px;/*固定边框,1像素*/
		}
		iframe {
			width: 100%;
			height: 100%;
		}
	</style>
  </head>
  
  <body>
	<table class="table" align="center">
		<tr style="height: 120px; ">
			<td colspan="2" align="center">
				<iframe frameborder="0" src="<c:url value='/jsps/top.jsp'/>" name="top" scrolling="no"></iframe>
			</td>
		</tr>
		<tr style="height: 640px">
			<td width="120" style="padding:5px;" align="center" valign="top">
				<iframe frameborder="0" src="<c:url value='/jsps/body.jsp'/>" id="iframe-body" name="body" scrolling="no"></iframe>
			</td>
		</tr>
	</table>
  </body>
</html>
