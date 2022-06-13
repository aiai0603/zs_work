<!--#include File="conn.asp"-->
<!--#include File="IsManager.asp"-->

<html>
<head>

<title>心情之旅管理系统</title>
<style type=text/css>
body  { background:#0080C0; margin:0px; font:9pt 宋体; FONT-SIZE: 9pt;text-decoration: none;
SCROLLBAR-FACE-COLOR: #9999CC;
SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #39867B; SCROLLBAR-3DLIGHT-COLOR: #39867B; SCROLLBAR-ARROW-COLOR: #330000; SCROLLBAR-TRACK-COLOR: #E1E1FF; SCROLLBAR-DARKSHADOW-COLOR: #ffffff;}
table  { border:0px; }
td  { font:normal 12px 宋体; }
img  { vertical-align:bottom; border:0px; }
a  { font:normal 12px 宋体; color:#000000; text-decoration:none; }
a:hover  { color:#cc0000;text-decoration:underline; }
.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#FFFFCC; }
.menu_title  { }
.menu_title span  { position:relative; top:2px; left:8px; color:#39867B; font-weight:bold; }
.menu_title2  { }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#cc0000; font-weight:bold; }
.sec_menu1 {	BORDER-RIGHT: white 1px solid; BACKGROUND: #E9EBE2; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
.sec_menu11 {border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#CBEEF8; }
</style>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=100% cellpadding=0 cellspacing=0 border=0 align=left>
    <tr><td valign=top>
<table width=158 border="0" align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=10 valign=bottom>&nbsp;
    </td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background=../images/title_bg_quit.gif id=menuTitle0> 
          <span><a href="../主页.asp" target="_top"><b>管理首页</b></a> | <a href="login.asp" target="_top"><b>安全退出</b></a></span> 
        </td>
  </tr>
  <tr>
    <td style="display:" id='submenu0'>
<div class=sec_menu style="width:158"></div>
<div  style="width:158"></div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="../images/Admin_left_12.gif" id=menuTitle1 onClick="showsubmenu(1)" style="cursor:hand;"> 
          <span>用户管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu1'>
<div class=sec_menu style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr>
  <td height=20><a href="yhAdd.asp" target=main>添加用户</a></td>
</tr>

<tr>
  <td height=20><a href="yh.asp" target=main>用户管理</a></td>
</tr>

</table>
</div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
</div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
    <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="../images/Admin_left_1.gif" id=menuTitle2 onClick="showsubmenu(2)" style="cursor:hand;"><span>文章管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu2'><div class=sec_menu style="width:158">
      <table cellpadding=0 cellspacing=0 align=center width=130>
        <tr>
          <td height=20><a href="NewsAdd.asp" target="main">添加文章</a></td>
        </tr>
        <tr>
          <td height=20><a href="news.asp" target=main>管理文章</a></td>
        </tr>
        
      </table>
    </div>
        <div  style="width:158">
          <table cellpadding=0 cellspacing=0 align=center width=130>
            <tr>
              <td height=20></td>
            </tr>
          </table>
        </div></td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="../images/Admin_left_12.gif" id=menuTitle3 onClick="showsubmenu(3)" style="cursor:hand;"> 
          <span>栏目管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu3'>
<div class=sec_menu style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
	<tr>
	<td height=20><a href="lanmuadd.asp" target=main>添加栏目</a></td>
	</tr>
	<tr>
	<td height=20><a href="lanmu.asp" target=main>栏目管理</a></td>
	</tr>
</table>
</div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
</div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="../images/Admin_left_4.gif" id=menuTitle8 onClick="showsubmenu(8)" style="cursor:hand;"> 
          <span>公告管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu8'>
<div class=sec_menu style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=130>

              <tr>
                <td height=20><a href="ggadd.asp" target=main>添加公告</a></td>
              </tr>
              <tr>
                <td height=20><a href="gg.asp" target=main>公告管理</a></td>
              </tr>

              

            </table>
	  </div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>

	  </div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
      <tr>
        <td height=25  class=menu_title background="../images/Admin_left_9.gif" style="cursor:hand;"> <span>程序版权信息</span> </td>
      </tr>
      <tr>
        <td><div class=sec_menu11 style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=167>
              <tr>
                <td height=20><p><br>
                 &nbsp;版权所有：&nbsp;<a  target="_blank" href="#"><font color="#FF0000">计算分院</font></a><br>
                  &nbsp;设计制作：&nbsp;<a  href="mailto:31801150@zucc.edu.cn">zhangs</a><BR>
                  &nbsp;技术支持：&nbsp;<a  target="_blank" href="#">by
                  zucc&amp;zs</a><br>
                  <br>
                </p></td>
              </tr>
            </table>
        </div></td>
      </tr>
    </table>
</body>
</html>
