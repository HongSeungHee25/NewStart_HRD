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
	<h2>(과정평가형 정보처리산업기사)지역구의원투표 프로그램 ver 2020-05</h2>
</header>
<nav>
	<ul>
		<li><a href="<%= request.getContextPath() %>/jsp/memberList.jsp">후보조회</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/vote.jsp">투표하기</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/voteList.jsp">투표검수조회</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/rangking.jsp">후보자등수</a></li>
		<li><a href="<%= request.getContextPath() %>">홈으로</a></li>
	</ul>

</nav>
</body>
</html>