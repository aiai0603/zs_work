<!--#include file = "Startup.asp"-->

<%

' ======================
' ���ܣ������б�
' ��������ҳ����û��ʹ�õ�eWebEditor��ص����ݣ�ֻ�ṩ�����б�����ʾ���޸ġ�ɾ������ҳ�����ӡ�
' ======================

Call Header("�����б�")
Call Content()
Call Footer()


' ��ҳ������
Sub Content()

	' �����ſ���ȡ���������ţ���ID������
	sSql = "SELECT * FROM NewsData ORDER BY D_ID DESC"
	oRs.Open sSql, oConn, 0, 1
	If Not oRs.Eof Then
		Do While Not oRs.Eof
			Response.Write "<li>"
			' �Ƿ������ű���ͼƬ�������������ʾ
			If oRs("D_Picture") <> "" Then
				Response.Write "<img border=0 src='" & oRs("D_Picture") & "'>"
			End If
			' ��ʾ����
			' ����outHTML��ȥ��Html��ʽ��������ʾ���,�������startup.asp�ļ��е�˵��
			Response.Write "<a href='show.asp?id=" & oRs("d_id") & "'>" & outHTML(oRs("d_title")) & "</a>&nbsp;&nbsp;"
			' ��ʾ�޸�����
			Response.Write "[<a href='modify.asp?id=" & oRs("d_id") & "'>�޸�</a>]"
			' ��ʾɾ������
			Response.Write "[<a href='delete.asp?id=" & oRs("d_id") & "'>ɾ��</a>]"
			oRs.MoveNext
		Loop
	Else
		Response.Write "�������ݿ��л�û�����ţ�"
	End If
	oRs.Close

End Sub

%>
