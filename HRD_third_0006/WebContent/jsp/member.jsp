<%@page import="java.sql.Date"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>회원등록</h1>
	<form action="memberAction.jsp" method="post">
		<table>
			<tr>
			<% 
				MemberDAO dao = MemberDAO.getMemberDAO();
				int custno = dao.maxseq();
			%>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" id="custno" readonly="readonly" value="<%= custno %>"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" id="custname"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" id="phone"></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" id="address"></td>
			</tr>
			<tr>
			<% 
				dao = MemberDAO.getMemberDAO();
				Date joindate = dao.date();
			%>
				<th>가입일자</th>
				<td><input type="text" name="joindate" id="joindate" readonly="readonly" value="<%= joindate %>"></td>
			</tr>
			<tr>
				<th>고객등급[A:VIP, B:일반, C:직원]</th>
				<td><input type="text" name="grade" id="grade"></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" id="city"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" id="member">등록</button>
					<button type="button" onclick="location.href='memberList.jsp'">조회</button>
				</th>
			</tr>	
		</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
document.getElementById('member').addEventListener('click', function(e){
	var form = document.forms[0]
	
	var custname = document.getElementById('custname').value;
	var phone = document.getElementById('phone').value;
	var address = document.getElementById('address').value;
	var grade = document.getElementById('grade').value;
	var city = document.getElementById('city').value;
	
	if(custname.length == 0){
		alert('회원이름이 입력되지 않았습니다!')
		document.getElementById('custname').focus()
	}else if(phone.length == 0){
		alert('회원전화가 입력되지 않았습니다!')
		document.getElementById('phone').focus()
	}else if(address.length == 0){
		alert('회원주소가 입력되지 않았습니다!')
		document.getElementById('address').focus()
	}else if(grade.length == 0){
		alert('회원등급이 입력되지 않았습니다!')
		document.getElementById('grade').focus()
	}else if(city.length == 0){
		alert('도시코드가 입력되지 않았습니다!')
		document.getElementById('city').focus()
	}else{
		alert('회원등록이 완료 되었습니다!')
		form.submit()
	}
})
</script>
</body>
</html>