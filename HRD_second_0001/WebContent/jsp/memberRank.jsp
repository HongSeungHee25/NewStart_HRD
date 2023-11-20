<%@page import="dto.VoteDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.VoteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보자등수</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>후보자등수</h1>
	<table>
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>총투표건수</th>
		</tr>
		<% 
			VoteDAO dao = VoteDAO.getVoteDAO();
			List<VoteDTO> list = dao.getRanking();
			for(int i=0;i<list.size();i++){
		%>
		<tr>
			<td><%= list.get(i).getM_no() %></td>
			<td><%= list.get(i).getV_name() %></td>
			<td><%= list.get(i).getCount() %></td>
		</tr>
		<% 
			}
		%>
	</table>
	
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>