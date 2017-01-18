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
	    <script type="text/javascript" src="<c:url value='/js/sportFrame01.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/js/holder.min.js'/>"></script>
	    <style type="text/css">
			.navbar{
				background-color:#c0a16b;
	        	border: 1px saddlebrown solid;
	    	}
	    	*{
	        	margin: 0;
	        	padding: 0;
	    	}
	    	.right1{
	        	float: right;
	    	}
			.left{
	        	width:300px;
				height:1000px;
				position: absolute;
			}
			.middle{
				width:567px;
	        	height:215px;
				position: absolute;
				left:384px;
				margin-top:5px;
			}
			.left-top{
				width:370px;
		        height:300px;
		        background-image: url("<c:url value='/images/06.jpg'/>");
		        border: 2px solid;
		        text-align: center;
		        font-size: large;
		        box-shadow: 5px 5px 12px #000000;
	    	}
	    	.left-bottom{
		        width:370px;
		        height:300px;
		        background-image: url("<c:url value='/images/tree.jpg'/>");
		        margin-top:20px ;
				border: 2px solid saddlebrown;
		        text-align: center;
		        font-size: large;
		        box-shadow: 5px 5px 12px #000000;
			}
			.right{
				float:right;
	        	width:330px;
				margin-top: -400px;
				position:relative;
			}
			.right-top{
	        width:330px;
		        height:300px;
		        background-image: url("<c:url value='/images/right_bottom.jpg'/>");
		        border-radius: 20px;
		        border:2px solid saddlebrown;
		        box-shadow: 3px 3px 10px #000000;
		        text-align: center;
				font-size: large;
	    	}
			.right-bottom{
	        width:330px;
		        height:300px;
		        margin-top:20px ;
		        background-image: url("<c:url value='/images/right_bottom.jpg'/>");
		        border:2px solid saddlebrown;
		        box-shadow: 3px 3px 10px #000000;
		        text-align: center;
		        font-size: large;
	    	}
	    	.next{
		        position:absolute;
		        z-index: 2;
		        left:400px;
		        top:300px;
		        opacity:0.3;
			}
			.prev{
		        position:absolute;
		        right: 350px;
		        top:300px;
		        z-index: 2;
		        opacity:0.3;
	    	}
	    	button{
		        width:131px;
		        height:100px;
		        opacity: 0.3;
	    	}
	    	.active{
	        	opacity:1;
	    	}
	    	#box{
	         	width: 523px;
	         	height: 400px;
	         	margin: auto;
			}
			#box01{
	         	width: 567px;
	         	height: 400px;
	         	position: absolute;
	         	overflow: hidden;
			}
			#box01 input{
	            width: 50px;
	            height: 50px;
	            font-size: 30px;
	            font-weight: bolder;
	            color: #fff;
	            background-color: #000;
	            opacity: 0.7;
	            margin-top: 180px;
			}
			.box01_1{
	         	width: 600px;
	         	height: 400px;	
	         	position: absolute;
	         	top: 0px;
			}
			.box01_1 div{
				width: 600px;
	         	height: 400px;
			}
			.box01_1 img{
	         	width: 600px;
	         	height: 400px;
			}
			#box02{
				width: 567px;
	         	height: 40px;
	         	background: #000;
	         	opacity: 0.3;
	         	margin-top: 360px;
	         	position: absolute;
			}
			.box_btn{
				margin-left: 467px;
	         	margin-top:8px;
			}
			#box02 input{
	         	width: 20px;
	         	height: 20px;
	         	border-radius: 10px 10px 10px 10px;
			}
			#box02 p{
	            padding-left: 10px;
	            padding-top: 4px;
	         	font-size: 18px;
	         	color: #fff;
	            position: absolute;
	            display: none;
			}
		</style>
		<script type="text/javascript">
			$(function(){
			    var i=0;
			    var timer=null;
			    //为下面的button进行赋值；
			    function frame01(){
			        $(".box01_1").css('top',"0px");
			        $(".box_btn input").eq(0).css("background-color","#f00").siblings().css("background-color","");
			        $("#box02 p").eq(0).css("display","block").siblings("p").css("display","none");
		    }
		    function frame02(){
		        $(".box01_1").animate({top:-400*i+"px"},1000);
		        $(".box_btn input").eq(i).css("background-color","#f00").siblings().css("background-color",""); 
		        $("#box02 p").eq(i).css("display","block").siblings("p").css("display","none");
		    }
		     //对运动进行封装
		    function sport(){
		     	 i++; $(".box_btn input").css("background-color","#fff");
		        if (i>3){  i=0;   frame01();}
		        else{  frame02();	}
		    }
		     //定时器开启，自动播放
		    timer=setInterval(sport,2000);
		     //左边按键播放         
		    $("#box01 input").eq(0).click(function(){
		    	 clearInterval(timer); i++;
		        if(i>3)  { i=0; frame01();}
		        else { frame02();}
		        timer=setInterval(sport,2000);  
		    });
		    //右边按键播放
		    $("#box01 input").eq(1).click(function(){
		    	 clearInterval(timer); i--;
		        if(i<0){ i=0;frame01();}
		        else{frame02();}
		        timer=setInterval(sport,2000);  
		    });
		    //最下面按键的点击作用
		    $(".box_btn input").each(function(j){
		     	 $(".box_btn input").eq(j).click(function(){
		            clearInterval(timer);
		            $(this).css("background-color","#f00").siblings().css("background-color","");
		            $(".box01_1").css("top",-400*j+"px");
		            timer=setInterval(sport,2000); 
		           });
		    	});  
			});
		
			function createXMLHttpRequest(){
				try {
					return new XMLHttpRequest();
				} catch (e) {
					try {
						return new ActiveXObject("MAXml2.XMLHTTP");
					} catch (e) {
						try {
							return new ActiveXObject("Microsoft.XMLHTTP");
						} catch (e) {
							alert("你的浏览器好强。");
							throw e;
						}
					}
				}
			}
			window.onload = function(){
				loadLoses();
				loadFinds();
				loadClubs();
				var oBox=document.getElementById('box');
		        var oUl=oBox.getElementsByTagName('ul')[0];
		        var aImg=oBox.getElementsByTagName('img');
		        var oBox1=document.getElementById('box1');
		        var aBtn=oBox1.getElementsByTagName('button');
		        var oNext=document.getElementsByClassName('next')[0];
		        var oPrev=document.getElementsByClassName('prev')[0];
		        var timer=null;
		        var i=0;
		        var m=4;
		        var n=0;
		        run();
		        for(var j=0;j<aBtn.length;j++){
		            aBtn[j].index=j;
		            aBtn.onclick=function(){
		                for(var j=0;j<aBtn.length;j++){
		                    aBtn[j].className='';
		                }
		                aBtn[this.index].className='active';
		                i=m=this.index;
		                sportFrame(oUl,'left',-600*this.index);
		            };
		        }
		        oNext.onmousemove=oPrev.onmousemove=function(){
		            sportFrame(oNext,'opacity',100);
		            sportFrame(oPrev,'opacity',100);
		            clearInterval(timer);
		        };
		        oNext.onmouseout=oPrev.onmouseout=function(){
		            sportFrame(oNext,'opacity',10);
		            sportFrame(oPrev,'opacity',10);
		            run();
		        };
		        oNext.onclick=function(){
		            if(i==0){
		                for(var j=0;j<aBtn.length;j++){
		                    aBtn[j].className='';
		                }
		                aBtn[aBtn.length-1].className='active';
		                sportFrame(oUl,'left',-600*3);
		                i=3;
		            }else{
		                for(var j=0;j<aBtn.length;j++){
		                    aBtn[j].className='';
		                }
		                aBtn[i-1].className='active';
		                sportFrame(oUl,'left',-600*(--i));
		            }
		        };
		        oPrev.onclick=function(){
		            if(i==3){
		                for(var j=0;j<aBtn.length;j++){
		                    aBtn[j].className='';
		                }
		                i=0;
		                aBtn[i].className='active';
		                sportFrame(oUl,'left',-600*i);
		            }else{
		                for(var j=0;j<aBtn.length;j++){
		                    aBtn[j].className='';
		                }
		                aBtn[++i].className='active';
		                sportFrame(oUl,'left',-600*i);
		            }
		        };
		        function run(){
		            timer = setInterval(function () {
		                if (i != aImg.length - 1) {
		                    i++;
		                    for (var j = 0; j < aBtn.length; j++) {
		                        aBtn[j].className = '';
		                    }
		                    aBtn[i].className = 'active';
		                    sportFrame(oUl, 'left', -600 * i);
		                }
		                else {
		                    if (m != 0) {
		                        m--;
		                        for (var j = aImg.length - 1; j >= 0; j--) {
		                            aBtn[j].className = '';
		                        }
		                        aBtn[m].className = 'active';
		                        sportFrame(oUl, 'left', -600 * m);
		
		                    }
		                    else {
		                        i = 0;
		                        m = 4;
		                    }
		                }
		            }, 2000);
		        }
			};
			function loadLoses(){
				var losesObj=document.getElementById("loses");
				var xmlHttp = createXMLHttpRequest();
				xmlHttp.open("POST","<c:url value='/LoseServlet'/>",true);
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlHttp.send("method=load");
				xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		   				var text = eval("("+xmlHttp.responseText+")");
		   				for(var i=0;i<text.length;i++){
		   					var msg = document.createTextNode(text[i]);
		   					var div = document.createElement("div");
		   					var br = document.createElement("br");
		   					div.appendChild(msg);
		   					losesObj.appendChild(div);
		   					losesObj.appendChild(br);
		   				}
					}
				}; 
			}
			function loadClubs(){
				var clubsObj=document.getElementById("clubs");
				var xmlHttp = createXMLHttpRequest();
				xmlHttp.open("POST","<c:url value='/ClubServlet'/>",true);
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlHttp.send("method=load");
				xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		   				var text = eval("("+xmlHttp.responseText+")");
		   				for(var i=0;i<text.length;i++){
		   					var msg = document.createTextNode(text[i]);
		   					var div = document.createElement("div");
		   					var br = document.createElement("br");
		   					div.appendChild(msg);
		   					clubsObj.appendChild(div);
		   					clubsObj.appendChild(br);
		   				}
					}
				}; 
			}
			function loadFinds(){
				var findsObj=document.getElementById("finds");
				var xmlHttp = createXMLHttpRequest();
				xmlHttp.open("POST","<c:url value='/FindServlet'/>",true);
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				xmlHttp.send("method=load");
				xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
		   				var text = eval("("+xmlHttp.responseText+")");
		   				for(var i=0;i<text.length;i++){
		   					var msg = document.createTextNode(text[i]);
		   					var div = document.createElement("div");
		   					var br = document.createElement("br");
		   					div.appendChild(msg);
		   					findsObj.appendChild(div);
		   					findsObj.appendChild(br);
		   				}
					}
				}; 
			}
		</script>
	</head>
	<body>
		<div class="left">
		    <div class="left-top">
		     <div style="font-size: 25px;">公告栏</div>
		     <div style="margin-left: 50px;margin-top: 40px;width: 300px;color: white;">
		     	<p>1、请勿扰乱网站秩序</p>
		     	<p>2、有好的开发意见请投邮箱1226864411@qq.com</p>
		     	<p>3、请注册有效真实信息，否则系统将会封号。</p>
		     	<p>4、西邮校园是为广大西邮学子服务的免费网站。</p>
		     </div>
		    </div>
			<div class="left-bottom">
		    	<div style="font-size: 25px;">纳新</div>
		    	<marquee style="margin-left: 80px;color: white;" id="clubs" behavior="scroll" direction="up" height="200" width="300"  vspace="20" loop="-1" scrollamount="10" scrolldelay="200" onMouseOut="this.start()" onMouseOver="this.stop()">
		    	</marquee>
		    </div>
		</div>
		<div id="box">
			 <div id="box01">
			 	 <div class="box01_1" id="rollImage">		 	     
			 	 	 <div><img src="<c:url value='/images/xiyouxy.jpg'/>"></div>
			 	     <div><img src="<c:url value='/images/02.jpg'/>"></div>
			 	     <div><img src="<c:url value='/images/03.jpg'/>"></div>
			 	     <div><img src="<c:url value='/images/04.jpg'/>"></div>   
			 	 </div>
			 	 <input type="button" value="<"/>
			 	 <input type="button" value=">" style="margin-left:463px;"/>
			 </div>
			 <div id="box02">
			 	  <p style="display:block;">西邮校园</p>
	              <p>美丽的银杏林</p>
	              <p>夜晚的教学楼</p>
	              <p>西安邮电大学</p>
			 	  <div class="box_btn">
				 	  <input type="button" value="1" style="background:#f00;"/>
				 	  <input type="button" value="2"/>
				 	  <input type="button" value="3"/>
				 	  <input type="button" value="4"/>
			 	  </div>
			 </div>
		</div>
		<div class="middle">
			<p style="color: silver;margin-left: 245px;font-size: 20px">快速通道</p><br>
			<div style="margin-left: 70px;position: absolute;">
				<a href="http://222.24.62.120/" target="blank"><img src="<c:url value="/images/jiao.png"/>"/></a>
				<p>教务系统</p>
			</div>
			<div style="margin-left: 262px;position: absolute;">
				<a href="http://sztz.xupt.edu.cn/" target="blank"><img src="<c:url value="/images/sutuo.jpg"/>"/></a>
				<p>素质拓展</p>
			</div>
			<div style="margin-left: 420px;position: absolute;">
				<a href="http://jwkq.xupt.edu.cn:8080/" target="blank"><img src="<c:url value="/images/zhi.jpg"/>"/></a>
				<p>智慧教室</p>
			</div><br>
			<div style="margin-left: 70px;position: absolute;margin-top: 57px">
				<a href="http://ztc.xupt.edu.cn:8080/" target="blank"><img src="<c:url value="/images/library.jpg"/>"/></a>
				<p>校园信息</p>
			</div>
			<div style="margin-left: 262px;position: absolute;absolute;margin-top: 57px">
				<a href="http://lib.xupt.edu.cn/" target="blank"><img src="<c:url value="/images/library.jpg"/>"/></a>
				<p>图书借阅</p>
			</div>
			<div style="margin-left: 420px;position: absolute;absolute;margin-top: 57px">
				<a href="http://elearn.xupt.edu.cn/meol/homepage/common/" target="blank"><img src="<c:url value="/images/wang.jpg"/>"/></a>
				<p>网络教学</p>
			</div>
		</div>
	
		<div class="right">
	    	<div class="right-top"><div style="font-size: 25px;">失物招领</div>
	    		<marquee id="loses" behavior="scroll" direction="up" height="200" width="300"  vspace="20" loop="-1" scrollamount="10" scrolldelay="200" onMouseOut="this.start()" onMouseOver="this.stop()"  style="color: white;">
		    	</marquee>
		    </div>
		    <div class="right-bottom"><div style="font-size: 25px;">寻物启事</div>
		       <marquee id="finds" behavior="scroll" direction="up" height="200" width="300"  vspace="20" loop="-1" scrollamount="10" scrolldelay="200" onMouseOut="this.start()" onMouseOver="this.stop()" style="color: white;">
			    </marquee>
		    </div>
		</div>
	</body>
</html>
