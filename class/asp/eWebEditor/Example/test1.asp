<HTML>
<HEAD>
<TITLE>eWebEditor - eWebSoft���߱༭�� - ʹ������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<style>
body,td,input,textarea {font-size:9pt}
</style>
</HEAD>
<BODY>
<FORM method="POST" name="myform" action="submit.asp">
<TABLE border="0" cellpadding="2" cellspacing="1">
<TR>
	<TD>�༭���ݣ�</TD>
	<TD>
		<INPUT type="hidden" name="content1" value="<p>&nbsp;</p><p><font color=#ff0000>����ʽΪ�Դ�Ĭ����ʽ����ѵ��ÿ��550px���߶�350px��</font></p><p>����ΪһЩ�߼����ù��ܵ����ӣ�������ýű�����ı༭����һЩ������</p><p>������Щ���ݣ���û�д�����ʾ��˵����װ�Ѿ���ȷ��ɣ�</p><p>������ȵ���̨�����У����б�Ҫ�����ã�Ȼ���ٵ��ã�</p><p><b><font color=#0000ff>��ʾ��</font>�����˸��û������롢���ݿ��ļ�����</b></p>">
		<IFRAME ID="eWebEditor1" src="../ewebeditor.asp?id=content1&style=s_coolblue" frameborder="0" scrolling="no" width="550" height="350"></IFRAME>
	</TD>
</TR>
<TR>
	<TD colspan=2 align=right>
	<INPUT type=submit name=b1 value="�ύ"> 
	<INPUT type=reset name=b2 value="����"> 
	<INPUT type=button name=b3 value="�鿴Դ�ļ�" onclick="location.replace('view-source:'+location)"> 
	</TD>
</TR>
<TR>
	<TD>ȡ�����ݣ�</TD>
	<TD><TEXTAREA cols=50 rows=5 id=myTextArea style="width:550px">�����ȡֵ����ť����һ��Ч����</TEXTAREA></TD>
</TR>
<TR>
	<TD colspan=2 align=right>
	<INPUT type=button name=b4 value="ȡֵ" onclick="myTextArea.value=eWebEditor1.getHTML()"> 
	<INPUT type=button name=b5 value="��ֵ" onclick="eWebEditor1.setHTML('<b>Hello My World!</b>')">
	<INPUT type=button name=b6 value="����״̬" onclick="eWebEditor1.setMode('CODE')">
	<INPUT type=button name=b7 value="���״̬" onclick="eWebEditor1.setMode('EDIT')">
	<INPUT type=button name=b8 value="�ı�״̬" onclick="eWebEditor1.setMode('TEXT')">
	<INPUT type=button name=b8 value="Ԥ��״̬" onclick="eWebEditor1.setMode('VIEW')">
	<INPUT type=button name=b9 value="��ǰλ�ò���" onclick="eWebEditor1.insertHTML('This is Insert Function!')">
	<INPUT type=button name=b10 value="β��׷��" onclick="eWebEditor1.appendHTML('This is Append Function!')">
	</TD>
</TR>
</TABLE>
</FORM>


</BODY>
</HTML>
