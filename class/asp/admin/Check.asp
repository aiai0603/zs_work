<!--#include file="conn.asp"-->
<!--#include file="../inc/MD5.asp"-->
<%
'dim sql
dim RS_Check
dim name
dim companyid
dim pwd
dim errmsg
dim founderr

founderr=false
FoundUser=false

name		=replace(trim(Request("name")),"'","")
pwd			=replace(trim(Request("pwd")),"'","")
checkcode 	=trim(Request("checkcode"))

 	if Session("checkcode") = "" or checkcode = "" then
		session("checkcode")=""
		response.write "<script>alert('您输入验证码不对，请输入正确的验证码，方可进入管理页面');location='Login.asp';</script>"
		response.end
	end if
	
	if CStr(Session("checkcode")) <> CStr(checkcode) then
		session("checkcode")=""
		response.write "<script>alert('您输入验证码不对，请输入正确的验证码，方可进入管理页面');location='Login.asp';</script>"
		response.end	
	end if
	session("checkcode")= ""

set RS_Check=server.createobject("adodb.recordset")
SQL_Check="select admin_name,admin_pwd,admin_power from Tab_Admin where admin_name='"&name&"'"
RS_Check.open SQL_Check,Conn,1,1
if not(RS_Check.bof and RS_Check.eof) then
	if MD5(pwd)=RS_Check("admin_pwd") and name=RS_Check("admin_name") then
		session("name")=name
		session("flag")=1
  			if RS_Check("admin_power")="super" then 
	  			session("power")=1
				else if RS_Check("admin_power")="middle" then 
	  				session("power")=2
					else if RS_Check("admin_power")="primary" then 
	  					session("power")=3
					end if
				end if
			end if
   		response.redirect "Index.asp"
	else
      response.write "<script>alert('您输入用户名或密码不对，请输入正确的用户名和密码，方可进入管理页面');history.back();</script>"
	end if
else
response.write "<script>alert('您输入用户名或密码不对，请输入正确的用户名和密码，方可进入管理页面');history.back();</script>"
end if
RS_Check.close
set RS_Check=nothing
%>
