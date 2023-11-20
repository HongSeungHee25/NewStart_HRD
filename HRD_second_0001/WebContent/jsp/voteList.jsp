<%@page import="dto.VoteDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.VoteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>투표검수조회</h1>
	<table>
		<tr>
			<th>성명</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
		</tr>
		<% 
			VoteDAO dao = VoteDAO.getVoteDAO();
			List<VoteDTO> list = dao.getVoteList();
			for(int i=0; i<list.size();i++){
				char jumin = list.get(i).getV_jumin().charAt(6);
				String gender = "";
				if(jumin == '1') gender = "남";
				else if(jumin == '2') gender = "여";
				
				String confirmNo = list.get(i).getV_confirm();
				String confirm = "";
				if(confirmNo.equals("Y")) confirm = "확인";
				else if(confirmNo.equals("N")) confirm = "미확인";
		%>
		<tr>
			<td><%= list.get(i).getV_name() %></td>
			<td>19<%= list.get(i).getV_jumin().substring(0,2)+"년"+list.get(i).getV_jumin().substring(2,4)+"월"+list.get(i).getV_jumin().substring(4,6)+"일생" %></td>
			<td>만 <%= list.get(i).getV_age()%>세</td>
			<td><%= gender %></td>
			<td><%= list.get(i).getM_no() %></td>
			<td><%= list.get(i).getV_time().substring(0,2)+":"+list.get(i).getV_time().substring(2,4) %></td>
			<td><%= confirm %></td>
		</tr>
		<% 
			}
		%>
	</table>
	
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>