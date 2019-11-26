<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
request.setCharacterEncoding("UTF-8");
request.getSession().getAttribute("username");
System.out.println(request.getSession().getAttribute("username"));
if(request.getSession().getAttribute("username")==null){
response.sendRedirect("login.jsp");
}
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>凯迈机电</title>
<meta http-equiv=Content-Type content=text/html;charset=gb2312>
</head>
<FRAMESET id=index border=0 frameSpacing=0 rows=5%,* frameBorder=no>
<FRAME id=topFrame name=topFrame src="admin_top.jsp" noResize scrolling=no>

<FRAMESET border=0 frameSpacing=0 frameBorder=no cols=220px,*>
<FRAME id=leftFrame name=leftFrame src="leftnew.jsp" noResize scrolling=no>

<FRAME id=leftFrame name=main src="right.jsp" noResize >


</FRAMESET>
</FRAMESET>
<noframes>
</noframes>
</HTML>
