<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
String pwd = (String) session.getAttribute("pwd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (name == null || id == null || pwd == null) {
		// 세션이 등록이 되지 않아서 보여줄 정보가 없습니다. (페이지 이동)
	} else {
	%>
	<h1 align='center'>마이페이지</h1>
	<table align='center' width='300' border='1'>
		<tr>
			<td align='center'>이름 = <%= name %></td>
		</tr>
		<tr>
			<td align='center'>id = <%= id %></td>
		</tr>
		<tr>
			<td align='center'>비밀번호 = <%= pwd %></td>
		</tr>
		<tr>
			<td align='center'>
			<a href='/jspStudy/account/login.jsp'>
			<input type='button' value='로그인으로가기'></a></td>
		</tr>
	</table>
	<%
	}
	%>
</body>
</html>