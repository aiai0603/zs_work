<!DOCTYPE html>
<!--#include virtual="inc/conn.asp"-->
<%
 Set rs1=server.createobject("adodb.recordset")
	 sql="select top 4 * from lanmu"
     rs1.open sql,conn,1,3
	 
	 id= request("lanmuid")
	 
	Set rs=server.createobject("adodb.recordset")
	 sql="select  * from Article where lanmuid="&id&""
     rs.open sql,conn,1,3 
	 if rs.eof then 
	 response.write "<script language=javascript>alert('栏目为空，无法访问!');location='主页.asp';</script>"
end if
	 
	 Set rs2=server.createobject("adodb.recordset")
	 sql="select top 3 * from Article where lanmuid="&id&" and hot=1"
     rs2.open sql,conn,1,3 
	 
	 Set rs3=server.createobject("adodb.recordset")
	 sql="select * from Article where lanmuid="&id&" order by readtime"
     rs3.open sql,conn,1,3 
	 
	 Set rs4=server.createobject("adodb.recordset")
	 sql="select * from Article where lanmuid="&id&" order by zan"
     rs4.open sql,conn,1,3 
	 
	 rs.PageSize=9
	'设置并读取页码参数page
	iPage=CLng(Request("page"))
	If iPage <= 0 Then
		iPage = 1
	End If
	If iPage > rs.PageCount Then
		iPage = rs.PageCount
	End If
	rs.AbsolutePage = iPage
	RowCount = rs.PageSize
	'依次显示课程表信息
	
%>
<html>
	<head>
		<meta charset="gb2312">
		<title></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="美文，心灵鸡汤，励志">
		<meta name="description" content="心情之旅是一个欣赏美文的放松心情的论坛">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/列表.css" />
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
			if (!myAuto.paused) {
				myAuto.pause();
			} else {
				myAuto.play();
			}

		}
		window.onload = function() {
			showDate();
			setInterval(showDate, 1000);
			var myAuto = document.getElementById("myaudio");
			myAuto.play();



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
			<div id="tiao">
				<input type="text" name="search" id="search" placeholder="&nbsp请输入作品名称" />
				<input type="button" name="put up" id="tijiao" value="搜索" />
			</div>
			<div id="main">
				<div id="up">
					<div id="left">
						<h2>精华作品</h2>
						<div id="tui">
							 <%
								i=1
								Do While Not RS2.EOF

							%>
							<div>

								<h3><%=rs2("title")%></h3>
								 <img src="admin/showimg.asp?id=<%=rs2("id")%>" >
								<article>

									<%=rs2("Content")%>
								</article>
								<a href="内容.asp?id=<%=rs2("id")%>" class="yue">
									阅读全文>
								</a>
							</div>
							<%
								RS2.MoveNext
								i=i+1
   								 Loop
							%>
							
						</div>
					</div>

					<div id="right">
						<h2>热门排行</h2>
						<ul>
                        	<%
								i=1
								Do While Not i=6 and Not RS3.EOF

							%>

							<li>
								<a href="内容.asp?id=<%=rs3("id")%>">
									<div><%=i%></div><p><%=rs3("title")%></p>
									<article class="ping"> <img src="admin/showimg.asp?id=<%=rs3("id")%>"  class="ping" ><div>阅读全文
										
									</div></article>
									
								</a>
								
							</li>
                            <%
								RS3.MoveNext
								i=i+1
   								 Loop
							%>
						</ul>
						<h2>点赞最多</h2>
						<ul>

							<%
								i=1
								Do While Not i=4 and Not RS4.EOF

							%>

							<li>
								<a href="内容.asp?id=<%=rs4("id")%>">
									<div><%=i%></div><p><%=rs4("title")%></p>
									<article class="ping"> <img src="admin/showimg.asp?id=<%=rs4("id")%>"  class="ping" ><div>阅读全文
										
									</div></article>
									
								</a>
								
							</li>
                            <%
								RS4.MoveNext
								i=i+1
   								 Loop
							%>
							
						</ul>

					</div>

				</div>


				<div id="down">
					<h2 id="quanbu">全部作品</h2>
					<div id="text-all">
						<ul>
                         	<%
								i=1
								Do While Not RS.EOF And RowCount

							%>
							<li class="text-1">
								<a href="内容.asp?id=<%=rs("id")%>" title="阅读全文">
                                <img src="admin/showimg.asp?id=<%=rs("id")%>" >
									<div class="wz">
										<h3><%=rs("title")%></h3>
										<article>
											<%=rs("content")%>
										</article>
										
										
										<span> &#xf040;：<%=rs("author")%>&nbsp;&nbsp;&nbsp;&#xf06e; ：<%=rs("readtime")%>&nbsp;&nbsp;&nbsp;&#xf087;：<%=rs("zan")%></span>
									</div>

								</a>
							</li>
                              
                            <%
								RS.MoveNext
								i=i+1
								RowCount = RowCount - 1
   								Loop
							%>
							
						</ul>
					</div>
					



				</div>
                <div id="ye">
                   <%
Response.Write("第 "+cstr(iPage)+" 页/总 "+cstr(rs.pagecount)+" 页　")
If iPage = 1 Then
	Response.Write("首页　上一页")
Else
	Response.Write("<a href='列表.asp?lanmuid="&id&"&page=1'>首页</a>　<a href='列表.asp?lanmuid="&id&"&page="+cstr(iPage-1)+"'>上一页</a>")
End If
	Response.Write("&nbsp;&nbsp;")
If iPage = rs.PageCount Then
	Response.Write("下一页　尾页")
Else
	Response.Write("<a href='列表.asp?lanmuid="&id&"&page="+cstr(iPage+1)+"'>下一页</a>　<a href='列表.asp?lanmuid="&id&"&page="+cstr(rs.PageCount)+"'>尾页</a>")
End If
	Response.Write("&nbsp;&nbsp;")
If rs.PageCount > 1 Then
	Response.Write("分页：")
	For i = 1 to rs.PageCount
		Response.Write("[<a href='列表.asp?lanmuid="&id&"&page="& i &"'>")
		Response.Write( ""& i & "</a>]&nbsp;")
	Next
End If
%>
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
rs2.close
set rs=nothing
rs3.close
set rs=nothing
rs4.close
set rs=nothing
%>
</html>
