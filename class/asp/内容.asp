<!DOCTYPE html>
<!--#include virtual="inc/conn.asp"-->
<html>
<%
		id = Trim(Request("id"))
	
	 
	 Set rs=server.createobject("adodb.recordset")

	 sql = "Select * From Article Where id ="&id&" "
     rs.open sql,conn,1,3
	 
	 Set rs1=server.createobject("adodb.recordset")
	 sql="select top 4 * from lanmu"
     rs1.open sql,conn,1,3
	 
	 Set rs2=server.createobject("adodb.recordset")

	 sql = "Select * From Article where hot=1"
     rs2.open sql,conn,1,3
%>

	<head>
		<meta charset="gb2312">
		<title><%= rs("title") %></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="美文，心灵鸡汤，励志">
		<meta name="description" content="心情之旅是一个欣赏美文的放松心情的论坛">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/文章.css" id="style" />
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
		
		function check() {
			if (document.myform2.pingtext.value == "") {
				window.alert("评论为空！");
				return false;
			}

			if (document.myform2.select.value == '请选择') {
				window.alert("打分为空！");
				return false;
			}



		}

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
			if (!myAuto.paused) {
				myAuto.pause();
			} else {
				myAuto.play();
			}

		}

		
			
		window.onload = function() {

			showDate();
			setInterval(showDate, 1000);
			var myAuto = document.getElementById('myaudio');
			myAuto.play();

			var stylemood = 1;
			var changestyle = document.getElementById("change");

			changestyle.onmousedown = function() {
				if (stylemood == 1) {
					document.getElementById("style").href = "css/文章夜间.css";
					stylemood = 0;
					this.innerHTML = "取消夜间模式";
				} else {
					document.getElementById("style").href = "css/文章.css";
					stylemood = 1;
					this.innerHTML = "夜间模式";
				}
			}

		};
	
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

			<div id="main">
				<div id="left">
					<div id="zuozhe">
						<h2>作者信息</h2>
						<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="80%" color=#987cb9 SIZE=10>

						<div id="xinxi">


							<img src="图片/头像.jpg">

							<h1><%=rs("author")  %></h1>


							<h3>本站签约作者</h3>
							

						</div>
					</div>
					<div id="zp">


						<h2> 热门作品：</h2>
						<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="80%" color=#987cb9 SIZE=10>
						<div id="more">
							<ul>
								 <%
								i=1
								Do While Not rs2.eof and not i=6

							%>
                           <li>
									<a href="内容.asp?id=<%= rs2("id") %>">
										<p><%= rs2("title") %></p>
										<article class="ping"><img src="<%= rs2("pc")%>" class="ping">
											<div>阅读全文

											</div>
										</article>

									</a>

								</li>
                            
                            <%
								RS2.MoveNext
								i=i+1
   								 Loop
							%>
								

							</ul>


						</div>
					</div>


					
				</div>
				<article id="zw">
					<div id="biaoti" align="center">
						<%= rs("title") %>
						<div id="bg">
							<a id="change" href="#">夜间模式</a>
							<p>编辑：<%= rs("author") %>&nbsp;&nbsp;&nbsp;<%= rs("date") %></p>
						</div>
					</div>

					<div id="zhengwen">

						
						<%= rs("content") %>





					</div>
					
						
                        <div id="dilan">
							<a href="admin/save.asp?action=zan&id=<%= rs("id") %>" id="zan" title="点赞/取消点赞">
								&#xf087
							</a>
							<a href="admin/save.asp?action=bi&id=<%= rs("id") %>" id="gift" title="打赏/取消打赏">
								&#xf0d6
							</a>
	
							<a href="admin/save.asp?action=save&id=<%= rs("id") %>" id="zhuanfa" title="收藏/取消收藏">
								&#xf005
							</a>
						</div>
						<div id="shuzi">
							<div id="zan1">
								<%= rs("zan") %>
							</div>
							<div id="gift1">
								<%= rs("bi") %>
							</div>
	
							<div id="zhuanfa1">
								<%= rs("save") %>
							</div>
						</div>
	
	
					</article>
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
	
	
	</html>
  <%  
	readtime=rs("readtime")
	sql1 = "update Article set readtime="& readtime &"+1 Where id ="& id &" "
	conn.Execute(sql1)
    rs.Close
	
set rs=nothing
   rs1.Close
	
set r1s=nothing
   rs2.Close
	
set r2s=nothing
	
   
 %>
	
