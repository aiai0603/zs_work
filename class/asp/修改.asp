<!DOCTYPE html>
<!--#include virtual="inc/conn.asp"-->
<html>
	<%
		zhanghao=trim(request.QueryString("zhanghao"))
    	 Set rs1=server.createobject("adodb.recordset")
		 sql="select top 4 * from lanmu"
    	 rs1.open sql,conn,1,3
		 
		set rs=server.createobject("adodb.recordset")
		sql="select * from yh where zhanghao='"&zhanghao&"'"
		rs.open sql,conn,1,1

    %>
	<head>
		<meta charset="gb2312">
		<title>会员信息</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="美文，心灵鸡汤，励志">
		<meta name="description" content="心情之旅是一个欣赏美文的放松心情的论坛">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/注册表.css" />
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
			if (document.form1.zhanghao.value.length < 4 || document.form1.zhanghao.value.length > 20) {
				window.alert("账号不规范");
				return false;
			}
			if (document.form1.mima.value.length < 6 || document.form1.mima.value.length > 20) {
				window.alert("密码不规范");
				return false;
			}
			if (document.form1.mima2.value != document.form1.mima.value) {
				window.alert("验证密码失败");
				return false;
			}
			if (document.form1.tele.value.length != 11) {
				window.alert("手机错误");
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
				
				
				<span  class="icon-2">
					<%
					if session("f")=0 then
					%>
					游客
					<%
					else
					%>
					<%=session("idid")%>
					<%
					end if
					%>
				</span>
			</div>
				
				
					<div class="main">
                    
						<form method="post" action="admin/yhSave2.asp?action=edit&zhanghao=<%=rs("zhanghao")%>" onsubmit="return check()" name="form1">
						<h2 style="font-size: 40px;margin-bottom: 20px;margin-right: 145px;">个人信息</h2>
						<div class="line">
							<div class="div1">用户名:</div>
							<div class="div2"><input type="text" name="zhanghao" value="<% =rs("zhanghao")%>"></div>
							<div class="div3">4-20位字符，不支持汉字，支持字母和数字组合</div>
				
						</div>
						<div class="line">
							<div class="div1">请设置密码:</div>
							<div class="div2"><input type="text" name="mima" value="<% =rs("mima")%>"></div>
							<div class="div3">6-20位字符，不支持汉字，支持字母和数字组合</div>
						</div>
						<div class="line">
							<div class="div1">请确认密码:</div>
							<div class="div2"><input type="password" name="mima2"></div>
							<div class="div3">请再次输入密码</div>
						</div>
						<div class="line">
							<div class="div1">验证手机:</div>
							<div class="div2"><input type="text" name="tele" value="<% =rs("tele")%>"></div>
							<div class="div3">完成设置后可以用手机找回密码</div>
						</div>
						
						<div class="register">
						  <input type="submit" name="submit" class="submit" value="修改资料" /> 				
						 
						</div>
						<div>
							 <input type="button" class="submit" value="退出账号" onclick="location='admin/exit.asp';"/>
						</div>
                 
                        
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
   rs.close
set rs=nothing
rs1.close
set rs=nothing
    %>
	</html>
	

	
