<%@page import="dto.StudentDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생목록</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>학생목록</h1>
<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>학년</th>
		<th>반</th>
		<th>번호</th>
		<th>성별</th>
		<th>전화번호</th>
		<th>주소</th>
	</tr>
	<% 
		StudentDAO dao = StudentDAO.getStudentDAO();
		List<StudentDTO> list = dao.getStudentList();
		for(int i=0; i<list.size(); i++){
			String genderNo = list.get(i).getSgender();
			String gender = "";
			if(genderNo.equals("M")) gender = "남";
			else if(genderNo.equals("F")) gender = "여";
	%>
	<tr>
		<td><%= list.get(i).getSno() %></td>
		<td><%= list.get(i).getSname() %></td>
		<td><%= list.get(i).getSno().substring(0,1) %></td>
		<td><%= list.get(i).getSno().substring(1,3) %></td>
		<td><%= list.get(i).getSno().substring(3,5) %></td>
		<td><%= gender %></td>
		<td><%= list.get(i).getSphone() %></td>
		<td><%= list.get(i).getSaddress() %></td>
	</tr>
	<% 
		}
	%>
</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>