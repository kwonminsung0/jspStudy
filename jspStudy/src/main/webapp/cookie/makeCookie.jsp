<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//쿠키값을 한글을 웹브라우저에 보낼 때는 URLEncoder 사용해서 보낸다.
	Cookie cookie = new Cookie("name", URLEncoder.encode("김동진", "UTF-8"));
	//서버에서 클라이언트(웹브라우저) 전송한다.
	response.addCookie(cookie);
%>

<html>
<head><title>쿠키생성</title></head>
<body>
<%= cookie.getName() %> 쿠키의 값 = "<%= cookie.getValue() %>"
</body>
</html>