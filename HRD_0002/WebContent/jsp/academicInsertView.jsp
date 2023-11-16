<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적입력</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>성적입력</h1>
	<form action="academicInsertAction.jsp" method="POST">
		<table>
			<tr>
				<th>학번</th>
				<td><input type="text" name="sno" id="sno"></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td><input type="text" class="score" name="ekor" id="ekor"></td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td><input type="text" class="score" name="emath" id="emath"></td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td><input type="text" class="score" name="eeng" id="eeng"></td>
			</tr>
			<tr>
				<th>역사점수</th>
				<td><input type="text" class="score" name="ehist" id="ehist"></td>
			</tr>
			<tr>
				<td colspan="2" id="button"><button type="button" id="regist">등록하기</button></td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
	document.getElementById('regist').addEventListener('click',function(e){
		var sno = document.getElementById('sno').value
		var ekor = document.getElementById('ekor').value
		var emath = document.getElementById('emath').value
		var eeng = document.getElementById('eeng').value
		var ehist = document.getElementById('ehist').value
		
		if(sno == '') {
			alert('학생번호가 입력되지 않았습니다.')
			document.getElementById('sno').focus()
		} else if(ekor == '') alert('국어 점수가 입력되지 않았습니다.')
		else if(emath == '') alert('수학 점수가 입력되지 않았습니다.')
		else if(eeng == '') alert('영어 점수가 입력되지 않았습니다.')
		else if(ehist == '') alert('역사 점수가 입력되지 않았습니다.')
		else {
			alert('학생 성적이 모두 입력되었습니다.')
			document.forms[0].submit()
		}
		
	})
</script>
</body>
</html>