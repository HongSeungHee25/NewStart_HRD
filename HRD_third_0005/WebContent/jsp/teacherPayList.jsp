<%@page import="dto.TeacherDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.TeacherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>강사매출현황</h1>
	<table>
		<tr>
			<th>강사코드</th>
			<th>강의명</th>
			<th>강사명</th>
			<th>총매출</th>
		</tr>
		<% 
			TeacherDAO dao = TeacherDAO.getTeacherDAO();
			List<TeacherDTO> list = dao.getTeacherPayList();
			for(int i=0; i<list.size(); i++){
		%>
		<tr>
			<td><%= list.get(i).getTeacher_code() %></td>
			<td><%= list.get(i).getClass_name() %></td>
			<td><%= list.get(i).getTeacher_name() %></td>
			<td><%= list.get(i).getSum() %></td>
		</tr>
		<% 
			}
		%>
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>