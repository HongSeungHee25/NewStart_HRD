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
	<h2>(과정평가형 정보처리산업기사)백신예약 프로그램 ver 202109</h2>
</header>
<nav>
	<ul>
		<li><a href="<%= request.getContextPath() %>/jsp/vaccresv.jsp">백신예약</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/vaccresvSelect.jsp">백신예약조회</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/vaccresvList.jsp">백신예약현황</a></li>
		<li><a href="<%= request.getContextPath() %>/index.jsp">홈으로</a></li>
	</ul>
</nav>
</body>
</html>