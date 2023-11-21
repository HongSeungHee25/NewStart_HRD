<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생목록</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>성적입력</h1>
	<form action="scoreAction.jsp" method="post">
	<table>
		<tr>
			<th>학번</th>
			<td><input type="text" name="sno" id="sno"></td>
		</tr>
		<tr>
			<th>국어점수</th>
			<td><input type="text" name="ekor" id="ekor"></td>
		</tr>
		<tr>
			<th>수학점수</th>
			<td><input type="text" name="emath" id="emath"></td>
		</tr>
		<tr>
			<th>영어점수</th>
			<td><input type="text" name="eeng" id="eeng"></td>
		</tr>
		<tr>
			<th>역사점수</th>
			<td><input type="text" name="ehist" id="ehist"></td>
		</tr>
		<tr>
			<th colspan="2">
			<button type="button" id="score">등록하기</button>
			</th>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
document.getElementById('score').addEventListener('click',function(e){
	var form = document.forms[0]
	
	var sno = document.getElementById('sno').value;
	var ekor = document.getElementById('ekor').value;
	var emath = document.getElementById('emath').value;
	var eeng = document.getElementById('eeng').value;
	var ehist = document.getElementById('ehist').value;
	
	if(sno.length == 0){
		alert('학생번호가 입력되지 않았습니다!')
		document.getElementById('sno').focus()
	}else if(ekor.length == 0){
		alert('국어점수가 입력되지 않았습니다!')
		document.getElementById('ekor').focus()
	}else if(emath.length == 0){
		alert('수학점수가 입력되지 않았습니다!')
		document.getElementById('emath').focus()
	}else if(eeng.length == 0){
		alert('영어점수가 입력되지 않았습니다!')
		document.getElementById('eeng').focus()
	}else if(ehist.length == 0){
		alert('역사점수가 입력되지 않았습니다!')
		document.getElementById('ehist').focus()
	}else{
		alert('성적입력이 정상적으로 등록되었습니다!')
		form.submit()
	}
	
	})
</script>
</body>
</html>