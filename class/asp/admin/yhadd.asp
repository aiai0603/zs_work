<!--#include file="conn.asp"-->
<%
Set rs=server.createobject("adodb.recordset")
	 sql="select * from yh "
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
		window.alert("�˺Ų���Ϊ��");
		return false;
	}
	if(document.form1.author.value==''){
		window.alert("���벻��Ϊ��");
		return false;
	}
	if(document.form1.pc.value==''){
		window.alert("�ֻ�����Ϊ��");
		return false;
	}
	
	
	return true;
}
</script>
<body>
<table width="89%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" align="center">
<form name="form1" method="post" action="yhSave.asp?action=add" onSubmit="return checkFields()">
  <tr bgcolor="#F5F5F5">
    <td width="150" height="30" align="center" class="manager_orange_font_12px">�� �ţ�</td>
    <td>&nbsp;
        <input name="zhanghao" type="text" size="90" maxlength="90" class="manager_input_1">    </td>
  </tr>
  <tr bgcolor="#F5F5F5">
    <td width="150" height="25" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px">�� �룺</td>
    <td>&nbsp; 
      <input name="mima" type="text" size="90" maxlength="90" class="manager_input_1" ></td>
    
  </tr>
  <tr bgcolor="#F5F5F5">
    <td width="150" height="25" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px">�� ����</td>
    <td>&nbsp; 
      <input name="tele" type="text" size="90" maxlength="90" class="manager_input_1" ></td>
     
  </tr>
  <tr bgcolor="#F5F5F5">
    <td height="30" colspan="2" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px"><span class="chinese">
      <input type="submit" name="Submit1" value="�� ��" class="logbutton">
      &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="Reset" value="ȡ ��" class="logbutton"></td>
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


