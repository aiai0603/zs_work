<!--#include file = "Startup.asp"-->
<!--#include file = "../../Include/DeCode.asp"-->

<%

' ======================
' ���ܣ���ʾ����
' ��������ʾ�༭������ҳ����ҳע��һ��DeCode�ӿں����ĵ��á�
' ======================

Call Header("��ʾ��������")
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

	' ����ĳЩ��ǩ������ڰ�ȫ���ǵ�Script��ǩ����
	' Ҫʹ�ô˹�����Ҫ�Ȱ���"Include/DeCode.asp"�ļ���
	' ����ֻ����SCRIPT��ǩ������ζ�������еĿͻ��˽ű�������Ч�����ɸ���ʵ�ʵ���Ҫ����������ǩ��
	' ��ǰ֧�ֹ��˵ı�ǩ�����Բ鿴DeCode.asp�ļ��е�˵����
	sContent = eWebEditor_DeCode(sContent, "SCRIPT")


	' �������
	Response.Write "<table border=0 cellpadding=5 width='90%' align=center>" & _
		"<tr><td align=center><b>" & sTitle & "</b></td></tr>" & _
		"<tr><td>" & sContent & "</td></tr>" & _
		"</table>"

	' �������ļ���Ϣ
	Response.Write "<p><b>�����ŵ�����ϴ��ļ���Ϣ���£�</b></p>"

	' �Ѵ�"|"���ַ���תΪ���飬�����г���ʾ
	Dim aOriginalFileName, aSaveFileName, aSavePathFileName
	aOriginalFileName = Split(sOriginalFileName, "|")
	aSaveFileName = Split(sSaveFileName, "|")
	aSavePathFileName = Split(sSavePathFileName, "|")

	Response.Write "<table border=1 cellpadding=3 cellspacing=0>" & _
		"<tr>" & _
			"<td>���</td>" & _
			"<td>ԭ�ļ���(�ӿڣ�d_originalfilename)</td>" & _
			"<td>�����ļ���(�ӿڣ�d_savefilename)</td>" & _
			"<td>����·���ļ���(�ӿڣ�d_savepathfilename)</td>" & _
		"</tr>"
	Dim i
	For i = 0 To UBound(aOriginalFileName)
		Response.Write "<tr>" & _
				"<td>" & CStr(i + 1) & "</td>" & _
				"<td>" & aOriginalFileName(i) & "</td>" & _
				"<td>" & aSaveFileName(i) & "</td>" & _
				"<td>" & aSavePathFileName(i) & "</td>" & _
			"</tr>"
	Next
	Response.Write "</table>"

End Sub

%>
