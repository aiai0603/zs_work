<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%
id=request.QueryString("id")
Response.Write(id)
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
	response.write "<script language=javascript>alert('注册用户成功!');location='yh.asp';</script>"
	
	

elseif request("action")="edit" then
	set rs=server.createobject("adodb.recordset")
	sql="select * from yh where id="&id&""
	rs.open sql,conn,3,3	
		rs("zhanghao")=zhanghao
		rs("mima")=mima
		rs("tele")=tele
	rs.update
	rs.close
	set rs=nothing
	response.write "<script language=javascript>alert('修改用户信息成功!');location='yh.asp';</script>"
end if
%>
