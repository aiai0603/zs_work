<!--#include file = "Startup.asp"-->

<%

' ======================
' ���ܣ��޸�����
' �������ṩһ���޸ı����������ű�����������ݣ���������ʹ��eWebEditor���б༭��
'       ͬʱ�����ϴ��ļ����Ա�ɾ������ʱ��ͬʱɾ���ϴ��ļ���
'       ���ɱ༭�����ϴ����ļ����ṩ�������ŵ�ͼƬѡ��
'		������������ͬ����ͬ����ֻ���޸ı����г�ʼֵ��
' ======================

Call Header("�޸�����")
Call Content()
Call Footer()


' ��ҳ������
Sub Content()
	
	' �������������ID
	Dim sNewsID
	sNewsID = Trim(Request("id"))

	' ����ID��Ч����֤����ֹ��Щ�˶�����ƻ�����ʾ����
	If IsNumeric(sNewsID) = False Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�ƻ�����ʾϵͳ��"
	End If

	' �����ݿ���ȡ��ʼֵ
	Dim sTitle, sContent, sPicture, sOriginalFileName, sSaveFileName, sSavePathFileName
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql, oConn, 0, 1
	If Not oRs.Eof Then
		sTitle = oRs("D_Title")
		sContent = oRs("D_Content")
		sPicture = oRs("D_Picture")
		sOriginalFileName = oRs("D_OriginalFileName")
		sSaveFileName = oRs("D_SaveFileName")
		sSavePathFileName = oRs("D_SavePathFileName")
	Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
	End If
	oRs.Close

	' �Ѵ�"|"���ַ���תΪ���飬���ڳ�ʼ�������
	Dim aSavePathFileName
	aSavePathFileName = Split(sSavePathFileName, "|")

	' ������������������ϴ��ļ�Ϊ���ݣ���ʼ�������
	' ����InitSelect����������ֵ����ʼֵ��������������ִ����������startup.asp�ļ��к�����˵������
	Dim sOptionSavePath
	sOptionSavePath = InitSelect("d_picture", aSavePathFileName, aSavePathFileName, sPicture, "", "��")

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
	
	<form action="modifysave.asp?id=<%=sNewsID%>" method="post" name="myform" onsubmit="return doCheck();">
	<% 'ȡԴ�ļ��� %>
	<input type=hidden name=d_originalfilename value="<%=sOriginalFileName%>">
	<% 'ȡ����ķ���������·�����������Ҫ��·������������򣬿���������ı������onchange�¼� %>
	<input type=hidden name=d_savefilename value="<%=sSaveFileName%>">
	<% 'ȡ������ļ�����ʹ�ô�·������������� %>
	<input type=hidden name=d_savepathfilename onchange="doChange(this,document.myform.d_picture)" value="<%=sSavePathFileName%>">

	<table cellspacing=3 align=center>
	<tr>
		<td>���ű��⣺</td>
		<% ' ����inHTML��ȥ��Html��ʽ�����ڴ����ݿ���ȡ��ֵ���������ʱ���������startup.asp�ļ��к�����˵�� %>
		<td><input type="text" name="d_title" value="<%=inHTML(sTitle)%>" size="90"></td>
	</tr>
	<tr>
		<td>����ͼƬ��</td>
		<td><%=sOptionSavePath%> ���༭���в���ͼƬʱ�����Զ�����������</td>
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

			' ��һ��Ҫ��Server.HtmlEncode()���������ݽ���ת���������п��Գ���ĳЩ���ݳ��˱༭�������
			%>
			<textarea name="d_content" style="display:none"><%=Server.HtmlEncode(sContent)%></textarea>
			<iframe ID="eWebEditor1" src="../../ewebeditor.asp?id=d_content&style=s_newssystem&originalfilename=d_originalfilename&savefilename=d_savefilename&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe>
		</td>
	</tr>
	</table>
	<p align=center><input type=submit name=btnSubmit value=" �� �� "> <input type=reset name=btnReset value=" �� �� "></p>
	</form>

	<%
End Sub

%>

