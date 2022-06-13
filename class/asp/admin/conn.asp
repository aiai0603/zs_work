<%
Dim C,P1,Conn,rs,sql
Set Conn = Server.CreateObject("ADODB.Connection")
C = "Provider=Microsoft.Jet.OLEDB.4.0;"
P1 = "Data Source= "& Server.MapPath ("../data/news.mdb")
Conn.Open C & P1
%>
