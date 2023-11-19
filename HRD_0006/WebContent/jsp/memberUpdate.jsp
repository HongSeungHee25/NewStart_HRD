<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<% 
	int custno = Integer.parseInt(request.getParameter("custno"));
	MemberDAO dao = MemberDAO.getMemberDAO();
	MemberDTO dto = dao.selectOne(custno);
%>
	<h1>홈쇼핑 회원 정보 수정</h1>
	<form action="memberUpdateAction.jsp" method="post">
	<table>
		<tr>
			<th>회원정보</th>
			<td><input type="text" name="custno" id="custno" value="<%= dto.getCustno() %>"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" id="custname" value="<%= dto.getCustname() %>"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" id="phone" value="<%= dto.getPhone() %>"></td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address" id="address" value="<%= dto.getAddress() %>"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" id="joindate" value="<%= dto.getJoindate() %>"></td>
		</tr>
		<tr>
			<th>고객등급[A:VIP,B:일반,C:직원]</th>
			<td><input type="text" name="grade" id="grade" value="<%= dto.getGrade() %>"></td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td><input type="text" name="city" id="city" value="<%= dto.getCity() %>"></td>
		</tr>
		<tr>
			<th colspan="2">
			<button type="submit" id="update">수정</button>
			<button type="button" onclick="location.href='memberList.jsp'">조회</button>
			</th>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>