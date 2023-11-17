<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<header>
	<h2>(과정평가형 정보처리산업기사)학사관리 프로그램</h2>
</header>
<nav>
	<ul>
		<li><a href="<%= request.getContextPath() %>/jsp/studentList.jsp">학생목록</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/academicInsertView.jsp">성적입력</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/studentAcademic.jsp">학생성적</a></li>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
	</ul>
</nav>

</body>
</html>