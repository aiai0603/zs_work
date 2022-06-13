<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from Article where id="&trim(request.QueryString("id"))&""
rs.open sql,conn,1,1

set rs1=server.createobject("adodb.recordset")
sql="select * from lanmu "
rs1.open sql,conn,1,1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/111111.css" rel="stylesheet">
</head>

<body>
<table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
  <form name="form1" action="NewsSave.asp?action=edit&id=<%=rs("id")%>" method="post">
    <tr bgcolor="#F5F5F5">
      <td width="150" height="30" align="center" class="manager_orange_font_12px">新闻标题：</td>
      <td>&nbsp;
          <input name="title" type="text" size="65" maxlength="90" class="manager_input_1" value="<%=rs("title")%>">      </td>
    </tr>
    <tr  bgcolor="#ffffff">
    <td width="150" height="30" align="center" class="manager_orange_font_12px">新闻栏目：</td>
    <td>&nbsp; <span class="black_font_12px">
    <select name="lanmu" id="lanmu" class="manager_select_1" onChange="list_zj()" >
         <% Do While Not RS1.EOF %> 
           <%If rs("lanmuid")=rs1("id") Then %>
         <option value="<%=rs1("id")%>" selected="selected"><%=rs1("lanmu")%></option>
         	<%Else%>
		<option value="<%=rs1("id")%>" ><%=rs1("lanmu")%></option>
		
        	<%End If%>
          <% RS1.MoveNext
		  Loop
		  %>
        </select>
        </span>
    </td>
    </tr>
    <tr bgcolor="#ffffff">
      <td width="150" height="30" align="center" class="manager_orange_font_12px">是否热点新闻：</td>
      <td>&nbsp; <span class="black_font_12px">
       <%If rs("hot")=1 Then %>
		<select name="hot" id="hot" class="select_1" onChange="list_zj()">
          <option value="1">是</option>
          <option value="0">否</option>
        </select>
		<%Else%>
		<select name="hot" id="hot" class="select_1" onChange="list_zj()">
          <option value="0">否</option>
          <option value="1">是</option>
        </select>
		
        <%End If%>
		</span>      </td>
    </tr>
    <tr bgcolor="#ffffff">
      <td width="150" height="230" align="center" bgcolor="#ffffff" class="manager_orange_font_12px">新闻内容：</td>
      <td><span class="chinese"> &nbsp;

<textarea style="display:none" name="content"><%=rs("content")%></textarea>
      <iframe class="dataInput" id="content" name="content" src="../eWebEditor/ewebeditor.asp?id=content&style=" frameborder="0" scrolling="no" width="550" height="340"></iframe>
      </span></td>
    </tr>
    <tr bgcolor="#F5F5F5">
      <td width="150" height="25" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px">作&nbsp; 者：</td>
      <td>&nbsp;
          <input name="author" type="text" size="40" maxlength="40" class="manager_input_1" value="<%=rs("author")%>"></td>
    </tr>
    <tr bgcolor="#F5F5F5">
      <td width="150" height="25" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px">日&nbsp; 期：</td>
      <td>&nbsp;
          <input name="date" type="text" size="20" maxlength="40" class="manager_input_1" value="<%=rs("date")%>"></td>
    </tr>
    <tr bgcolor="#F5F5F5">
      <td width="150" height="25" align="center" bgcolor="#F5F5F5" class="manager_orange_font_12px">图&nbsp; 片：</td>
      <td>&nbsp;
        <img src="showimg.asp?id=<%=rs("id")%>" style="width:600px;height:400px"> </td>
    </tr>
    <tr bgcolor="#F5F5F5">
      <td height="40" colspan="2" align="center" bgcolor="#F5F5F5" ><span class="chinese">
        <input type="submit" name="Submit1" value="下一步" class="logbutton">
        
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
