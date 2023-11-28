<%@page import="dto.SaleDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SaleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>회원매출조회</h1>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<% 
			SaleDAO dao = SaleDAO.getSaleDAO();
			List<SaleDTO> list = dao.sale();
			for(int i=0; i<list.size(); i++){
				String gradeChar = list.get(i).getGrade();
				String grade = "";
				if(gradeChar.equals("A")) grade = "VIP";
				else if(gradeChar.equals("B")) grade = "일반";
				else if(gradeChar.equals("C")) grade = "직원";
		%>
		<tr>
			<td><%= list.get(i).getCustno() %></td>
			<td><%= list.get(i).getCustname() %></td>
			<td><%= grade %></td>
			<td><%= list.get(i).getTotal() %></td>
		</tr>
		<% 
			}
		%>
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>