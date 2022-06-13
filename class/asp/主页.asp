<!DOCTYPE html>
<!--#include virtual="inc/conn.asp"-->
<html>
	<head>
		<meta charset="gb2312">
		<title>心情之旅</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="美文，心灵鸡汤，励志">
		<meta name="description" content="心情之旅是一个欣赏美文的放松心情的论坛">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/主页.css" />
	</head>
	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
			border: 0;
			text-decoration: none;
		}
	</style>
    <%
	

	
	 Set rs3=server.createobject("adodb.recordset")
	 sql="select top 3 * from Article"
     rs3.open sql,conn,1,3
	 
	Set rs=server.createobject("adodb.recordset")
	 sql="select * from gg"
     rs.open sql,conn,1,3
	 
	 Set rs1=server.createobject("adodb.recordset")
	 sql="select top 4 * from lanmu"
     rs1.open sql,conn,1,3
	 
	 Set rs4=server.createobject("adodb.recordset")
	 sql="select top 3 * from Article where lanmuid=2"
     rs4.open sql,conn,1,3
	 
	  Set rs5=server.createobject("adodb.recordset")
	 sql="select top 8 * from Article where lanmuid=1"
     rs5.open sql,conn,1,3
	 
	  Set rs11=server.createobject("adodb.recordset")
	 sql="select top 2 * from lanmu"
     rs11.open sql,conn,1,3
%>
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
			var myAuto = document.getElementById("myaudio");
			 myAuto.play();
			var a1 = document.getElementById("lan1");
			var a2 = document.getElementById("lan2");
			var a3 = document.getElementById("lan3");
			document.getElementById("tui1").style.opacity = 1;
			document.getElementById("tui2").style.opacity = 0;
			document.getElementById("tui3").style.opacity = 0;
			a1.style.backgroundColor = "rgb(255,255,255,0.7)";
			a1.style.color = "rgba(100, 0, 200, 0.4)";
			a1.style.zIndex=2;
			a2.style.zIndex=1;
			a3.style.zIndex=0;
			a1.onmouseover = function() {
				document.getElementById("tui1").style.opacity = 1;
				document.getElementById("tui2").style.opacity = 0;
				document.getElementById("tui3").style.opacity = 0;
				a1.style.zIndex=2;
				a2.style.zIndex=1;
				a3.style.zIndex=0;
				a2.style.backgroundColor = "";
				a2.style.color = "white";
				a3.style.backgroundColor = "";
				a3.style.color = "white";
				this.style.backgroundColor = "rgb(255,255,255,0.7)";
				this.style.color = "rgba(100, 0, 200, 0.4)";
			}
			a2.onmouseover= function() {
				document.getElementById("tui1").style.opacity = 0;
				document.getElementById("tui2").style.opacity = 1;
				document.getElementById("tui3").style.opacity = 0;
				a2.style.zIndex=2;
				a3.style.zIndex=1;
				a1.style.zIndex=0;
				a1.style.backgroundColor = "";
				a1.style.color = "white";
				a3.style.backgroundColor = "";
				a3.style.color = "white";
				this.style.backgroundColor = "rgb(255,255,255,0.7)";
				this.style.color = "rgba(100, 0, 200, 0.4)";
			}
		
			a3.onmouseover = function() {
				document.getElementById("tui1").style.opacity = 0;
				document.getElementById("tui2").style.opacity = 0;
				document.getElementById("tui3").style.opacity = 1;
				a3.style.zIndex=2;
				a2.style.zIndex=1;
				a1.style.zIndex=0;
				a1.style.backgroundColor = "";
				a1.style.color = "white";
				a2.style.backgroundColor = "";
				a2.style.color = "white";
				this.style.backgroundColor = "rgb(255,255,255,0.7)";
				this.style.color = "rgba(100, 0, 200, 0.4)";
			}
			
			
		};
	</script>
	<body>

		<audio src="音乐/背景音乐2.mp3" id="myaudio" controls loop hidden="true" autoplay="autoplay"></audio>
		<div id="all" align="center">
			<div class="nav">
				<a href="#" class="icon-1" title="返回主页">
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
				<div id="daohang">
					<div id="adv">
						<ul>
							<li class="lunbo1">
								<span></span>
								<div></div>
							</li>
							<li class="lunbo2">
								<span></span>
								<div></div>
							</li>
							<li class="lunbo3">
								<span></span>
								<div></div>
							</li>
							<li class="lunbo4">
								<span></span>
								<div></div>
							</li>
						</ul>
					</div>
					<div id="gonggao">
						<h2 align="left">&#xf073; &nbsp;公告栏</h2>
						<div>
							<marquee direction="up" style="font-size:16px; color: black; height:400px;" onmouseout="this.start()"
							 onmouseover="this.stop()"
                             
                             title=" <%
								 i=1
								Do While Not RS.EOF

							%><<%=i%>.<%=rs("content")%>>
<%
								RS.MoveNext
								i=i+1
   								 Loop
							%>">
							<%
								Set rs7=server.createobject("adodb.recordset")
	 							sql="select * from gg"
     							rs7.open sql,conn,1,3
								Do While Not RS7.EOF
								

							%>
                           <%=rs7("content")%><br />
                            
                            <%
								RS7.MoveNext
								
   								 Loop
							%>
							</marquee>
						</div>
					</div>
				</div>
                 		
				<div id="tuijian">
					<h2>热门文章</h2>
                  
					<div id="lan">
						<ul>
                       		 	<%
								i=1
								Do While Not rs3.EOF

								%>
							<li>
                            
								<a href="内容.asp?id=<%=rs3("id")%>" id="lan<%=i%>" title="阅读全文">
									<%=rs3("title")%>
                                </a>
								<div id="tui<%=i%>">
									 <img src="admin/showimg.asp?id=<%=rs3("id")%>" >
									<article class="wen">
									<%=rs3("Content")%>
										
                           

									</article>
									
								</div>
							</li>
							<%
							rs3.MoveNext
							i=i+1
   							 Loop
							%>
								
						</ul>
					</div>
					<div id="tuijian1">

					</div>
				</div>
				<div id="xljt">
					<h2><%= rs11("lanmu") %></h2>
                    <% 
						rs11.movenext
					 %>
                     
                    			
					<div class="xljt-z">
						<a title="阅读全文"> <img id="leftimg" src="admin/showimg.asp?id=<%=rs5("id")%>" ></a>
						<div class="xljt-w" align="left">
							
							<ul style="height:300px;">
								<%
									i=0
									Do While Not rs5.EOF and not i=4
									
								%>
								<li title="阅读" style="height:20%; border-bottom: #000000 1px dashed;margin-bottom: 10px;" onmousedown="location.href='内容.asp?id=<%=rs5("id")%>'" onmouseover=" document.getElementById('leftimg').src='admin/showimg.asp?id=<%=rs5("id")%>'  ">	<h3><%=rs5("title")%></h3>	 <p style="width: 500px;" align="right"><%=rs5("author")%>&nbsp;&nbsp;<%=rs5("date")%></p></li>
								<%
									rs5.MoveNext
									i=i+1	
									loop
								%>
								
							</ul>
						
						
						
						</div>
					</div>
                   		
                    	
					<div class="xljt-z">
						<div class="xljt-w" align="left">
							
							<ul style="height:300px;">
							<%
								i=0
									if i=0 then
									j=rs5("id")
									end if
								Do While Not rs5.EOF and not i=4
								
							%>
							<li title="阅读" style="height:20%; border-bottom: #000000 1px dashed;margin-bottom: 10px;" onmousedown="location.href='内容.asp?id=<%=rs5("id")%>'" onmouseover=" document.getElementById('rightimg').src='admin/showimg.asp?id=<%=rs5("id")%>' ; ">	<h3><%=rs5("title")%></h3>	 <p style="width: 500px;" align="right"><%=rs5("author")%>&nbsp;&nbsp;<%=rs5("date")%></p></li>
							<%
								rs5.MoveNext
								i=i+1
									
								loop
							%>
								
							</ul>
						</div>
						<a  title="阅读全文"> <img id="rightimg" src="admin/showimg.asp?id=<%=j%>" ></a>
					</div>
						
					
                          
					<div class="link" align="center">
						<a href="列表.asp?lanmuid=1">进入板块></a>
					</div>
					
				</div>
				<div id="mrlz">
					<h2><%= rs11("lanmu") %></h2>
                   
					<div id="mrlz-z">
                   			 <%
								i=1
								Do While Not RS4.EOF

							%>
						<div class="mrlz-w">
							 <img src="admin/showimg.asp?id=<%=rs4("id")%>" >
							<div>
								<a href="内容.asp?id=<%=rs4("id")%>" title="阅读全文"> <%=rs4("title")%></a>
								
							</div>
						</div>
                         	<%
							rs4.MoveNext
							i=i+1
   							 Loop
							%>
						
					</div>
					<div class="link" align="center">
						<a href="列表.asp?lanmuid=2">进入板块></a>
					</div>
				</div>


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
rs5.close
set rs=nothing
rs3.close
set rs=nothing
rs4.close
set rs=nothing
rs11.close
set rs=nothing
%>
</html>
