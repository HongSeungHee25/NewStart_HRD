<%@page import="vo.StudentVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
<link rel="stylesheet" href="../css/list.css">
<link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<% 
	@SuppressWarnings("unchecked")
	List<StudentVo> list = (List<StudentVo>)request.getAttribute("list");
%>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<h1>학생목록</h1>
<div id="list">
<table>
<thead>
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
	</thead>
	
<%
	if (list != null && !list.isEmpty()) {
		for(StudentVo vo : list) {
%>

<tbody>
	<tr>
		<td><a href="academicInsertView.jsp?sno=<%= vo.getSno() %>">
		<%= vo.getSno() %></a></td>
		<td><%= vo.getSname() %></td>
		<td><%= vo.getGrade() %></td>
		<td><%= vo.getClass1() %></td>
		<td><%= vo.getClassnum() %></td>
		<td><%= vo.getSgender() %></td>
		<td><%= vo.getSphone() %></td>
		<td><%= vo.getSaddress() %></td>
	</tr>
	</tbody>
<% 
		}
	 } else {
		    %>
		    <tr>
		        <td colspan="3">회원이 없습니다.</td>
		    </tr>
		    <%
		        }
		    %>
</table>
</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>