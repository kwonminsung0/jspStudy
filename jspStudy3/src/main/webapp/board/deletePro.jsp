<%@ page contentType="text/html; charset=UTF-8"%>
<%
String pageNum = (String)request.getAttribute("pageNum");
boolean flag = (Boolean)request.getAttribute("flag");
if (flag == true) {
%>
<script language="JavaScript">alert("게시글이 삭제 되었습니다");</script>
<meta http-equiv="Refresh" content="0;url=list.do?pageNum=<%=pageNum%>">
<%
} else {
%>
<script language="JavaScript">
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
</script>
<%
}
%>