<%@ language="VBScript" %>
<%
  Option Explicit

  Const lngMaxFormBytes = 200

  Dim objASPError, blnErrorWritten, strServername, strServerIP, strRemoteIP
  Dim strMethod, lngPos, datNow, strQueryString, strURL

  If Response.Buffer Then
    Response.Clear
    Response.Status = "500 Internal Server Error"
    Response.ContentType = "text/html"
    Response.Expires = 0
  End If

  Set objASPError = Server.GetLastError
%>
<html dir=ltr>
<head>
<style>
a:link			{font:9pt 宋体; color:FF0000}
a:visited		{font:9pt 宋体; color:#4e4e4e}
</style>
<META NAME="ROBOTS" CONTENT="NOINDEX">

<title>程序出错了！</title>
<STYLE type=text/css>A:link {
	COLOR: #000000; TEXT-DECORATION: none
}
A:active {
	COLOR: #000000; TEXT-DECORATION: none
}
A:visited {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #4455aa; TEXT-DECORATION: underline
}
BODY {
	BACKGROUND-COLOR: #ffffff; COLOR: #000000; FONT-FAMILY: 宋体; FONT-SIZE: 12px; scrollbar-face-color: #DEE3E7; scrollbar-highlight-color: #FFFFFF; scrollbar-shadow-color: #DEE3E7; scrollbar-3dlight-color: #D1D7DC; scrollbar-arrow-color: #006699; scrollbar-track-color: #EFEFEF; scrollbar-darkshadow-color: #98AAB1
}
TD {
	FONT-FAMILY: 宋体; FONT-SIZE: 12px; LINE-HEIGHT: 15px
}
TH {
	BACKGROUND-COLOR: #4455aa; BACKGROUND-IMAGE: url(/error/images/bg1.gif); COLOR: white; FONT-SIZE: 12px; FONT-WEIGHT: bold
}
TD.TableTitle2 {
	BACKGROUND-COLOR: #e4e8ef
}
TD.TableBody1 {
	BACKGROUND-COLOR: #ffffff
}
TD.TableBody2 {
	BACKGROUND-COLOR: #e4e8ef
}
TD.TopDarkNav {
	BACKGROUND-IMAGE: url(images/topbg.gif)
}
TD.TopLighNav {
	BACKGROUND-IMAGE: url(images/bottombg.gif)
}
TD.TopLighNav1 {
	BACKGROUND-IMAGE: url(images/tabs_m_tile.gif)
}
TD.TopLighNav2 {
	BACKGROUND-COLOR: #ffffff
}
.tableBorder1 {
	BACKGROUND-COLOR: #6595d6; BORDER-BOTTOM: 1px; BORDER-LEFT: 1px; BORDER-RIGHT: 1px; BORDER-TOP: 1px; WIDTH: 97%
}
.tableBorder2 {
	BACKGROUND-COLOR: #efefef; BORDER-BOTTOM: #dedede 1px solid; BORDER-LEFT: #dedede 1px solid; BORDER-RIGHT: #dedede 1px solid; BORDER-TOP: #dedede 1px solid; WIDTH: 97%
}
#TableTitleLink A:link {
	COLOR: #ffffff; TEXT-DECORATION: none
}
#TableTitleLink A:visited {
	COLOR: #ffffff; TEXT-DECORATION: none
}
#TableTitleLink A:active {
	COLOR: #ffffff; TEXT-DECORATION: none
}
#TableTitleLink A:hover {
	COLOR: #ffffff; TEXT-DECORATION: underline
}
INPUT {
	FONT-FAMILY: Tahoma,Verdana,宋体; FONT-SIZE: 12px; LINE-HEIGHT: 15px
}
SELECT {
	FONT-FAMILY: Tahoma,Verdana,宋体; FONT-SIZE: 12px; LINE-HEIGHT: 15px
}
TEXTAREA {
	FONT-FAMILY: Tahoma,Verdana,宋体; FONT-SIZE: 12px; LINE-HEIGHT: 15px
}
.normalTextSmall {
	COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; FONT-SIZE: 11px
}
</STYLE>

<META HTTP-EQUIV="Content-Type" Content="text-html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>
<body bgcolor="FFFFFF">
<table align=center cellpadding=3 cellspacing=1 class=tableborder1 
style="WIDTH: 75%" height="183">
  <tbody> 
  <tr align=middle> 
    <th colspan=2 height=9 width="100%">Internet 信息服务－HTTP 500.100 - 内部服务器错误 - 
      ASP 错误 
  </tr>
  <tr> 
    <td class=tablebody1 colspan=2 width="100%" height="220"><b>产生错误的可能原因：</b><br>
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="4" align="center">
        <tr> 
          <td height="30" width="19%" class="TableBody1"><font color="#0066FF"> 
            错误类型： </font></td>
          <td height="30" width="81%"> 
            <%
  Dim bakCodepage
  bakCodepage = Session.Codepage
  Session.Codepage = 936
  Response.Write Server.HTMLEncode(objASPError.Category)
  If objASPError.ASPCode > "" Then Response.Write Server.HTMLEncode(", " & objASPError.ASPCode)
  Response.Write Server.HTMLEncode(" (0x" & Hex(objASPError.Number) & ")" ) & "<br>"

  If objASPError.ASPDescription > "" Then Response.Write Server.HTMLEncode(objASPError.ASPDescription) & "<br>"

  blnErrorWritten = False

  ' Only show the Source if it is available and the request is from the same machine as IIS
  If objASPError.Source > "" Then
    strServername = LCase(Request.ServerVariables("SERVER_NAME"))
    strServerIP = Request.ServerVariables("LOCAL_ADDR")
    strRemoteIP =  Request.ServerVariables("REMOTE_ADDR")
    If (strServername = "localhost" Or strServerIP = strRemoteIP) And objASPError.File <> "?" Then
      Response.Write Server.HTMLEncode(objASPError.File)
      If objASPError.Line > 0 Then Response.Write ", 第 " & objASPError.Line & " 行"
      If objASPError.Column > 0 Then Response.Write ", 第 " & objASPError.Column & " 列"
      Response.Write "<br>"
      Response.Write "<font style=""COLOR:000000; FONT: 9pt 宋体""><b>"
      Response.Write Server.HTMLEncode(objASPError.Source) & "<br>"
      If objASPError.Column > 0 Then Response.Write String((objASPError.Column - 1), "-") & "^<br>"
      Response.Write "</b></font>"
      blnErrorWritten = True
    End If
  End If

  If Not blnErrorWritten And objASPError.File <> "?" Then
    Response.Write "<b>"
    Response.Write Server.HTMLEncode(objASPError.File)
    If objASPError.Line > 0 Then Response.Write Server.HTMLEncode(", 第 " & objASPError.Line & " 行")
    If objASPError.Column > 0 Then Response.Write ", 第 " & objASPError.Column & " 列"
    Response.Write "</b><br>"
  End If
%>
          </td>
        </tr>
        <tr> 
          <td width="19%" height="30" class="TableBody1"><font color="#0066FF">原始程序：</font></td>
          <td width="81%" height="30"><%= objASPError.source %></td>
        </tr>
        <tr> 
          <td width="19%" height="30" class="TableBody1"><font color="#0066FF">错误信息：</font></td>
          <td width="81%" height="30"><%= objASPError.Description %></td>
        </tr>
        <tr> 
          <td width="19%" height="30" class="TableBody1"><font color="#0066FF">ASP错误信息：</font></td>
          <td width="81%" height="30"><%= objASPError.aspDescription  %></td>
        </tr>
        <tr> 
          <td width="19%" height="30" class="TableBody1"><font color="#0066FF">出错页面：</font></td>
          <td width="81%" height="30"> 
            <%
  strMethod = Request.ServerVariables("REQUEST_METHOD")

  Response.Write strMethod & " "

  If strMethod = "POST" Then
    Response.Write Request.TotalBytes & " bytes to "
  End If

  Response.Write Request.ServerVariables("SCRIPT_NAME")

  lngPos = InStr(Request.QueryString, "|")

  If lngPos > 1 Then
    Response.Write "?" & Left(Request.QueryString, (lngPos - 1))
  End If

  Response.Write "</li>"

  If strMethod = "POST" Then
    Response.Write "<p><li>POST 数据:<br>"
    If Request.TotalBytes > lngMaxFormBytes Then
       Response.Write Server.HTMLEncode(Left(Request.Form, lngMaxFormBytes)) & " . . ."
    Else
      Response.Write Server.HTMLEncode(Request.Form)
    End If
    Response.Write "</li>"
  End If

%>
          </td>
        </tr>
        <tr> 
          <td width="19%" height="30" class="TableBody1"><font color="#0066FF">浏览器类型：</font></td>
          <td width="81%" height="30"><%= Request.ServerVariables("HTTP_USER_AGENT") %></td>
        </tr>
        <tr> 
          <td width="19%" height="30" class="TableBody1"><font color="#0066FF">出错时间：</font></td>
          <td width="81%" height="30"> 
            <%
  datNow = Now()

  Response.Write Server.HTMLEncode(FormatDateTime(datNow, 1) & ", " & FormatDateTime(datNow, 3))
  Session.Codepage = bakCodepage
%>
          </td>
        </tr>
      </table>       
    </td>
  </tr>
  <tr> 
    <td align=center class=tablebody2 colspan=2 valign=center><a href=javascript:history.back()>[返回]</a></td>
  </tbody> 
</table>
</body>
</html>
