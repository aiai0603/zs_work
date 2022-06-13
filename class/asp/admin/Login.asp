<html>
<head>
<title>后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../inc/111111.css" rel="stylesheet" type="text/css">
<script language=javascript>
<!--
function SetFocus()
{
	if (document.Login.name.value=="")
		document.Login.name.focus();
	else
		document.Login.name.select();
}
function CheckForm()
{
	if(document.Login.name.value=="")
	{
		alert("请输入用户名！");
		document.Login.name.focus();
		return false;
	}
	if(document.Login.pwd.value == "")
	{
		alert("请输入密码！");
		document.Login.pwd.focus();
		return false;
	}
	if (document.Login.checkcode.value=="")
	{
    	alert ("请输入验证码！");
    	document.Login.checkcode.focus();
     	return(false);
  	}
}

function CheckBrowser() 
{
  var app=navigator.appName;
  var verStr=navigator.appVersion;
  if (app.indexOf('Netscape') != -1) {
    alert("友情提示：\n    你使用的是Netscape浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  } 
  else if (app.indexOf('Microsoft') != -1) {
    if (verStr.indexOf("MSIE 3.0")!=-1 || verStr.indexOf("MSIE 4.0") != -1 || verStr.indexOf("MSIE 5.0") != -1 || verStr.indexOf("MSIE 5.1") != -1)
      alert("友情提示：\n    您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。");
  }
}
//-->
</script>
</head>

<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" 
background=../images/bg.gif border=0>
  <TBODY>
    <TR>
      <TD vAlign=center align=middle><TABLE height=402 cellSpacing=0 cellPadding=0 width=562 bgColor=#f4f4f4 
      border=0>
          <TBODY>
            <TR>
              <TD vAlign=center align=middle><TABLE cellSpacing=0 cellPadding=0 width=560 border=0>
                  <TBODY>
                    <TR>
                      <TD><IMG height=40 alt="" src="../images/index_01.gif" 
                  width=142></TD>
                      <TD><IMG height=40 alt="" src="../images/index_02.gif" 
                  width=171></TD>
                      <TD><IMG height=40 alt="" src="../images/index_03.gif" 
                  width=130></TD>
                      <TD><IMG height=40 alt="" src="../images/index_04.gif" 
                  width=117></TD>
                    </TR>
                    <TR>
                      <TD><IMG height=49 alt="" src="../images/index_05.gif" 
                  width=142></TD>
                      <TD colSpan=2><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                          <TBODY>
                            <TR>
                              <TD width="10%"><IMG height=49 alt="" 
                        src="../images/index_06.gif" width=90></TD>
                              <TD width="90%"><img height=49 alt="" 
                        src="../images/index_07.gif" 
                  width=211></TD>
                            </TR>
                          </TBODY>
                        </TABLE></TD>
                      <TD><IMG height=49 alt="" src="../images/index_08.gif" 
                  width=117></TD>
                    </TR>
                    <TR>
                      <TD><IMG height=55 alt="" src="../images/index_09.gif" 
                  width=142></TD>
                      <TD><img height=55 alt="" src="../images/index_10.gif" 
                  width=171></TD>
                      <TD><IMG height=55 alt="" src="../images/index_11.gif" 
                  width=130></TD>
                      <TD><IMG height=55 alt="" src="../images/index_12.gif" 
                  width=117></TD>
                    </TR>
                    <TR>
                      <TD height="170" colSpan=4><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                          <TBODY>
                            <TR>
                              <TD width="25%"><IMG height=62 alt="" 
                        src="../images/index_13.gif" width=142></TD>
                              <TD vAlign=center align=middle width="61%" bgColor=#f4f4f4 
                      rowSpan=2><form name="Login" action="Check.asp" method="post" target="_parent" onSubmit="return CheckForm();">
                                  <TABLE height=80 cellSpacing=1 cellPadding=5 width="92%" 
                        border=0>
                                    <TBODY>
                                      <TR vAlign=center align=middle bgColor=#ffffff>
                                        <TD width="24%" bgcolor="#f4f4f4">&nbsp;</TD>
                                        <TD colspan="2" bgcolor="#f4f4f4"><div align="left"><FONT color=#5a514a> </FONT><font color="#FF0000">
                                            <%
Randomize
an= int((9999-1000+1) * RND +1000)
%>
                                            </font></div></TD>
                                      </TR>
                                      <TR vAlign=center align=middle bgColor=#ffffff>
                                        <TD><font color=#5a514a>用 户 名</font></TD>
                                        <td colspan="2" align="left" bgcolor="#FFFFFF"><input name="name"  type="text"  id="name" style="width:130px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onFocus="this.select(); " onMouseOver="this.style.background='#E1F4EE';" onMouseOut="this.style.background='#FFFFFF'" maxlength="20"></td>
                                      </TR>
                                      <TR vAlign=center align=middle bgColor=#ffffff>
                                        <TD><FONT color=#5a514a>密　　码</FONT></TD>
                                        <td colspan="2" align="left" bgcolor="#FFFFFF"><input name="pwd"  type="password" id="pwd" style="width:130px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onFocus="this.select(); " onMouseOver="this.style.background='#E1F4EE';" onMouseOut="this.style.background='#FFFFFF'" maxlength="20"></td>
                                      </TR>
                                      <TR vAlign=center align=middle bgColor=#ffffff>
                                        <TD><FONT color=#5a514a>验 证 码</FONT></TD>
                                        <td colspan="2" align="left" bgcolor="#FFFFFF"><input name="checkcode" type="text" id="checkcode" style="width:130px;border-style:solid;border-width:1;padding-left:4;padding-right:4;padding-top:1;padding-bottom:1" onFocus="this.select(); " onMouseOver="this.style.background='#E1F4EE';" onMouseOut="this.style.background='#FFFFFF'" maxlength="4">
                                          <img src="../inc/GetCode.asp" border="0"></td>
                                      </TR>
                                    </TBODY>
                                  </TABLE>
                                  <TABLE cellSpacing=0 cellPadding=0 width="77%" 
                        border=0>
                                    <TBODY>
                                      <TR vAlign=bottom align=middle>
                                        <TD bgcolor="#f4f4f4"><div align="center"> <a href="javascript:document.domainlogin.reset();">
                                            <input   type="submit" name="Submit" value=" 确&nbsp;认 " style="font-size: 9pt; height: 19; width: 60; color: #000000; background-color: #E1F4EE; border: 1 solid #E1F4EE" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#E1F4EE'">
                                            </a></div></TD>
                                        <TD bgcolor="#f4f4f4"><div align="center"><a href="javascript:document.domainlogin.reset();">
                                            <input name="reset" type="reset"  id="reset" value=" 清&nbsp;除 " style="font-size: 9pt; height: 19; width: 60; color: #000000; background-color: #E1F4EE; border: 1 solid #E1F4EE" onMouseOver ="this.style.backgroundColor='#ffffff'" onMouseOut ="this.style.backgroundColor='#E1F4EE'">
                                          </div></TD>
                                      </TR>
                                    </TBODY>
                                  </TABLE>
                                </FORM></TD>
                              <TD width="14%"><IMG height=62 alt="" 
                        src="../images/index_15.gif" width=117></TD>
                            </TR>
                            <TR>
                              <TD height="108"><IMG height=108 alt="" 
                        src="../images/index_16.gif" width=142></TD>
                              <TD><IMG height=108 alt="" 
                        src="../images/index_18.gif" 
                  width=117></TD>
                            </TR>
                          </TBODY>
                        </TABLE></TD>
                    </TR>
                    <TR>
                      <TD><IMG height=44 alt="" src="../images/index_19.gif" 
                  width=142></TD>
                      <TD><IMG height=44 alt="" src="../images/index_20.gif" 
                  width=171></TD>
                      <TD><IMG height=44 alt="" src="../images/index_21.gif" 
                  width=130></TD>
                      <TD><IMG height=44 alt="" src="../images/index_22.gif" 
                  width=117></TD>
                    </TR>
                    <TR>
                      <TD><IMG height=42 alt="" src="../images/index_23.gif" 
                  width=142></TD>
                      <TD><IMG height=42 alt="" src="../images/index_24.gif" 
                  width=171></TD>
                      <TD><IMG height=42 alt="" src="../images/index_25.gif" 
                  width=130></TD>
                      <TD><IMG height=42 alt="" src="../images/index_26.gif" 
                  width=117></TD>
                    </TR>
                  </TBODY>
                </TABLE></TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
  </TBODY>
</TABLE>
</body></html>
