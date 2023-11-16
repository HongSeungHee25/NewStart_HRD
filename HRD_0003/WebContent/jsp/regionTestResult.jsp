<%@page import="dto.PatientDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(지역별) 검사건수통계</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/patient.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>(지역별) 검사건수통계</h1>
	<table>
		<tr>
		<th>지역코드</th>
		<th>지역명</th>
		<th>검사건수</th>
		</tr>
		<% 
			ResultDAO dao = ResultDAO.getResultDAO();
			List<PatientDTO> list = dao.getRegionList();
			
			for(int i = 0; i < list.size(); i++){
				
			String cityNo = list.get(i).getP_city();
			String city = "";
			if(cityNo.equals("10")) city = "서울";
			else if(cityNo.equals("20")) city = "경기";
			else if(cityNo.equals("30")) city = "강원";
			else if(cityNo.equals("40")) city = "대구";
		%>
		<tr>
		<td><%= list.get(i).getP_city() %></td>
		<td><%= city %></td>
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