<%@page import="dto.VaccresvDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.VaccresvDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약현황</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>백신예약현황</h1>
	<table>
		<tr>
			<th>병원지역</th>
			<th>병원지역명</th>
			<th>접종예약건수</th>
		</tr>
		<% 
			VaccresvDAO dao = VaccresvDAO.getVaccresvDAO();
			List<VaccresvDTO> list = dao.list();
			int sum = 0;
			int count = 0;
			for(int i=0; i<list.size(); i++){
				String addrNo = list.get(i).getHospaddr();
				String address = "";
				if(addrNo.equals("10")) address = "서울";
				else if(addrNo.equals("20")) address = "대전";
				else if(addrNo.equals("30")) address = "대구";
				else if(addrNo.equals("40")) address = "광주";
				
				count = list.get(i).getCount();
				
				sum += count;
		%>
		<tr>
			<td><%= list.get(i).getHospaddr() %></td>
			<td><%= address %></td>
			<td><%= list.get(i).getCount() %></td>
		</tr>
		<% 
			}
		%>
		<tr>
			<th colspan="2">총합</th>
			<td><%= sum %></td>
		</tr>
	</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>