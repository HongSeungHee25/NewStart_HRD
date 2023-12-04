<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>백신예약조회</h1>
	<form action="vaccresvSelectAction.jsp" method="post">
		<table>
			<tr>
				<th>예약번호</th>
				<td><input type="text" name="resvno"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit">조회하기</button>
					<button type="button" onclick="location.href='../index.jsp'">홈으로</button>
				</th>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>