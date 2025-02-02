<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 1.사용자정보를 가져온다 -->
<!-- 2.curd -->
<!-- 3.화면설계(자바코드에 해야되는데 -> jsp service함수에서 진행한다. -->
<html>
<head>
<title>사용자 정보</title>
<style>
#my_table {
	margin: 0 auto;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<%
	if (session == null || session.getAttribute("id") == null) {
	%>
	<!-- 세션이 없거나, id 속성이 없으면 로그인 폼을 출력 -->
	<form method="post" action="login_check.jsp">
		<table border="1" width="300" id="my_table">
			<tr>
				<th width="100">아이디</th>
				<td width="200"><input type="text" name="id" required></td>
			</tr>
			<tr>
				<th width="100">비번</th>
				<td width="200"><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button"
					onclick="location.href = 'new_member.jsp'" value="회원가입"> <input
					type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	<%
	} else {
		// 세션이 있고, 관리자인 경우
		String id = (String) session.getAttribute("id");
		String pass = (String) session.getAttribute("pass");
		String name = (String) session.getAttribute("name");
	
		String superID = "admin";
		if (superID.equals(id)) {
	%>
	<!-- 관리자 정보 출력 -->
	<table border="1" width="500" id="my_table">
		<tr>
			<td width="500" align="center">관리자 계정: <%=id%></td>
		</tr>
		<tr>
			<td width="500" align="center">패스워드: <%=pass%></td>
		</tr>
		<tr>
			<td width="500" align="center">이름: <%=name%></td>
		</tr>
		<tr>
			<td align="center"><input type="button"
				onclick="location.href = 'member_list.jsp'" value="회원들 정보">
				<input type="button" onclick="location.href = 'logout.jsp'"
				value="로그아웃"></td>
		</tr>
	</table>
	<%
		} else {
	// 일반 사용자 정보 출력
	%>
	<!-- 일반 사용자 정보 출력 -->
	<table border="1" width="500" id="my_table">
		<tr>
			<td width="500" align="center"><%=id%> 님 로그인 되었습니다.</td>
		</tr>
		<tr>
			<td width="500" align="center">패스워드: <%=pass%></td>
		</tr>
		<tr>
			<td width="500" align="center">이름: <%=name%></td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" onclick="location.href = 'member_change.jsp'" value="회원정보변경">
				<input type="button" onclick="location.href = 'logout.jsp'" value="로그아웃">
				<input type="button" onclick="location.href = 'member_delete_question.jsp'" value="탈퇴하기">
			</td>
		</tr>
	</table>
	<%
	} // 일반 사용자 정보 출력 end
} // 세션이 있고, 관리자인 경우 end
	%>

</body>
</html>