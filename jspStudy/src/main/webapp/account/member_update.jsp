<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="co.kh.dev.account.model.AccountDAO"%>
<%@ page import="co.kh.dev.account.model.AccountVO"%>
<%@ page import="co.kh.dev.common.DBUtility"%>
<%
Connection con = null;
PreparedStatement pstmt = null;
String name = request.getParameter("name");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String sid = (String) session.getAttribute("id");
AccountDAO ad = new AccountDAO();
AccountVO avo = new AccountVO(name, id, pwd);
boolean returnFlag = ad.updateDB(avo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
	<%
	if (sid == null) {
		System.out.println("세션값이 없습니다.");
		response.sendRedirect("mypage.jsp");
	} else {
		System.out.println("세션값이 있습니다.");
		if (!(sid.equals(id))) {
			System.out.println("세션 아이디값이 일치하지 않습니다.");
			response.sendRedirect("mypage.jsp");
		} else {
			if (returnFlag == true) {
		session.setAttribute("pwd", pwd);
		session.setAttribute("name", name);
		response.sendRedirect("mypage.jsp");
			} else {
		System.out.println("입력실패");
	%>
	<h1 align='center'>회원가입이 실패되었습니다.</h1>
	<table align='center' width='300' border='1'>
		<tr>
			<td align='center'><a href='/jspStudy/account/login.jsp'><input
					type='button' value='로그인'></a></td>
		</tr>
	</table>
	<%
			}
		}
	}
	%>
</body>
</html>