<!--#include file="conn.asp"-->
<%
	

	zhanghao=trim(request("zhanghao"))
	mima=trim(request("mima"))



	set rs=server.createobject("adodb.recordset")
	sql="select * from yh where zhanghao='"&zhanghao&"'"
	rs.open sql,conn,1,3


	Do While Not RS.EOF

		if rs("mima")=mima then
			session("f")=1
		session("idid")=zhanghao
		response.write "<script language=javascript>alert('��¼�ɹ�!');location='../��ҳ.asp';</script>"
	
		end if
		rs.movenext
	Loop
	
	if session("f")=0 then
	response.write "<script language=javascript>alert('�˺Ż����������!');location='../��¼.asp';</script>"
	end if
%>
