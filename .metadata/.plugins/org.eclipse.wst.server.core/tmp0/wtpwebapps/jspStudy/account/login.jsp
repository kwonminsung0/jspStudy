<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String id = (String) session.getAttribute("id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<% if (id == null) { %>
	<!-- 세션이 없을 때 -->
	<form method='post' action='/jspStudy/account/login_check.jsp'>
		<table border='1' width='300' align='center'>
			<tr>
				<th width='100'>아이디</th>
				<td width='200'>&nbsp;<input type='text' name='id'></td>
			</tr>
			<tr>
				<th width='100'>비번</th>
				<td width='200'>&nbsp;<input type='password' name='pwd'></td>
			</tr>
			<tr>
				<td align='center' colspan='2'><a
					href='/jspStudy/member/member.html'><input type='button'
						value='회원가입'></a> &nbsp; &nbsp; <input type='submit'
					value='로그인'></td>
			</tr>
		</table>
	</form>
	<% } else { %>
	<table border='1' width='300' align='center'>
		<tr>
			<td width='300' align='center'><%= id %> 님 로그인 되었습니다.</td>
		</tr>
		<tr>
			<td align='center'><a href='/jspStudy/account/mypage.jsp'>회원정보</a>
				&nbsp;&nbsp; <a href='/jspStudy/account/logout.jsp'>로그아웃</a></td>
		</tr>
	</table>
	<% } %>
</body>
</html>
