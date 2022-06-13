<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from gg where id="&trim(request.QueryString("id"))&""
rs.open sql,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/Style.css" rel="stylesheet">
</head>

<body>
<table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <form name="form1" action="ggSave.asp?action=edit&id=<%=rs("id")%>" method="post">
    <tr bgcolor="#F5F5F5">
      <td width="150" height="30" align="center" class="manager_orange_font_12px">公告内容：</td>
      <td>&nbsp;
          <input name="title" type="text" size="65" maxlength="90" class="manager_input_1" value="<%=rs("content")%>">      </td>
    </tr>
   
    </tr>
    <tr bgcolor="#F5F5F5">
      <td height="40" colspan="2" align="center" bgcolor="#F5F5F5" ><span class="chinese">
        <input type="submit" name="Submit1" value="修改公告" class="logbutton">
        &nbsp; &nbsp; &nbsp; &nbsp;<input type="reset" name="Reset" value="复  原" class="logbutton">
        
      </span></td>
    </tr>
  </form>
</table>
<%
rs.close
set rs=nothing
%>
</body>
</html>
