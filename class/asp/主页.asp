<!DOCTYPE html>
<!--#include virtual="inc/conn.asp"-->
<html>
	<head>
		<meta charset="gb2312">
		<title>����֮��</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="���ģ����鼦������־">
		<meta name="description" content="����֮����һ���������ĵķ����������̳">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/��ҳ.css" />
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
			var week = ["��", "һ", "��", "��", "��", "��", "��"];
			var hours = curDate.getHours();
			var mintues = curDate.getMinutes();
			var seconds = curDate.getSeconds();
			var str;
			str = year + "��" + time(month) + "��" + time(date) + "��&nbsp;&nbsp;" + "����" + week[day] + "&nbsp;&nbsp;" + time(hours) +
				"ʱ" + time(mintues) + "��" + time(seconds) + "��";
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

		<audio src="����/��������2.mp3" id="myaudio" controls loop hidden="true" autoplay="autoplay"></audio>
		<div id="all" align="center">
			<div class="nav">
				<a href="#" class="icon-1" title="������ҳ">
					&#xf015 &nbsp����֮��
				</a>
				<ul>
					
					<li><a href="��ҳ.asp" >��ҳ</a></li>
                   			 <%
								i=1
								Do While Not RS1.EOF

							%>
                            <li><a href="�б�.asp?lanmuid=<%=rs1("id")%>"><%=rs1("lanmu")%></a></li>
                            
                            <%
								RS1.MoveNext
								i=i+1
   								 Loop
							%>
					
					<li><a href="ע���.asp">ע���Ա</a></li>
					<li>
						<div id="showtime"></div>
					</li>

				</ul>

				
				<a href="javascrip:void(0)" class="icon-3" title="��������" onclick="autoPlay()">&#xf001</a>
					<%
					if session("f")=0 then
					%>
					<a href="��¼.asp" class="icon-4" title="��Ա��¼">
					&#xf007
					</a>
					<%
					else
					%>
					<a href="�޸�.asp?zhanghao=<%=session("idid")%>" class="icon-4" title="�޸���Ϣ">
					&#xf007
					</a>
					<%
					end if
					%>
				
				<span  class="icon-2">
					<%
					if session("f")=0 then
					%>
					�ο�
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
						<h2 align="left">&#xf073; &nbsp;������</h2>
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
					<h2>��������</h2>
                  
					<div id="lan">
						<ul>
                       		 	<%
								i=1
								Do While Not rs3.EOF

								%>
							<li>
                            
								<a href="����.asp?id=<%=rs3("id")%>" id="lan<%=i%>" title="�Ķ�ȫ��">
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
						<a title="�Ķ�ȫ��"> <img id="leftimg" src="admin/showimg.asp?id=<%=rs5("id")%>" ></a>
						<div class="xljt-w" align="left">
							
							<ul style="height:300px;">
								<%
									i=0
									Do While Not rs5.EOF and not i=4
									
								%>
								<li title="�Ķ�" style="height:20%; border-bottom: #000000 1px dashed;margin-bottom: 10px;" onmousedown="location.href='����.asp?id=<%=rs5("id")%>'" onmouseover=" document.getElementById('leftimg').src='admin/showimg.asp?id=<%=rs5("id")%>'  ">	<h3><%=rs5("title")%></h3>	 <p style="width: 500px;" align="right"><%=rs5("author")%>&nbsp;&nbsp;<%=rs5("date")%></p></li>
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
							<li title="�Ķ�" style="height:20%; border-bottom: #000000 1px dashed;margin-bottom: 10px;" onmousedown="location.href='����.asp?id=<%=rs5("id")%>'" onmouseover=" document.getElementById('rightimg').src='admin/showimg.asp?id=<%=rs5("id")%>' ; ">	<h3><%=rs5("title")%></h3>	 <p style="width: 500px;" align="right"><%=rs5("author")%>&nbsp;&nbsp;<%=rs5("date")%></p></li>
							<%
								rs5.MoveNext
								i=i+1
									
								loop
							%>
								
							</ul>
						</div>
						<a  title="�Ķ�ȫ��"> <img id="rightimg" src="admin/showimg.asp?id=<%=j%>" ></a>
					</div>
						
					
                          
					<div class="link" align="center">
						<a href="�б�.asp?lanmuid=1">������></a>
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
								<a href="����.asp?id=<%=rs4("id")%>" title="�Ķ�ȫ��"> <%=rs4("title")%></a>
								
							</div>
						</div>
                         	<%
							rs4.MoveNext
							i=i+1
   							 Loop
							%>
						
					</div>
					<div class="link" align="center">
						<a href="�б�.asp?lanmuid=2">������></a>
					</div>
				</div>


			</div>
			<div id="under">
				<ul>

					<li><a href="��ҳ.asp">������ҳ&nbsp;|</a></li>
					<li><a href="#">��ϵ����&nbsp;|</a></li>
					<li><a href="#">��������&nbsp;|</a></li>
					<li><a href="admin/Login.asp">��̨����</a></li>

				</ul>
			</div>

			<div id="copyright">
				<div>Copyright (C) <a href="��ҳ.asp">����֮��</a> 2016-2020, All Rights Reserved </div>
				<address>ͨѶ��ַ��************** �绰��***********�������䣺1016868503@qq.com</address>
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
