<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%
id=request.QueryString("id")
Response.Write(id)
title=trim(request("title"))
lanmuid=trim(request("lanmu"))
hot=trim(request("hot"))
content=trim(request("content"))
author=trim(trim(request("author")))
date_1=trim(request("date"))

if request("action")="add" then	
	set rs=server.createobject("adodb.recordset")
	sql="select * from Article" 
	rs.open sql,conn,1,3

	rs.addnew
		rs("title")=title
		rs("hot")=hot
		rs("content")=content
		rs("author")=author
		rs("date")=date_1
		rs("readtime")=0
		rs("zan")=0
		rs("bi")=0
		rs("save")=0
		rs("lanmuid")=lanmuid
	rs.update
	imgid=rs("id")
	rs.close
	set rs=nothing
	response.write "<script language=javascript>location='imageAdd.asp?id="&imgid&"'</script>"
	
	

elseif request("action")="edit" then
	set rs=server.createobject("adodb.recordset")
	sql="select * from Article where id="&id&""
	rs.open sql,conn,3,3	
		rs("title")=title
		rs("hot")=hot
		rs("content")=content
		rs("author")=author
		rs("date")=date_1
		rs("lanmuid")=lanmuid
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>location='imageAdd.asp?id="&id&"'</script>"
end if
%>
