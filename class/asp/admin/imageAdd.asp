<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<html>
<%
	id=request.QueryString("id")
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/Style.css" rel="stylesheet">
</head>

<body>
<table width="89%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" align="center">
  <form action="upload.asp?id=<%= id %> " method="post" enctype="multipart/form-data">
    <tr bgcolor="#F5F5F5">
      <td width="82" height="30" align="center" class="manager_orange_font_12px">图片：</td>
      <td width="551">&nbsp;
        <input name="title" type="file" size="65" maxlength="90" class="manager_input_1"></td>
    </tr>
    <tr bgcolor="#F5F5F5">
      <td height="30" colspan="2" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px"><span class="chinese">
        <input type="submit" name="Submit1" value="保 存" class="logbutton">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="Reset" value="上一步" class="logbutton" onclick="location.href='newsedit.asp?id=<% =id %>'" ></td>
    </tr>
  </form>
</table>
</body>
</html>