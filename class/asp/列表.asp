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
	 response.write "<script language=javascript>alert('��ĿΪ�գ��޷�����!');location='��ҳ.asp';</script>"
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
	'���ò���ȡҳ�����page
	iPage=CLng(Request("page"))
	If iPage <= 0 Then
		iPage = 1
	End If
	If iPage > rs.PageCount Then
		iPage = rs.PageCount
	End If
	rs.AbsolutePage = iPage
	RowCount = rs.PageSize
	'������ʾ�γ̱���Ϣ
	
%>
<html>
	<head>
		<meta charset="gb2312">
		<title></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="keywords" content="���ģ����鼦������־">
		<meta name="description" content="����֮����һ���������ĵķ����������̳">
		<meta name="robots" content="index,follow">
		<link rel="stylesheet" type="text/css" href="css/�б�.css" />
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
			<div id="tiao">
				<input type="text" name="search" id="search" placeholder="&nbsp��������Ʒ����" />
				<input type="button" name="put up" id="tijiao" value="����" />
			</div>
			<div id="main">
				<div id="up">
					<div id="left">
						<h2>������Ʒ</h2>
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
								<a href="����.asp?id=<%=rs2("id")%>" class="yue">
									�Ķ�ȫ��>
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
						<h2>��������</h2>
						<ul>
                        	<%
								i=1
								Do While Not i=6 and Not RS3.EOF

							%>

							<li>
								<a href="����.asp?id=<%=rs3("id")%>">
									<div><%=i%></div><p><%=rs3("title")%></p>
									<article class="ping"> <img src="admin/showimg.asp?id=<%=rs3("id")%>"  class="ping" ><div>�Ķ�ȫ��
										
									</div></article>
									
								</a>
								
							</li>
                            <%
								RS3.MoveNext
								i=i+1
   								 Loop
							%>
						</ul>
						<h2>�������</h2>
						<ul>

							<%
								i=1
								Do While Not i=4 and Not RS4.EOF

							%>

							<li>
								<a href="����.asp?id=<%=rs4("id")%>">
									<div><%=i%></div><p><%=rs4("title")%></p>
									<article class="ping"> <img src="admin/showimg.asp?id=<%=rs4("id")%>"  class="ping" ><div>�Ķ�ȫ��
										
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
					<h2 id="quanbu">ȫ����Ʒ</h2>
					<div id="text-all">
						<ul>
                         	<%
								i=1
								Do While Not RS.EOF And RowCount

							%>
							<li class="text-1">
								<a href="����.asp?id=<%=rs("id")%>" title="�Ķ�ȫ��">
                                <img src="admin/showimg.asp?id=<%=rs("id")%>" >
									<div class="wz">
										<h3><%=rs("title")%></h3>
										<article>
											<%=rs("content")%>
										</article>
										
										
										<span> &#xf040;��<%=rs("author")%>&nbsp;&nbsp;&nbsp;&#xf06e; ��<%=rs("readtime")%>&nbsp;&nbsp;&nbsp;&#xf087;��<%=rs("zan")%></span>
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
Response.Write("�� "+cstr(iPage)+" ҳ/�� "+cstr(rs.pagecount)+" ҳ��")
If iPage = 1 Then
	Response.Write("��ҳ����һҳ")
Else
	Response.Write("<a href='�б�.asp?lanmuid="&id&"&page=1'>��ҳ</a>��<a href='�б�.asp?lanmuid="&id&"&page="+cstr(iPage-1)+"'>��һҳ</a>")
End If
	Response.Write("&nbsp;&nbsp;")
If iPage = rs.PageCount Then
	Response.Write("��һҳ��βҳ")
Else
	Response.Write("<a href='�б�.asp?lanmuid="&id&"&page="+cstr(iPage+1)+"'>��һҳ</a>��<a href='�б�.asp?lanmuid="&id&"&page="+cstr(rs.PageCount)+"'>βҳ</a>")
End If
	Response.Write("&nbsp;&nbsp;")
If rs.PageCount > 1 Then
	Response.Write("��ҳ��")
	For i = 1 to rs.PageCount
		Response.Write("[<a href='�б�.asp?lanmuid="&id&"&page="& i &"'>")
		Response.Write( ""& i & "</a>]&nbsp;")
	Next
End If
%>
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
rs2.close
set rs=nothing
rs3.close
set rs=nothing
rs4.close
set rs=nothing
%>
</html>
