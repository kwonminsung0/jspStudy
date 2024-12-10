<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="co.kh.dev.account.model.AccountDAO" %>
<%@ page import="co.kh.dev.account.model.AccountVO" %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//CRUD
	AccountDAO ad = new AccountDAO();
	AccountVO avo = new AccountVO(null, id, pwd);
	AccountVO ravo = ad.selectLoginCheckDB(avo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인체크</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	if (ravo == null) {
		// 아이디와 패스워드가 잘못된 경우이다.
	} else {
		session.setAttribute("id", ravo.getId());
		session.setAttribute("pwd", ravo.getPwd());
		session.setAttribute("name", ravo.getName());
	}
	//3. 화면처리
	response.sendRedirect("login.jsp");
	%>
</body>
</html>