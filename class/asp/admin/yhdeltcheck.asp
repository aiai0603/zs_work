<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from yh where id="&trim(request.QueryString("id"))&"" 
rs.open sql,conn,1,3
rs.delete
rs.close
set rs=nothing
response.write "<script language=javascript>alert('ɾ���ɹ�!');location='yh.asp';</script>"
%>
