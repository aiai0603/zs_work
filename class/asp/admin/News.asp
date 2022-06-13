<!--#include File="conn.asp"-->
<!--#include File="IsManager.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻列表</title>
<link href="../inc/111111.css" rel="stylesheet">
</head>

<body>




<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr class="topbg">
    <td height="22" colspan="2"  align="center"><strong>新 闻 管 理</strong></td>
  </tr>
  <tr class="tdbg">
    <td width="70" height="30" ><strong>管理导航：</strong></td>
    <td>&nbsp;<a href="news.asp">新闻首页</a>&nbsp;|&nbsp;<a href=NewsAdd.asp class="manager_link_3">添加新闻</a>&nbsp;|</td>
  </tr>
</table>

<table class="border" border="0" cellspacing="1" width="100%" cellpadding="0">
  <tr class="title" height="22">
    <td width="44" align="center"  height="22"><strong>ID</strong></td>
    <td width="463" align="center" ><strong>文章标题</strong></td>
     <td width="74" align="center" ><strong>观看次数</strong></td>
    <td width="74" align="center" ><strong>作者</strong></td>
      <td width="74" align="center" ><strong>点赞</strong></td>
        <td width="74" align="center" ><strong>打赏</strong></td>
          <td width="74" align="center" ><strong>收藏</strong></td>
    
    <td width="62" align="center" ><strong>是否热点</strong></td>
    <td width="64" align="center" ><strong>发布日期</strong></td>
    <td width="184" align="center" ><strong>操作</strong></td>
  </tr>
            <% on error resume next
     set rs=server.createobject("adodb.recordset")
	sql="select * from Article order by date desc"
     rs.open sql,conn,1,1
	'设置每页显示记录数量
	rs.PageSize=15
	'设置并读取页码参数page
	iPage=CLng(Request("page"))
	If iPage <= 0 Then
		iPage = 1
	End If
	If iPage > rs.PageCount Then
		iPage = rs.PageCount
	End If
	rs.AbsolutePage = iPage
	RowCount = rs.PageSize
	'依次显示课程表信息
	Do While Not rs.EOF And RowCount > 0
		n = n + 1
		'If n Mod 2 = 0 Then
			'Response.Write("<tr bgcolor='#F6F6F6' height='24'>")
		'End If
		'If n Mod 2 = 1 Then
			'Response.Write("<tr bgcolor='#ECECEC' height='24'>")
		'End If
%>
  <tr class="tdbg" onMouseOut="this.style.backgroundColor=''" onMouseOver="this.style.backgroundColor='#BFDFFF'" height="25">
    <td width="44" align="center"><%=n%></td>
    <td><a href="NewsEdit.asp?id=<%=rs("id")%>">&nbsp;&nbsp;<%=rs("title")%></a></td>
    <td width="74" align="center"><%= rs("readtime") %></td>
    <td width="74" align="center"><%=rs("author")%></td>
    <td width="74" align="center"><%=rs("zan")%></td>
     <td width="74" align="center"><%=rs("bi")%></td>
     
      <td width="74" align="center"><%=rs("save")%></td>
    <td width="62" align="center"><%
	If rs("hot")=1 Then
		Response.Write("是")
	Else
		Response.Write("否")
	End If
	%></td>
    <td width="64" align="center"><%=rs("date")%></td>
    <td width="184" align="center"><a href="NewsEdit.asp?id=<%=rs("id")%>" class="manager_link_2">[修改]</a> <a href="NewsDelt.asp?id=<%=rs("id")%>" class="manager_link_2">[删除]</a>
     </td>
  </tr>
<%
	rs.MoveNext()
	'控制每页显示的课程的数量
	RowCount = RowCount - 1
	Loop
'End If
%>  
</table>

<table class="border" border="0" cellspacing="1" width="100%" cellpadding="0">
  <tr class="tdbg" onMouseOut="this.style.backgroundColor=''" onMouseOver="this.style.backgroundColor='#BFDFFF'" height="25" align="right">
    <td height="20"><%
Response.Write("第 "+cstr(iPage)+" 页/总 "+cstr(rs.pagecount)+" 页　")
If iPage = 1 Then
	Response.Write("首页　上一页")
Else
	Response.Write("<a href='News.asp?page=1'>首页</a>　<a href='News.asp?page="+cstr(iPage-1)+"'>上一页</a>")
End If
	Response.Write("&nbsp;&nbsp;")
If iPage = rs.PageCount Then
	Response.Write("下一页　尾页")
Else
	Response.Write("<a href='News.asp?page="+cstr(iPage+1)+"'>下一页</a>　<a href='News.asp?page="+cstr(rs.PageCount)+"'>尾页</a>")
End If
	Response.Write("&nbsp;&nbsp;")
'If rs.PageCount > 1 Then
'	Response.Write("分页：")
'	For i = 1 to rs.PageCount
'		Response.Write("[<a href='StudentList_Edit.asp?page="& i &"'>")
'		Response.Write( ""& i & "</a>]&nbsp;")
'	Next
'End If
%></td>
  </tr>
</table>
</body>
</html>
<%
    rs.Close
    Set rs = Nothing
    Conn.Close
    Set Conn = Nothing
 %>
