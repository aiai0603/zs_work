
<%
' ����༭�����ݺܶ࣬�ϴ��ٶ�̫�������������µ�ʱ�䣬��λ��
'Server.ScriptTimeout = 600

Dim sContent1, i

For i = 1 To Request.Form("content1").Count 
	sContent1 = sContent1 & Request.Form("content1")(i) 
Next 

Response.Write "�༭�������£�<br><br>" & sContent1
Response.Write "<br><br><p><input type=button value=' �˻� ' onclick='history.back()'></p>"

%>