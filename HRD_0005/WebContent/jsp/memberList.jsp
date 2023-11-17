<%@page import="dto.MemberDTO"%>
<%@page import="dao.ClassMemberDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>회원정보조회</h1>
	<table>
		<tr>
			<th>수강월</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>강의명</th>
			<th>강의장소</th>
			<th>수강료</th>
			<th>등급</th>
		</tr>
		<%
			ClassMemberDAO dao = ClassMemberDAO.getMemberDAO();
			List<MemberDTO> list = dao.memberList();
			for(int i = 0; i < list.size(); i++){
				DecimalFormat formatter = new DecimalFormat("#,###");
				 String priceFormatted = formatter.format(list.get(i).getTuition());
		%>
		<tr>
			<td><%= list.get(i).getResist_month().substring(0,4)+"년"+list.get(i).getResist_month().substring(4,6)+"월" %></td>
			<td><%= list.get(i).getC_no() %></td>
			<td><%= list.get(i).getC_name() %></td>
			<td><%= list.get(i).getClass_name() %></td>
			<td><%= list.get(i).getClass_area() %></td>
			<td>￦<%= priceFormatted %></td>
			<td><%= list.get(i).getGrade() %></td>
		</tr>
		 <% 
			}
		 %>
	</table>
	
	
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>