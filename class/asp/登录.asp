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
		<title>��Ա��¼</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="���ģ����鼦������־">
		<meta name="description" content="����֮����һ���������ĵķ����������̳">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/��¼.css" />
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
			var myAuto = document.getElementById('myaudio');
			myAuto.play();
		
		}
		
		
		function check() {
			if (document.form1.text.value=="") {
				window.alert("�˺�Ϊ��");
				return false;
			}
			if (document.form1.pw.value=="") {
				window.alert("����Ϊ��");
				return false;
			}
		
		
			return true;
		
		}
	
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
               
			</div>
				
				
					<div class="main">
						<form action="admin/yhcheck.asp" method="post" onsubmit="return check()" name="form1">
							<h2 >��ӭ��������֮��</h2>
							<div class="line">
								&#xf007&nbsp;�˺�<input type="text" name="zhanghao" class="text" />
							</div>
							<div class="line">
								&#xf007&nbsp;����<input type="password" name="mima" class="text" />
							</div>
							
								<input type="submit" value="��¼" class="button"/>
							
						</form>
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
	   rs1.Close
	
set rs1=nothing
 %>
</html>

	