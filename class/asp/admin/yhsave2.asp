<!--#include file="conn.asp"-->
<%
zhanghao=request.QueryString("zhanghao")
Response.Write(zhanghao)
zhanghao=trim(request("zhanghao"))
mima=trim(request("mima"))
tele=trim(request("tele"))


if request("action")="add" then	
	set rs=server.createobject("adodb.recordset")
	sql="select * from yh" 
	rs.open sql,conn,1,3

	rs.addnew
		rs("zhanghao")=zhanghao
		rs("mima")=mima
		rs("tele")=tele
		
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('ע���û��ɹ�!');location='../��ҳ.asp';</script>"
	
	

elseif request("action")="edit" then
	set rs=server.createobject("adodb.recordset")
	sql="select * from yh where zhanghao='"&zhanghao&"'"
	rs.open sql,conn,3,3	
		rs("zhanghao")=zhanghao
		rs("mima")=mima
		rs("tele")=tele
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('�޸��û���Ϣ�ɹ�!');location='../��ҳ.asp';</script>"
end if
%>
