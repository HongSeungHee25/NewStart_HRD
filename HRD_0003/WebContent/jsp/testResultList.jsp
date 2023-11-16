<%@page import="dto.ResultDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/patient.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>검사결과조회</h1>
	<table>
		<tr>
		<th>환자번호</th>
		<th>환자명</th>
		<th>검사명</th>
		<th>검사시작일</th>
		<th>검사상태</th>
		<th>검사완료일</th>
		<th>검사결과</th>
		</tr>
		<% 
			ResultDAO dao = ResultDAO.getResultDAO();
			List<ResultDTO> list = dao.getList();
			
			for(int i = 0; i < list.size(); i++){
				
			String statusNum = list.get(i).getT_status();
			String t_status = "";
			if(statusNum.equals("1")) t_status = "검사중";
			else if(statusNum.equals("2")) t_status = "검사완료";
			
			String resultNo = list.get(i).getT_result();
			String t_result = "";
			if(resultNo.equals("X")) t_result = "미입력";
			else if(resultNo.equals("P")) t_result = "양성";
			else if(resultNo.equals("N")) t_result = "음성";
		%>
		<tr>
		<td><%= list.get(i).getP_no() %></td>
		<td><%= list.get(i).getP_name() %></td>
		<td><%= list.get(i).getT_name() %></td>			
		<td><%= list.get(i).getT_sdate().substring(0,10)%></td>
		<td><%= t_status %></td>
		<td><%= list.get(i).getT_ldate().substring(0,10)%></td>
		<td><%= t_result %></td>
		</tr>
		<% 
			}
		%>
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>