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
		<title>��Ա��Ϣ</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="���ģ����鼦������־">
		<meta name="description" content="����֮����һ���������ĵķ����������̳">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/ע���.css" />
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
			if (document.form1.zhanghao.value.length < 4 || document.form1.zhanghao.value.length > 20) {
				window.alert("�˺Ų��淶");
				return false;
			}
			if (document.form1.mima.value.length < 6 || document.form1.mima.value.length > 20) {
				window.alert("���벻�淶");
				return false;
			}
			if (document.form1.mima2.value != document.form1.mima.value) {
				window.alert("��֤����ʧ��");
				return false;
			}
			if (document.form1.tele.value.length != 11) {
				window.alert("�ֻ�����");
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
				
				
					<div class="main">
                    
						<form method="post" action="admin/yhSave2.asp?action=edit&zhanghao=<%=rs("zhanghao")%>" onsubmit="return check()" name="form1">
						<h2 style="font-size: 40px;margin-bottom: 20px;margin-right: 145px;">������Ϣ</h2>
						<div class="line">
							<div class="div1">�û���:</div>
							<div class="div2"><input type="text" name="zhanghao" value="<% =rs("zhanghao")%>"></div>
							<div class="div3">4-20λ�ַ�����֧�ֺ��֣�֧����ĸ���������</div>
				
						</div>
						<div class="line">
							<div class="div1">����������:</div>
							<div class="div2"><input type="text" name="mima" value="<% =rs("mima")%>"></div>
							<div class="div3">6-20λ�ַ�����֧�ֺ��֣�֧����ĸ���������</div>
						</div>
						<div class="line">
							<div class="div1">��ȷ������:</div>
							<div class="div2"><input type="password" name="mima2"></div>
							<div class="div3">���ٴ���������</div>
						</div>
						<div class="line">
							<div class="div1">��֤�ֻ�:</div>
							<div class="div2"><input type="text" name="tele" value="<% =rs("tele")%>"></div>
							<div class="div3">������ú�������ֻ��һ�����</div>
						</div>
						
						<div class="register">
						  <input type="submit" name="submit" class="submit" value="�޸�����" /> 				
						 
						</div>
						<div>
							 <input type="button" class="submit" value="�˳��˺�" onclick="location='admin/exit.asp';"/>
						</div>
                 
                        
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
   rs.close
set rs=nothing
rs1.close
set rs=nothing
    %>
	</html>
	

	
