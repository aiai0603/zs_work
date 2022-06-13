<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%

title=trim(request("title"))
id=trim(trim(request("id")))


if request("action")="add" then	
	set rs=server.createobject("adodb.recordset")
	sql="select * from gg" 
	rs.open sql,conn,1,3

	rs.addnew
		rs("content")=title
		
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('添加公告成功!');location='gg.asp';</script>"
	
	

elseif request("action")="edit" then
	set rs=server.createobject("adodb.recordset")
	sql="select * from gg where id="&id&""
	rs.open sql,conn,3,3	
		rs("content")=title
			
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('修改公告成功!');location='gg.asp';</script>"
end if
%>

