<!--#include file = "Startup.asp"-->
<%

' ======================
' ���ܣ��޸����ű���ҳ
' ��������modify.asp�ļ��ύ�����ı����ݽ��б���������б������ű��⣬�������ݣ����ű���ͼƬ��
'       ͬʱ�������д�ƪ����������ص��ϴ���Զ�̻�ȡ���ļ���Ϣ����Դ�ļ����������ļ���������·���ļ�����
' ======================

Call Header("�޸����ű���")
Call Content()
Call Footer()


' ��ҳ������
Sub Content()
	Dim i

	' �������������ID
	Dim sNewsID
	sNewsID = Trim(Request("id"))

	' ����ID��Ч����֤����ֹ��Щ�˶�����ƻ�����ʾ����
	If IsNumeric(sNewsID) = False Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�ƻ�����ʾϵͳ��"
	End If

	' ȡ�ύ����������
	' ע��ȡ�������ݵķ�������Ϊ�Դ�����Զ�����һ��Ҫʹ��ѭ�����������100K�����ݽ�ȡ�������������������Ϊ102399�ֽڣ�100K���ң�
	Dim sTitle, sContent, sPicture
	sTitle = Request.Form("d_title")
	sPicture = Request.Form("d_picture")


	' ��ʼ��eWebEditor�༭��ȡֵ-----------------
	sContent = ""
	For i = 1 To Request.Form("d_content").Count
		sContent = sContent & Request.Form("d_content")(i)
	Next
	' ������eWebEditor�༭��ȡֵ-----------------	


	' ����Ϊ����ͨ���༭���ϴ��������ļ������Ϣ�������༭���ֶ��ϴ��ĺ��Զ�Զ���ϴ���
	' GetSafeStr����Ϊ����һЩ�����ַ�����ֹ��Щ�˶�����ƻ�����ʾ����
	' �ϴ���Զ�̻�ȡǰ��ԭ�ļ����������"|"�ָ�
	Dim sOriginalFileName
	' �ϴ��󱣴浽���ط��������ļ���������·�����������"|"�ָ�
	Dim sSaveFileName
	' �ϴ��󱣴浽���ط�������·���ļ����������"|"�ָ�
	Dim sSavePathFileName
	sOriginalFileName = GetSafeStr(Request.Form("d_originalfilename"))
	sSaveFileName = GetSafeStr(Request.Form("d_savefilename"))
	sSavePathFileName = GetSafeStr(Request.Form("d_savepathfilename"))


	' �޸�ָ����������
	sSql = "SELECT * FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql, oConn, 1, 3
	If Not oRs.Eof Then
		oRs("D_Title") = sTitle
		oRs("D_Content") = sContent
		oRs("D_Picture") = sPicture
		oRs("D_OriginalFileName") = sOriginalFileName
		oRs("D_SaveFileName") = sSaveFileName
		oRs("D_SavePathFileName") = sSavePathFileName
		oRs.Update
	Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
	End If
	oRs.Close

	' ����ɹ�������Ϣ
	Response.Write "���ţ�ID��" & sNewsID & "���޸ı���ɹ���"

End Sub

%>

