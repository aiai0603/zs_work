<!--#include file = "Startup.asp"-->

<%

' ======================
' ���ܣ���������
' �������ṩһ�����������������ű�����������ݣ���������ʹ��eWebEditor���б༭��
'       ͬʱ�����ϴ��ļ����Ա�ɾ������ʱ��ͬʱɾ���ϴ��ļ���
'       ���ɱ༭�����ϴ����ļ����ṩ�������ŵ�ͼƬѡ��
' ======================

Call Header("��������")
Call Content()
Call Footer()


' ��ҳ������
Sub Content()
	%>

	<Script Language=JavaScript>
	// ���ϴ�ͼƬ���ļ�ʱ����������������ͼƬ·�����ɸ���ʵ����Ҫ���Ĵ˺���
	function doChange(objText, objDrop){
		if (!objDrop) return;
		var str = objText.value;
		var arr = str.split("|");
		var nIndex = objDrop.selectedIndex;
		objDrop.length=1;
		for (var i=0; i<arr.length; i++){
			objDrop.options[objDrop.length] = new Option(arr[i], arr[i]);
		}
		objDrop.selectedIndex = nIndex;
	}

	// ���ύ�ͻ��˼��
	function doSubmit(){
		if (document.myform.d_title.value==""){
			alert("���ű��ⲻ��Ϊ�գ�");
			return false;
		}
		// getHTML()ΪeWebEditor�Դ��Ľӿں���������Ϊȡ�༭��������
		if (eWebEditor1.getHTML()==""){
			alert("�������ݲ���Ϊ�գ�");
			return false;
		}
		document.myform.submit();
	}

	// ���ύ�ͻ��˼��
	function doCheck(){

		if (document.myform.d_title.value==""){
			alert("���ű��ⲻ��Ϊ�գ�");
			return false;
		}
		// getHTML()ΪeWebEditor�Դ��Ľӿں���������Ϊȡ�༭��������
		if (eWebEditor1.getHTML()==""){
			alert("�������ݲ���Ϊ�գ�");
			return false;
		}

		// ����Ч�Լ������Զ��ϴ�Զ���ļ�
		// ������remoteUpload(strEventUploadAfter)
		// ������strEventUploadAfter ; �ϴ���󣬴����ĺ�����������ϴ�����趯���ɲ������
		eWebEditor1.remoteUpload("doSubmit()");
		return false;

	}

	// ���ύ����Զ���ϴ���ɺ󣬴����˺�����
	function doSubmit(){
		document.myform.submit();
	}

	</Script>
	
	<form action="addsave.asp" method="post" name="myform" onsubmit="return doCheck();">
	<% 'ȡԴ�ļ��� %>
	<input type=hidden name=d_originalfilename>
	<% 'ȡ����ķ������������Ҫ��·������������򣬿���������ı������onchange�¼� %>
	<input type=hidden name=d_savefilename>
	<% 'ȡ������ļ�������·������ʹ�ô�·������������� %>
	<input type=hidden name=d_savepathfilename onchange="doChange(this,document.myform.d_picture)">

	<table cellspacing=3 align=center>
	<tr>
		<td>���ű��⣺</td>
		<td><input type="text" name="d_title" value="" size="90"></td>
	</tr>
	<tr>
		<td>����ͼƬ��</td>
		<td><select name="d_picture" size=1><option value=''>��</option></select> ���༭���в���ͼƬʱ�����Զ�����������</td>
	</tr>
	<tr>
		<td>�������ݣ�</td>
		<td>
			<%
			' ewebeditor.asp�ļ����õĲ�����
			'	id���������textarea�����ƣ��ڴ˱�����d_content��ע���Сд
			'	style���༭������ʽ���ƣ�����eWebEditor�ĺ�̨����
			'	originalfilename�����ڻ�ȡԴ�ļ����ı��������ڴ˱�����d_originalfilename
			'	savefilename�����ڻ�ȡ�����ļ����ı��������ڴ˱�����d_savefilename
			'	savepathfilename�����ڻ�ȡ�����·���ļ����ı��������ڴ˱�����d_savepathfilename
			%>
			<textarea name="d_content" style="display:none"></textarea>
			<iframe ID="eWebEditor1" src="../../ewebeditor.asp?id=d_content&style=s_newssystem&originalfilename=d_originalfilename&savefilename=d_savefilename&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe>
		</td>
	</tr>
	</table>
	<p align=center><input type=submit name=btnSubmit value=" �� �� "> <input type=reset name=btnReset value=" �� �� "></p>
	</form>

	<%
End Sub

%>

