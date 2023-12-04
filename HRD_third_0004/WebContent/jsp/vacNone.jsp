<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>예약번호 <%= request.getParameter("resvno") %>로 조회된 결과가 없습니다.</h1>
	<div id="button">
	<button id="button" onclick="location.href='../index.jsp'">홈으로</button>
	</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>