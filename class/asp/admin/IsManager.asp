<%
founderr=false
if session("flag")<>1 then
    response.write "<script>alert('您的操作有误！请重新登录！');location.href('login.asp')</script>"
	founderr=true
	response.end
end if
%>                                                                                                                                                                                                                                                          
