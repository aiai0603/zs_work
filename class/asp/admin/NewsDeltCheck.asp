<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from Article where id="&trim(request.QueryString("id"))&"" 
rs.open sql,conn,1,3
rs.delete
rs.close
set rs=nothing
response.write "<script language=javascript>alert('É¾³ý³É¹¦!');location='News.asp';</script>"
%>