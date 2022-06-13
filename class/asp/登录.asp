<!DOCTYPE html>
<!--#include virtual="inc/conn.asp"-->
<html>
<%
			
    	 Set rs1=server.createobject("adodb.recordset")
		 sql="select top 4 * from lanmu"
    	 rs1.open sql,conn,1,3
    %>
	<head>
		<meta charset="gb2312">
		<title>会员登录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="美文，心灵鸡汤，励志">
		<meta name="description" content="心情之旅是一个欣赏美文的放松心情的论坛">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/登录.css" />
	</head>
	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
			border: 0;
			text-decoration: none;
		}
	</style>
	<script type="text/javascript">
		
		function showDate() {
			var curDate = new Date();
			var year = curDate.getFullYear();
			var month = curDate.getMonth() + 1;
			var date = curDate.getDate();
			var day = curDate.getDay();
			var week = ["日", "一", "二", "三", "四", "五", "六"];
			var hours = curDate.getHours();
			var mintues = curDate.getMinutes();
			var seconds = curDate.getSeconds();
			var str;
			str = year + "年" + time(month) + "月" + time(date) + "日&nbsp;&nbsp;" + "星期" + week[day] + "&nbsp;&nbsp;" + time(hours) +
				"时" + time(mintues) + "分" + time(seconds) + "秒";
			//document.write(str);
			document.getElementById("showtime").innerHTML = str;
		}

		function time(x) {
			return x > 9 ? x : "0" + x;
		}
		function autoPlay() {
			var myAuto = document.getElementById('myaudio');
			if(!myAuto.paused)
			{				
				myAuto.pause();
			}
			else{
				myAuto.play();
			}

		}
		window.onload = function() {
		
			showDate();
			setInterval(showDate, 1000);
			var myAuto = document.getElementById('myaudio');
			myAuto.play();
		
		}
		
		
		function check() {
			if (document.form1.text.value=="") {
				window.alert("账号为空");
				return false;
			}
			if (document.form1.pw.value=="") {
				window.alert("密码为空");
				return false;
			}
		
		
			return true;
		
		}
	
	</script>
	<body>
		<audio src="音乐/背景音乐2.mp3" id="myaudio" controls loop hidden="true" autoplay="autoplay"></audio>
		<div id="all" align="center">
			<div class="nav">
				<a href="主页.asp" class="icon-1" title="返回主页">
					&#xf015 &nbsp心情之旅
				</a>
				<ul>
					
				  <li><a href="主页.asp" >首页</a></li>
                   			 <%
								i=1
								Do While Not RS1.EOF

							%>
                            <li><a href="列表.asp?lanmuid=<%=rs1("id")%>"><%=rs1("lanmu")%></a></li>
                            
                            <%
								RS1.MoveNext
								i=i+1
   								 Loop
							%>
					
				  <li><a href="注册表.asp">注册会员</a></li>
					<li>
						<div id="showtime"></div>
					</li>

				</ul>

				
			  <a href="javascrip:void(0)" class="icon-3" title="背景音乐" onclick="autoPlay()">&#xf001</a>
				<%
				if session("f")=0 then
				%>
				<a href="登录.asp" class="icon-4" title="会员登录">
				&#xf007
				</a>
				<%
				else
				%>
				<a href="修改.asp?zhanghao=<%=session("idid")%>" class="icon-4" title="修改信息">
				&#xf007
				</a>
				<%
				end if
				%>
               
			</div>
				
				
					<div class="main">
						<form action="admin/yhcheck.asp" method="post" onsubmit="return check()" name="form1">
							<h2 >欢迎进入心情之旅</h2>
							<div class="line">
								&#xf007&nbsp;账号<input type="text" name="zhanghao" class="text" />
							</div>
							<div class="line">
								&#xf007&nbsp;密码<input type="password" name="mima" class="text" />
							</div>
							
								<input type="submit" value="登录" class="button"/>
							
						</form>
					</div>
				
			
			
	
				<div id="under">
				<ul>

					<li><a href="主页.asp">返回首页&nbsp;|</a></li>
					<li><a href="#">联系我们&nbsp;|</a></li>
					<li><a href="#">服务条款&nbsp;|</a></li>
					<li><a href="admin/Login.asp">后台管理</a></li>

				</ul>
			</div>

			<div id="copyright">
				<div>Copyright (C) <a href="主页.asp">心情之旅</a> 2016-2020, All Rights Reserved </div>
				<address>通讯地址：************** 电话：***********网管信箱：1016868503@qq.com</address>
			</div>
		</div>







	</body>
    <% 
	   rs1.Close
	
set rs1=nothing
 %>
</html>

	