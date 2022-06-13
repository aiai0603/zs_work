<!--#include file="conn.asp"-->
<%
set rs=server.createobject("ADODB.recordset")
sql="select * from Article where id="&trim(request("id"))
rs.open sql,conn,1,1
Response.ContentType="image/*"
Response.BinaryWrite rs("pc").getChunk(8000000)
rs.close
set rs=nothing
%>