<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.account.model.AccountDAO"%>
<%@ page import="co.kh.dev.account.model.AccountVO"%>
<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
//DB
AccountDAO ad = new AccountDAO();
AccountVO avo = new AccountVO(name, id, pwd);
boolean returnFlag = ad.insertDB(avo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<% if (returnFlag) {
		System.out.println("입력성공");
	%>
	<h1 align='center'>회원가입이 완료되었습니다.</h1>
	<table align='center' width='300' border='1'>
		<tr>
			<td align='center'>이름 = <%= name %></td>
		</tr>
		<tr>
		<tr>
			<td align='center'>id = <%= id %></td>
		</tr>
		<tr>
			<td align='center'>비밀번호 = <%= pwd %></td>
		</tr>
		<tr>
			<td align='center'><a href='/jspStudy/account/login.jsp'><input
					type='button' value='로그인'></a></td>
		</tr>
	</table>
	<% } else {
	System.out.println("입력실패");
	%>
	<h1 align='center'>회원가입이 실패되었습니다.</h1>
	<table align='center' width='300' border='1'>
		<tr>
			<td align='center'><a href='/jspStudy/member/member.html'><input
					type='button' value='회원가입'></a></td>
		</tr>
	</table>
	<% } %>
</body>
</html>