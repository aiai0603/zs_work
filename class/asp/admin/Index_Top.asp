<html>
<head>
<title>��̨����ҳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
a:link { color:#000000;text-decoration:none}
a:hover {color:#666666;}
a:visited {color:#000000;text-decoration:none}

td {FONT-SIZE: 9pt; FILTER: dropshadow(color=#FFFFFF,offx=1,offy=1); COLOR: #000000; FONT-FAMILY: "����"}
img {filter:Alpha(opacity:100); chroma(color=#FFFFFF)}
</style>
<base target="main">
<script>
function preloadImg(src)
{
	var img=new Image();
	img.src=src
}
preloadImg("../images/admin_top_open.gif");

var displayBar=true;
function switchBar(obj)
{
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.src="../images/admin_top_open.gif";
		obj.title="����߹���˵�";
	}
	else{
		parent.frame.cols="180,*";
		displayBar=true;
		obj.src="../images/admin_top_close.gif";
		obj.title="�ر���߹���˵�";
	}
}
</script>
</head>

<body background="../images/admin_top_bg.gif" leftmargin="0" topmargin="0">
<table height="100%" width="100%" border=0 cellpadding=0 cellspacing=0>
<tr valign=middle>
	<td width=50>
	<img onClick="switchBar(this)" src="../images/admin_top_close.gif" title="�ر���߹���˵�" style="cursor:hand">
	</td>

	<td width=40>
		<img src="../images/admin_top_icon_1.gif">
	</td>
	<td width=100>
		<a href="ManagerPInfoEdit.asp">�޸ĸ�����Ϣ</a>
	</td>
	<td width=40>
		<img src="../images/admin_top_icon_5.gif">
	</td>
	<td width=100>
		<a href="Managerlist.asp">����Ա����</a></td>
	<td align="right">����ϵͳ V1.0  ��&nbsp;&nbsp;</td>
</tr>
</table>
</body>
</html>
