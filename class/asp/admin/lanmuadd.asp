<!--#include file="conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/111111.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript">
function checkFields()
{
	if(document.form1.title.value==''){
		window.alert("标题不能为空");
		return false;
	}
	
	
	return true;
}
</script>
<body>
<table width="89%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" align="center">
<form name="form1" method="post" action="lanmuSave.asp?action=add" onSubmit="return checkFields()">
  <tr bgcolor="#F5F5F5">
    <td width="150" height="30" align="center" class="manager_orange_font_12px">栏目标题：</td>
    <td>&nbsp;
        <input name="title" type="text" size="65" maxlength="90" class="manager_input_1">    </td>
  </tr>
  <tr bgcolor="#F5F5F5">
    <td height="30" colspan="2" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px"><span class="chinese">
      <input type="submit" name="Submit1" value="保 存" class="logbutton">
      &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="Reset" value="取 消" class="logbutton"></td>
  </tr>
</form>
</table>
</body>
</html>



