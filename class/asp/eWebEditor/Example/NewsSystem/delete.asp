<!--#include file = "Startup.asp"-->

<%

' ======================
' ���ܣ�ɾ������
' ����������ɾ����ҳ��ת�������б�ҳ��
'       ɾ�����ŵ�ͬʱ��ɾ����������ص��ϴ��ļ���
' ======================

Call Header("ɾ������")
Call Content()
Call Footer()


' ��ҳ������
Sub Content()

	' ȡ����������ID
	Dim sNewsID
	sNewsID = Trim(Request("id"))

	' ����ID��Ч����֤����ֹ��Щ�˶�����ƻ�����ʾ����
	If IsNumeric(sNewsID) = False Then
		GoError "��ͨ��ҳ���ϵ����ӽ��в�������Ҫ��ͼ�ƻ�����ʾϵͳ��"
	End If

	' ���������ݱ���ȡ����ص��ϴ��ļ�
	' �ϴ��󱣴浽���ط�������·���ļ����������"|"�ָ�
	' ɾ���ļ���Ҫȡ��·�����ļ����ſ��ԣ�����ֻҪ����Ϳ����ˣ�ԭ�����ԭ�ļ����򲻴�·���ı����ļ��������������ط�ʹ��
	Dim sSavePathFileName
	
	sSql = "SELECT D_SavePathFileName FROM NewsData WHERE D_ID=" & sNewsID
	oRs.Open sSql, oConn, 0, 1
	If Not oRs.Eof Then
		sSavePathFileName = oRs("D_SavePathFileName")
	Else
		GoError "��Ч������ID�����ҳ���ϵ����ӽ��в�����"
	End If
	oRs.Close

	' �Ѵ�"|"���ַ���תΪ����
	Dim aSavePathFileName
	aSavePathFileName = Split(sSavePathFileName, "|")

	' ɾ��������ص��ļ������ļ�����
	Dim i
	For i = 0 To UBound(aSavePathFileName)
		' ��·���ļ���ɾ���ļ�
		Call DoDelFile(aSavePathFileName(i))
	Next

	' ɾ������
	sSql = "DELETE FROM NewsData WHERE D_ID=" & sNewsID
	oConn.Execute sSql

	' 3��ת�������б�ҳ
	response.write "<p align=center>����ɾ���ɹ���3����Զ����������б�ҳ��<script>window.setTimeout(""location.href='list.asp'"",3000);</script></p>"

End Sub

' ɾ��ָ�����ļ�
Sub DoDelFile(sPathFile)
	On Error Resume Next
	Dim oFSO
	Set oFSO = Server.CreateObject("Scripting.FileSystemObject")
	oFSO.DeleteFile(Server.MapPath(sPathFile))
	Set oFSO = Nothing
End Sub

%>

