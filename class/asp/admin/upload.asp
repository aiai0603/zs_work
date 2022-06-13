<!--#include file="conn.asp"-->
<%
  id=trim(request.QueryString("id"))
  
  Response.Buffer=true
  
  formsize=Request.TotalBytes 
  formdata=Request.BinaryRead(formsize)
  bncrlf=chrb(13) & chrb(10)
  divider=leftb(formdata,clng(instrb(formdata,bncrlf))-1)
  datastart=instrb(formdata,bncrlf & bncrlf)+4
  dataend=instrb(datastart+1,formdata,divider)-datastart
  mydata=midb(formdata,datastart,dataend)
  
  
  
  
   
   
   
  set rec=server.CreateObject("adodb.recordset")
  rec.Open "select * from Article where id="&id&"",conn,3,3
  rec("pc").AppendChunk myData
  rec.update
  rec.close
  set rec=nothing
  response.write "<script language=javascript>alert('²Ù×÷³É¹¦!');location='News.asp';</script>"
%>