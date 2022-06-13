<%@ Language=VBScript CODEPAGE=936%>
<% Option Explicit %>
<%
'������������������������������������
'��                                                                  ��
'��                eWebEditor - eWebSoft���߱༭��                   ��
'��                                                                  ��
'��  ��Ȩ����: eWebSoft.com                                          ��
'��                                                                  ��
'��  ��������: eWeb�����Ŷ�                                          ��
'��            email:webmaster@webasp.net                            ��
'��            QQ:589808                                             ��
'��                                                                  ��
'��  �����ַ: [��Ʒ����]http://www.eWebSoft.com/Product/eWebEditor/ ��
'��            [֧����̳]http://bbs.eWebSoft.com/                    ��
'��                                                                  ��
'��  ��ҳ��ַ: http://www.eWebSoft.com/   eWebSoft�ŶӼ���Ʒ         ��
'��            http://www.webasp.net/     WEB������Ӧ����Դ��վ      ��
'��            http://bbs.webasp.net/     WEB����������̳            ��
'��                                                                  ��
'������������������������������������
%>

<%

' ============================================
' ����ȫ�ֱ���
' ============================================
' ���ݿ����
Dim oConn, oRs, sSql


' ============================================
' ��ʼ���ݴ���
' ============================================
' ��ʼ�����ݿ�����
Call DBConnBegin()


' ********************************************
' ����Ϊ���ݿ���غ���
' ********************************************
' ============================================
' ��ʼ�����ݿ����Ӷ���
' ʹ��ԭ����ٵ��ã������ͷ�
' ============================================
Sub DBConnBegin()
	' ������ݿ�����Ѵ򿪣���Ҫ�ٴ�
	If IsObject(oConn) = True Then Exit Sub

	' ����Բ���Ҫ�����ݿ����Ӷ����ֱ�Ӵ򿪼�¼�����󣬵��������Ҫ�򿪶����¼������Ļ���Ч���Ǻܵ͵ġ�
	' ����㲻����һ�����ݿ����Ӷ���ADO����ÿ����¼����ʱ�Զ�����һ���µ����ݿ����Ӷ��󣬾������õ�����ͬ��SQL��䡣
	Set oConn = Server.CreateObject("ADODB.Connection")

	On Error Resume Next
	' Access���ݿ�
	oConn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("db.mdb")
	
	If Err.Number > 0 Then
		' ��ʾ������Ϣ,���ҷ����ʼ�֪ͨ����Ա
		'Call DBConnError(Err)
		
		' ��ȫ���˳��������еĽű�
		Response.End
	End If

	' ����һ����¼��
	Set oRs = Server.CreateObject( "ADODB.Recordset" )
End Sub

' ============================================
' �ͷ����ݿ����Ӷ���
' ============================================
Sub DBConnEnd()
	On Error Resume Next
	oRs.Close
	Set oRs = Nothing
	oConn.Close
	Set oConn = Nothing
End Sub



' ********************************************
' ����Ϊ���ú���
' ********************************************
' ============================================
' ���󷵻ش���
' ============================================
Sub GoError(str)
	Call DBConnEnd()
	Response.Write "<script language=javascript>alert('" & str & "\n\nϵͳ���Զ�����ǰһҳ��...');history.back();</script>"
	Response.End
End Sub

' ============================================
' �õ���ȫ�ַ���,�ڲ�ѯ�л��б�Ҫǿ���滻�ı���ʹ��
' ============================================
Function GetSafeStr(str)
	GetSafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function

' ============================================
' ���ַ�������HTML����,�滻server.htmlencode
' ȥ��Html��ʽ��������ʾ���
' ============================================
Function outHTML(str)
	Dim sTemp
	sTemp = str
	outHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	sTemp = Replace(sTemp, Chr(10), "<br>")
	outHTML = sTemp
End Function

' ============================================
' ȥ��Html��ʽ�����ڴ����ݿ���ȡ��ֵ���������ʱ
' ע�⣺value="?"���һ��Ҫ��˫����
' ============================================
Function inHTML(str)
	Dim sTemp
	sTemp = str
	inHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	inHTML = sTemp
End Function

' ===============================================
' ��ʼ��������
'	s_FieldName	: ���ص���������	
'	a_Name		: ��ֵ������
'	a_Value		: ��ֵֵ����
'	v_InitValue	: ��ʼֵ
'	s_Sql		: �����ݿ���ȡֵʱ,select name,value from table
'	s_AllName	: ��ֵ������,��:"ȫ��","����","Ĭ��"
' ===============================================
Function InitSelect(s_FieldName, a_Name, a_Value, v_InitValue, s_Sql, s_AllName)
	Dim i
	InitSelect = "<select name='" & s_FieldName & "' size=1>"
	If s_AllName <> "" Then
		InitSelect = InitSelect & "<option value=''>" & s_AllName & "</option>"
	End If
	If s_Sql <> "" Then
		oRs.Open s_Sql, oConn, 0, 1
		Do While Not oRs.Eof
			InitSelect = InitSelect & "<option value=""" & inHTML(oRs(1)) & """"
			If oRs(1) = v_InitValue Then
				InitSelect = InitSelect & " selected"
			End If
			InitSelect = InitSelect & ">" & outHTML(oRs(0)) & "</option>"
			oRs.MoveNext
		Loop
		oRs.Close
	Else
		For i = 0 To UBound(a_Name)
			InitSelect = InitSelect & "<option value=""" & inHTML(a_Value(i)) & """"
			If a_Value(i) = v_InitValue Then
				InitSelect = InitSelect & " selected"
			End If
			InitSelect = InitSelect & ">" & outHTML(a_Name(i)) & "</option>"
		Next
	End If
	InitSelect = InitSelect & "</select>"
End Function

' ============================================
' ÿҳͷ������
' ============================================
Sub Header(str)
	Response.Write "<HTML><HEAD><TITLE>eWebEditor���߱༭�� - ���ӣ�����ϵͳ</TITLE><style>body,p,td,input {font-size:9pt}</style></HEAD><BODY>"
	Response.Write "<p align=center><a href='list.asp'>�����б�</a> | <a href='add.asp'>��������</a></p>"
	Response.Write "<p align=center><b>" & str & "</b></p>"
End Sub

' ============================================
' ÿҳ�ײ�����
' ============================================
Sub Footer()
	Call DBConnEnd()
	Response.Write "</BODY></HTML>"
End Sub

%>