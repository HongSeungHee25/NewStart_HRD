<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="dao.TeacherDAO"%>
<%@page import="dto.TeacherDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>강사조회</h1>
	<table>
		<tr>
			<th>강사코드</th>
			<th>강사명</th>
			<th>강의명</th>
			<th>수강료</th>
			<th>강사자격취득일</th>
		</tr>
		<% 
			TeacherDAO dao = TeacherDAO.getTeacherDAO();
			List<TeacherDTO> list = dao.getTeacherList();
			for(int i=0; i<list.size(); i++){
				DecimalFormat format = new DecimalFormat("#,###");
				String price = format.format(list.get(i).getClass_price());
		%>
		<tr>
			<td><%= list.get(i).getTeacher_code() %></td>
			<td><%= list.get(i).getTeacher_name() %></td>
			<td><%= list.get(i).getClass_name() %></td>
			<td>￦<%= price %></td>
			<td><%= list.get(i).getTeach_resist_date().substring(0,4)+"년"+list.get(i).getTeach_resist_date().substring(4,6)+"월"+list.get(i).getTeach_resist_date().substring(6,8)+"일" %></td>
		</tr>
	<% 
			}
	%>	
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>