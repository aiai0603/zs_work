<!--#include file="conn.asp"-->
<!--#include File="IsManager.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from gg where id="&trim(request.QueryString("id"))&""
rs.open sql,conn,1,1
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/Style.css" rel="stylesheet">
</HEAD>
<BODY>


<table class="border" border="0" cellspacing="1" width="100%" cellpadding="0">
        <tr class="title" height="22">
          <td  height="22" colspan="3" align="center"><strong>ȷ �� ɾ �� ��</strong></td>
        </tr>
        <tr class="tdbg" onMouseOut="this.style.backgroundColor=''" onMouseOver="this.style.backgroundColor='#BFDFFF'" height="25">
          <td width="231" align="right"><span class="manager_black_font_12px"><strong> ID ��</strong></span>��&nbsp;</td>
          <td width="763" align="left"><span class="manager_black_font_12px">&nbsp;&nbsp;<%=rs("id")%></span></td>
        </tr>
        <tr class="tdbg" onMouseOut="this.style.backgroundColor=''" onMouseOver="this.style.backgroundColor='#BFDFFF'" height="25">
          <td width="231" align="right"><span class="manager_black_font_12px"><strong><strong>��������</strong></strong></span>��&nbsp;</td>
          <td width="763" align="left"><span class="manager_black_font_12px">&nbsp;&nbsp;<%=rs("content")%></span></td>
        </tr>
        
        <tr class="tdbg" onMouseOut="this.style.backgroundColor=''" onMouseOver="this.style.backgroundColor='#BFDFFF'" height="25">
          <td colspan="2" align="center"><input type="button" value="ɾ ��" onClick="location='ggDeltCheck.asp?id=<%=trim(request.QueryString("id"))%>';" class="logbutton">            &nbsp;<span class="manager_black_font_12px">&nbsp;&nbsp;
            <input type="button" value="ȡ ��" onClick="history.back(-1);" class="logbutton">
          </span></td>
        </tr>
      </table>
<%
rs.close
set rs=nothing
%>
</BODY>
</HTML>
