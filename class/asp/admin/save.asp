<!--#include file="conn.asp"-->
<%

	
	Set rs=server.createobject("adodb.recordset")
	id = Trim(Request("id"))
	 sql = "Select * From Article Where id ="&id&" "
     rs.open sql,conn,3,3
	 
if request("action")="zan" then
	zan=rs("zan")
	rs("zan")=zan+1
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('点赞成功!');location='../内容.asp?id="&id&" ';</script>"
elseif request("action")="bi" then
	bi=rs("bi")
	rs("bi")=bi+1
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('打赏成功!');location='../内容.asp?id="&id&" ';</script>"
	
elseif request("action")="save" then
	save=rs("save")
	rs("save")=save+1
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('收藏成功!');location='../内容.asp?id="&id&" ';</script>"
	
end if

	


		
%>
