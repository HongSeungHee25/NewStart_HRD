<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
<header>
	<h2>(정보처리산업기사)골프연습장 회원관리 프로그램 ver1.0</h2>
</header>
<nav>
	<ul>
		<li><a href="<%= request.getContextPath() %>/jsp/teacher.jsp">강사조회</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/class.jsp">수강신청</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/member.jsp">회원정보조회</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/teacherPay.jsp">강사매출현황</a></li>
		<li><a href="<%= request.getContextPath() %>/index.jsp">홈으로</a></li>
	</ul>
</nav>
</body>
</html>