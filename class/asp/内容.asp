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
		<meta name="keywords" content="���ģ����鼦������־">
		<meta name="description" content="����֮����һ���������ĵķ����������̳">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/����.css" id="style" />
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
				window.alert("����Ϊ�գ�");
				return false;
			}

			if (document.myform2.select.value == '��ѡ��') {
				window.alert("���Ϊ�գ�");
				return false;
			}



		}

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
					document.getElementById("style").href = "css/����ҹ��.css";
					stylemood = 0;
					this.innerHTML = "ȡ��ҹ��ģʽ";
				} else {
					document.getElementById("style").href = "css/����.css";
					stylemood = 1;
					this.innerHTML = "ҹ��ģʽ";
				}
			}

		};
	
	</script>
	<body>
		<audio src="����/��������2.mp3" id="myaudio" controls loop hidden="true" autoplay="autoplay"></audio>
		<div id="all" align="center">
	
	
			<div class="nav">
				<a href="��ҳ.asp" class="icon-1" title="������ҳ">
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
				<div id="left">
					<div id="zuozhe">
						<h2>������Ϣ</h2>
						<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="80%" color=#987cb9 SIZE=10>

						<div id="xinxi">


							<img src="ͼƬ/ͷ��.jpg">

							<h1><%=rs("author")  %></h1>


							<h3>��վǩԼ����</h3>
							

						</div>
					</div>
					<div id="zp">


						<h2> ������Ʒ��</h2>
						<hr style="FILTER: alpha(opacity=100,finishopacity=0,style=2)" width="80%" color=#987cb9 SIZE=10>
						<div id="more">
							<ul>
								 <%
								i=1
								Do While Not rs2.eof and not i=6

							%>
                           <li>
									<a href="����.asp?id=<%= rs2("id") %>">
										<p><%= rs2("title") %></p>
										<article class="ping"><img src="<%= rs2("pc")%>" class="ping">
											<div>�Ķ�ȫ��

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
							<a id="change" href="#">ҹ��ģʽ</a>
							<p>�༭��<%= rs("author") %>&nbsp;&nbsp;&nbsp;<%= rs("date") %></p>
						</div>
					</div>

					<div id="zhengwen">

						
						<%= rs("content") %>





					</div>
					
						
                        <div id="dilan">
							<a href="admin/save.asp?action=zan&id=<%= rs("id") %>" id="zan" title="����/ȡ������">
								&#xf087
							</a>
							<a href="admin/save.asp?action=bi&id=<%= rs("id") %>" id="gift" title="����/ȡ������">
								&#xf0d6
							</a>
	
							<a href="admin/save.asp?action=save&id=<%= rs("id") %>" id="zhuanfa" title="�ղ�/ȡ���ղ�">
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
	
