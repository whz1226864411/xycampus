<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.4.2.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/jquery/jquery.datepick.css" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.datepick.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
				$('#start').datepick({dateFormat: 'yy-mm-dd'}); 
			});
			$(document).ready(function(){
				//使用class属性处理  'yy-mm-dd' 设置格式"yyyy/mm/dd"
				$('#end').datepick({dateFormat: 'yy-mm-dd'}); 
			});
		</script>
		<script type="text/javascript">
	  //去除用户名前后的空格
	    function trim(s){
	        return s.replace(/^\s+|\s+$/g,"");
	    }
	    
	    window.onload = function(){
	    	var anameObj = document.getElementById("aname");
	    	var startObj = document.getElementById("start");
	    	var endObj = document.getElementById("end");
	    	var sponsorObj = document.getElementById("sponsor");
	    	var organizerObj = document.getElementById("organizer");
	    	var introductionObj = document.getElementById("introduction");
	    	var bodyObj = document.getElementById("body");
	    	//添加事件
	    	anameObj.onblur = checkAname;
	    	startObj.onblur = checkDate;
	    	endObj.onblur = checkDate;
	    	sponsorObj.onblur = checkSponsor;
	    	organizerObj.onblur = checkOrganizer;
	    	introductionObj.onblur = checkIntroduction;
	    	bodyObj.onclick = checkDate;
	    	
	    	var form = document.getElementById("form");
	    	form.onsubmit = function(){
	           	var bAname = checkAname();
	           	var bDate = checkDate();
				var bSponsor = checkSponsor();
	            var bOrganizer = checkOrganizer();
	            var bIntroduction = checkIntroduction();
				//如果,每个上面的每个对象,验证成功,则还回true
	            return (bAname&&bDate&&Organizer&&bSponsor && bIntroduction) ;
	         };
	       //校验函数
	         function checkAname(){
	     		var anameValue = trim(anameObj.value);
	     		var span = document.getElementById("anameSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!anameValue){
	 				msg = "<font color='red'>活动名称必须填写!</font>";
	 			}
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	         function checkSponsor(){
		     		var sponsorValue = trim(sponsorObj.value);
		     		var span = document.getElementById("sponsorSpan");
		     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
		     		if (!sponsorValue){
		 				msg = "<font color='red'>主办方必须填写!</font>";
		 			}
		     		span.innerHTML = msg;
		     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
		     	}
	         function checkDate(){
		     		var startValue = trim(document.getElementById("start").value);
		     		var endValue = trim(document.getElementById("end").value);
		     		var dateRegex = /^\d{4}[-]\d{2}[-]\d{2}$/;
		     		var span = document.getElementById("dateSpan");
		     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
		     		if(!dateRegex.test(startValue)|| !dateRegex.test(endValue)){
		     			msg = "<font color='red'>日期格式不正确!</font>";
		     		}
		     		if (!startValue || !endValue){
		 				msg = "<font color='red'>日期必须填写!</font>";
		 			}
	 				var arr=startValue.split("-");    
	 				var starttime=new Date(arr[0],arr[1],arr[2]);    
	 				var starttimes=starttime.getTime();   
	 				  
	 				var arrs=endValue.split("-");    
	 				var lktime=new Date(arrs[0],arrs[1],arrs[2]);    
	 				var lktimes=lktime.getTime();   
		 				  
	 				if(starttimes>lktimes)    
	 				{   
	 					msg = "<font color='red'>起始日期必须小于结束日期</font>";
	 				}
		     		span.innerHTML = msg;
		     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
		     	}
	         function checkIntroduction(){
		     		var introductionValue = trim(introductionObj.value);
		     		var span = document.getElementById("introductionSpan");
		     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
		     		if (!introductionValue){
		 				msg = "<font color='red'>介绍必须填写!</font>";
		 			}else if (introductionValue.length > 250) {
		            	msg = "<font color='red'>字数在250以内!</font>";
		            }
		     		span.innerHTML = msg;
		     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
		     	}
	         function checkOrganizer(){
	     		var organizerValue = trim(organizer.value);
	     		var span = document.getElementById("organizerSpan");
	     		var msg ="&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>";
	     		if (!organizerValue){
	 				msg = "<font color='red'>承办方必须填写!</font>";
	 			}
	     		span.innerHTML = msg;
	     		return ( msg == "&nbsp;&nbsp;&nbsp;<img src='<c:url value='/images/true.jpg'/>' style='width:15px'>");
	     	}
	    };
    </script>
		<style>
	        body{
	            background-image:url("<c:url value='/images/12.jpg'/>");
	            background-repeat:repeat-x;
	
	        }
	        #box{
	        	color:white;
	            width: 500px;
	            height:500px;
	            margin: auto;
	            margin-top: 100px;
	        }
    </style>
  </head>
  
  <body id="body">
  <div id="box">
    <h2>活动发布</h2>
    <form action="<c:url value='/UploadServlet'/>" method="post" enctype="multipart/form-data" id="form">
    	活动名称:<input type="text" name="aname" id="aname"/>
    	<span id="anameSpan"></span><br/><br/>
    	报名时间:<input type="text" name="start" id="start"/>-<input type="text" name="end" id="end"/>
    	<span id="dateSpan"></span><br/><br/>
    	主&nbsp;办&nbsp;方:<input type="text" name="sponsor" id="sponsor"/>
    	<span id="sponsorSpan"></span><br/><br/>
    	承&nbsp;办&nbsp;方:<input type="text" name="organizer" id="organizer"/>
    	<span id="organizerSpan"></span><br/><br/>
    	相关照片:<input type="file" name="img"><br/><br/>
    	活动简介(字数在250字以下):<br/><br/>
    	<textarea name="introduction" rows="10" cols="50" id="introduction"></textarea><br/>
    	<span id="introductionSpan"></span>
    	<br/>
    	<input type="submit" value="发布"/>
    </form>
   </div>
  </body>
</html>
