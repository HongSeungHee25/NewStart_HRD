<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.ClassDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClassDAO"%>
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
			ClassDAO dao = ClassDAO.getClassDAO();
			List<ClassDTO> list = dao.getTotalList();
			for(int i = 0; i < list.size(); i++){
				 DecimalFormat formatter = new DecimalFormat("#,###");
				 String priceFormatted = formatter.format(list.get(i).getTotal());
		%>
		<tr>
			<td><%= list.get(i).getTeacher_code() %></td>
			<td><%= list.get(i).getClass_name() %></td>
			<td><%= list.get(i).getTeacher_name() %></td>
			<td>￦<%= priceFormatted %></td>
		</tr>
		<% 
			}
		%>
	</table>
	
	
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>