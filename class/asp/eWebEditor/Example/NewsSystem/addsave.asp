<!--#include file = "Startup.asp"-->
<%

' ======================
' ���ܣ��������ű���ҳ
' ��������add.asp�ļ��ύ�����ı����ݽ��б���������б������ű��⣬�������ݣ����ű���ͼƬ��
'       ͬʱ�������д�ƪ����������ص��ϴ���Զ�̻�ȡ���ļ���Ϣ����Դ�ļ����������ļ���������·���ļ�����
' ======================

Call Header("�������ű���")
Call Content()
Call Footer()


' ��ҳ������
Sub Content()
	Dim i

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

	' �����������ݣ�ͬʱȡ������������ID
	Dim sNewsID
	sSql = "SELECT * FROM NewsData WHERE D_ID=0"
	oRs.Open sSql, oConn, 1, 3
	oRs.AddNew
	oRs("D_Title") = sTitle
	oRs("D_Content") = sContent
	oRs("D_Picture") = sPicture
	oRs("D_OriginalFileName") = sOriginalFileName
	oRs("D_SaveFileName") = sSaveFileName
	oRs("D_SavePathFileName") = sSavePathFileName
	oRs.Update
	sNewsID = oRs("D_ID")
	oRs.Close
	
	' ����ɹ�������Ϣ
	Response.Write "���ţ�ID��" & sNewsID & "�����ӱ���ɹ���"

End Sub

%>

