<%
founderr=false
if session("flag")<>1 then
    response.write "<script>alert('���Ĳ������������µ�¼��');location.href('login.asp')</script>"
	founderr=true
	response.end
end if
%>                                                                                                                                                                                                                                                          
