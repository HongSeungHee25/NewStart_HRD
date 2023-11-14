<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적입력</title>
<link rel="stylesheet" href="../css/reg.css">
<link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<h2>성적입력</h2>
<form action="academicInsertAction.jsp" method="post">
<table>
	<tr>
	<th>학번</th>
	<td><input type="text" name="sno"></td>
	</tr>
	<tr>
	<th>국어점수</th>
	<td><input type="text" name="ekor"></td>
	</tr>
	<tr>
	<th>수학점수</th>
	<td><input type="text" name="emath"></td>
	</tr>
	<tr>
	<th>영어점수</th>
	<td><input type="text" name="eeng"></td>
	</tr>
	<tr>
	<th>역사점수</th>
	<td><input type="text" name="ehist"></td>
	</tr>
	<tr>
	<td colspan="2">
	<button type="submit">등록하기</button>
	</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>