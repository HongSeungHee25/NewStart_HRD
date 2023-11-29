<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>후보조회</h1>
	<table>
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>대표번호</th>
		</tr>
		<% 
			MemberDAO dao = MemberDAO.getMemberDAO();
			List<MemberDTO> list = dao.getMemberList();
			for(int i=0; i<list.size(); i++){
				String school = list.get(i).getP_school();
				String p_school = "";
				if(school.equals("1")) p_school = "고졸";
				else if(school.equals("2")) p_school = "학사";
				else if(school.equals("3")) p_school = "석사";
				else if(school.equals("4")) p_school = "박사";
		%>
		<tr>
			<td><%= list.get(i).getM_no() %></td>
			<td><%= list.get(i).getM_name() %></td>
			<td><%= list.get(i).getP_name() %></td>
			<td><%= p_school %></td>
			<td><%= list.get(i).getM_jumin().substring(0,6)+"-"+list.get(i).getM_jumin().substring(6,13) %></td>
			<td><%= list.get(i).getM_city() %></td>
			<td><%= list.get(i).getP_tel1()+"-"+list.get(i).getP_tel2()+"-"+list.get(i).getP_tel3() %></td>
		</tr>
		<% 
			}
		%>
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>