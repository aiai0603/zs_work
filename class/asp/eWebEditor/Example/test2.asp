<HTML>
<HEAD>
<TITLE>eWebEditor���߱༭�� - ʹ������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<style>
body,td,input,textarea {font-size:9pt}
</style>
</HEAD>
<BODY>



<script language=JavaScript>

// ���ύ���
function doCheck(){

	// ��������Ч��
	// �磺���ⲻ��Ϊ�գ����ݲ���Ϊ�գ��ȵ�....
	if (eWebEditor1.getHTML()=="") {
		alert("���ݲ���Ϊ�գ�");
		return false;
	}

	// ����Ч�Լ������Զ��ϴ�Զ���ļ�
	// ������remoteUpload(strEventUploadAfter)
	// ������strEventUploadAfter ; �ϴ���󣬴����ĺ�����������ϴ�����趯���ɲ������
	eWebEditor1.remoteUpload("doSubmit()");
	// ��һ�������ж���༭��ʱ�������ָ���ϴ�ĳ���༭�����磺
	// eWebEditor1.remoteUpload();
	// eWebEditor2.remoteUpload();
	// eWebEditor4.remoteUpload("doSubmit()");    �������һ����ִ������ύ��
	return false;

}

// ���ύ����Զ���ϴ���ɺ󣬴����˺�����
function doSubmit(){
	document.myform1.submit();
}

</script>



<p><b>eWebEditor Զ���ļ��ϴ�ʾ����</b></p>

<FORM method="POST" name="myform1" action="submit.asp" onsubmit="return doCheck();">
<TABLE border="0" cellpadding="2" cellspacing="1">
<TR>
	<TD>�༭���ݣ�</TD>
	<TD>
		<INPUT type="hidden" name="content1" value="&lt;P&gt;&lt;IMG src=&quot;http://ewebeditor.webasp.net/images/ewebeditor.gif&quot; border=0&gt;&lt;/P&gt;&lt;P&gt;����ͼƬ��ַΪ��&lt;A href=&quot;http://ewebeditor.webasp.net/images/ewebeditor.gif&quot;&gt;http://ewebeditor.webasp.net/images/ewebeditor.gif&lt;/A&gt;&lt;/P&gt;&lt;P&gt;1�����&lt;IMG src=&quot;http://ewebeditor.webasp.net/ewebeditor/buttonimage/standard/remoteupload.gif&quot; border=0&gt;��ť��Ȼ��ת�������롱״̬��һ�£�����ͼƬ�ĵ�ַ�Ѿ������ط������ˣ�&lt;/P&gt;&lt;P&gt;2�����˱��ġ��ύ�����ύ��鿴Դ�ļ���һ�£�ͼƬ�ĵ�ַҲ�����ط������ˣ�&lt;/P&gt;&lt;P&gt;Ҫ����ʹ��˵�������ѹ�����У�example/test2.asp �е�ע�͡�&lt;/P&gt;">
		<IFRAME ID="eWebEditor1" src="../ewebeditor.asp?id=content1&style=s_exampleremote" frameborder="0" scrolling="no" width="550" height="350"></IFRAME>
	</TD>
</TR>
<TR>
	<TD colspan=2 align=right>
	<INPUT type=submit name=b1 value="�ύ"> 
	<INPUT type=reset name=b2 value="����"> 
	<INPUT type=button name=b3 value="�鿴Դ�ļ�" onclick="location.replace('view-source:'+location)"> 
	</TD>
</TR>
</TABLE>
</FORM>






</BODY>
</HTML>
