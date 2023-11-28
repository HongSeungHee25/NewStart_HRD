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
<% 
	MemberDAO dao = MemberDAO.getMemberDAO();
	int custno = dao.max();
%>
	<h1>회원등록</h1>
	<form action="memberAction.jsp" method="post">
		<table>
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%= custno %>" readonly="readonly"></td>
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
				<th>가입일자</th>
				<td><input type="date" name="joindate" id="joindate" readonly="readonly"></td>
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
document.getElementById('member').addEventListener('click',function(e){
	var form  = document.forms[0]
	
	var custname = document.getElementById('custname').value;
	var phone = document.getElementById('phone').value;
	var address = document.getElementById('address').value;
	var grade = document.getElementById('grade').value;
	var city = document.getElementById('city').value;
	
	if(custname.length == 0){
		alert('회원성명이 입력되지 않았습니다!')
		document.getElementById('custname').focus()
	}else if(phone.length == 0){
		alert('회원전화번호가 입력되지 않았습니다!')
		document.getElementById('phone').focus()
	}else if(address.length == 0){
		alert('회원주소가 입력되지 않았습니다!')
		document.getElementById('address').focus()
	}else if(grade.length == 0){
		alert('고객등급이 입력되지 않았습니다!')
		document.getElementById('grade').focus()
	}else if(city.length == 0){
		alert('도시코드가 입력되지 않았습니다!')
		document.getElementById('city').focus()
	}else{
		alert('회원등록이 완료 되었습니다!')
		form.submit()
	}
	
})
document.getElementById('joindate').value = new Date().toISOString().substring(0, 10);;

</script>
</body>
</html>