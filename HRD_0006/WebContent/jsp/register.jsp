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
	<h1>쇼핑몰 회원 등록</h1>
	<form action="registerAction.jsp" method="post">
	<table>
	<% 
		MemberDAO dao = MemberDAO.getMemberDAO();
		int custno = dao.maxSeq();
	%>
		<tr>
			<th>회원정보(자동발생)</th>
			<td><input type="text" name="custno" id="custno" value="<%= custno %>" readonly="readonly"></td>
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
			<td><input type="text" name="joindate" id="joindate" disabled="disabled"></td>
		</tr>
		<tr>
			<th>고객등급[A:VIP,B:일반,C:직원]</th>
			<td><input type="text" name="grade" id="grade"></td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td><input type="text" name="city" id="city"></td>
		</tr>
		<tr>
			<th colspan="2">
			<button type="button" id="register">등록</button>
			<button type="button" onclick="location.href='memberList.jsp'">조회</button>
			</th>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
const patternDate = (vdate,symbol) =>
{
	const year = vdate.getFullYear()
	const month = (vdate.getMonth()+1).toString().padStart(2,0)
	const day = (vdate.getDate()).toString().padStart(2,0)
	
	let result = [year,month,day].join(symbol)

	return result
}

document.forms[0].joindate.value = patternDate(new Date(),'')

document.getElementById('register').addEventListener('click',function(e){
	var form = document.forms[0]
	
	var custname = document.getElementById('custname').value;
	var phone = document.getElementById('phone').value;
	var address = document.getElementById('address').value;
	var grade = document.getElementById('grade').value;
	var city = document.getElementById('city').value;
	
	if(custname.length == 0){
		alert('회원 이름이 입력되지 않았습니다!')
		document.getElementById('custname').focus()
	}else if(phone.length == 0){
		alert('전화번호가 입력되지 않았습니다!')
		document.getElementById('phone').focus()
	}else if(address.length == 0){
		alert('주소가 입력되지 않았습니다!')
		document.getElementById('address').focus()
	}else if(grade.length == 0){
		alert('회원등급이 입력되지 않았습니다!')
		document.getElementById('grade').focus()
	}else if(city.length == 0){
		alert('도시코드가 입력되지 않았습니다!')
		document.getElementById('city').focus()
	}else{
		alert('회원이 정상적으로 등록되었습니다.')
		form.submit()
	}
})

</script>
</body>
</html>