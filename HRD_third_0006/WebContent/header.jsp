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
	<h2>(과정평가형 정보처리산업기사)쇼핑몰 회원관리 ver1.0</h2>
</header>
<nav>
	<ul>
		<li><a href="<%= request.getContextPath() %>/jsp/member.jsp">회원등록</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/memberList.jsp">회원목록조회/수정</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/sale.jsp">회원매출조회</a></li>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
	</ul>
</nav>
</body>
</html>