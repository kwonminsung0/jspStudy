<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="co.kh.dev.login.model.LoginDAO"%>
<%@ page import="co.kh.dev.login.model.LoginVO"%>
<%
// 1.1 전송된 값을 UTF-8로 설정하기, 사용자 입력 받은 비밀번호 값
request.setCharacterEncoding("UTF-8");
String pass = request.getParameter("pass");
String pass1 = request.getParameter("pass1");

// 세션에서 사용자 아이디 가져오기
String id = (String) session.getAttribute("id");
String message = "";

// 2. 비밀번호 변경 처리
boolean successFlag = false;

if (pass != null && pass.equals(pass1)) {
	// 비밀번호가 일치하면 DB에서 비밀번호를 변경
	LoginDAO ld = new LoginDAO();
	LoginVO lvo = new LoginVO(id, pass);
	successFlag = ld.changeLogin(lvo);
	if(successFlag == true){
	session.setAttribute("pass", pass);
	message = "비밀번호가 잘 수정되었습니다.";
	}else{
		message = "비밀번호가 수정이 잘못되었습니다.";
	}
}else{
	message = "패스워드 입력문제가 있거나 패스워드가 일치하지 않습니다.";
}
%>
	<html>
	<head>
	<script>
		window.onload = function() {
		alert('<%= message %>');
		window.location.href = 'login_main.jsp';
		};
	</script>
	</head>
	<body>
	</body>
	</html>