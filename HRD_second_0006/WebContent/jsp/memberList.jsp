<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>회원목록</h1>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<% 
			MemberDAO dao = MemberDAO.getMemberDAO();
			List<MemberDTO> list = dao.getMemberList();
			for(int i=0; i<list.size(); i++){
				String gradeChar = list.get(i).getGrade();
				String grade = "";
				if(gradeChar.equals("A")) grade = "VIP";
				else if(gradeChar.equals("B")) grade = "일반";
				else if(gradeChar.equals("C")) grade = "직원";
		%>
		<tr>
			<td><a href="memberUpdate.jsp?custno=<%= list.get(i).getCustno() %>">
			<%= list.get(i).getCustno() %></a></td>
			<td><%= list.get(i).getCustname() %></td>
			<td><%= list.get(i).getPhone() %></td>
			<td><%= list.get(i).getAddress() %></td>
			<td><%= list.get(i).getJoindate() %></td>
			<td><%= grade %></td>
			<td><%= list.get(i).getCity() %></td>
		</tr>	
		<% 
			}
		%>
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>