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
	<h2>(과정평가형 정보처리산업기사)진단검사 프로그램 ver 2020-04</h2>
</header>
<nav>
	<ul>
		<li><a href="<%= request.getContextPath() %>/jsp/patientList.jsp">환자조회</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/testResults.jsp">검사결과입력</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/testResultsList.jsp">검사결과조회</a></li>
		<li><a href="<%= request.getContextPath() %>/jsp/region.jsp">지역별검사건수</a></li>
		<li><a href="<%= request.getContextPath() %>/index.jsp">홈으로</a></li>
	</ul>
</nav>
</body>
</html>