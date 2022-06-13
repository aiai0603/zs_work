<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%

title=trim(request("title"))
id=trim(trim(request("id")))


if request("action")="add" then	
	set rs=server.createobject("adodb.recordset")
	sql="select * from lanmu" 
	rs.open sql,conn,1,3

	rs.addnew
		rs("lanmu")=title
		
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('添加栏目成功!');location='lanmu.asp';</script>"
	
	

elseif request("action")="edit" then
	set rs=server.createobject("adodb.recordset")
	sql="select * from lanmu where id="&id&""
	rs.open sql,conn,3,3	
		rs("lanmu")=title
			
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('修改栏目成功!');location='lanmu.asp';</script>"
end if
%>

