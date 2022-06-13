<!--#include file="conn.asp"-->
<%
Set rs=server.createobject("adodb.recordset")
	 sql="select * from lanmu "
     rs.open sql,conn,1,3
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/111111.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkFields()
{
	if(document.form1.title.value==''){
		window.alert("新闻标题不能为空");
		return false;
	}
	
	
	return true;
}
</script>
<body>
<table width="89%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" align="center">
<form name="form1" method="post" action="NewsSave.asp?action=add" onSubmit="return checkFields()">
  <tr bgcolor="#F5F5F5">
    <td width="150" height="30" align="center" class="manager_orange_font_12px">新闻标题：</td>
    <td>&nbsp;
        <input name="title" type="text" size="65" maxlength="90" class="manager_input_1">    </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td width="150" height="30" align="center" class="manager_orange_font_12px">是否热点新闻：</td>
    <td>&nbsp;
      <span>
        <select name="hot" id="hot" class="manager_select_1" onChange="list_zj()">
          <option value="1">是</option>
          <option value="0">否</option>
        </select>
      </span> 
	  </td>
  </tr>
    <tr bgcolor="#ffffff">
    <td width="150" height="30" align="center" class="manager_orange_font_12px">新闻栏目：</td>
    <td>&nbsp;
      <span>
        <select name="lanmu" id="hot" class="manager_select_1" onChange="list_zj()">
         <% Do While Not RS.EOF %> 
         <option value="<%=rs("id")%>"><%=rs("lanmu")%></option>
          <% RS.MoveNext
		  Loop
		  %>
        </select>
      </span> 
	  </td>
  </tr>
  <tr bgcolor="#ffffff">
    <td width="150" height="230" align="center" bgcolor="#ffffff" class="manager_orange_font_12px">新闻内容：</td>
    <td><span class="chinese">
      <textarea style="display:none" name="content"><%=Content%></textarea>
			<iframe class="dataInput" id="content" name="content" src="../eWebEditor/ewebeditor.asp?id=content&style=" frameborder="0" scrolling="no" width="550" HEIGHT="340"><%=Content%></iframe>    </td>
  </tr>
  <tr bgcolor="#F5F5F5">
    <td width="150" height="25" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px">作&nbsp; 者：</td>
    <td>&nbsp; 
      <input name="author" type="text" size="40" maxlength="40" class="manager_input_1" ></td>
     
  </tr>
  
  <tr bgcolor="#F5F5F5">
    <td width="150" height="25" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px">日&nbsp; 期：</td>
    <td>&nbsp;      <input name="date" type="text" size="20" maxlength="40" class="manager_input_1" value="<%=date()%>"></td>
  </tr>
  <tr bgcolor="#F5F5F5">
    <td height="30" colspan="2" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px"><span class="chinese">
      <input type="submit" name="Submit1" value="下一步" class="logbutton">
      &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="Reset" value="取 消" class="logbutton"></td>
    </tr>
</form>
</table>
</body>
</html>
<%
    rs.Close
    Set rs = Nothing
    Conn.Close
    Set Conn = Nothing
 %>

