<%@page import="dto.VacCheckDTO"%>
<%@page import="dao.VacDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>예약번호 <%= request.getParameter("resvno") %>님의 예약 조회</h1>
	<table>
		<tr>
			<th>예약번호</th>
			<th>성명</th>
			<th>성별</th>
			<th>병원이름</th>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>백신코드</th>
			<th>병원지역</th>
		</tr>
		<% 
			VacDAO dao = VacDAO.getVacDAO();
			VacCheckDTO dto = dao.selectOne(Integer.parseInt(request.getParameter("resvno")));
			
			String vcodeNo = dto.getVcode();
			String vcode = "";
			if(vcodeNo.equals("V001")) vcode = "A백신";
			else if(vcodeNo.equals("V002")) vcode = "B백신";
			else if(vcodeNo.equals("V003")) vcode = "C백신";
			
			String addrNo = dto.getHospaddr();
			String hospaddr = "";
			if(addrNo.equals("10")) hospaddr = "서울";
			else if(addrNo.equals("20")) hospaddr = "대전";
			else if(addrNo.equals("30")) hospaddr = "대구";
			else if(addrNo.equals("40")) hospaddr = "광주";
			
			int resvT = dto.getResvtime();
			String resvtime = String.format("%02d:%02d", resvT / 100, resvT % 100);
			
			char genderNo = dto.getJumin().charAt(7);
			String gender = "";
			if(genderNo == '1') gender = "남";
			else if(genderNo == '2') gender = "여";

		%>
		<tr>
			<td><%= dto.getResvno() %></td>
			<td><%= dto.getName() %></td>
			<td><%= gender %></td>
			<td><%= dto.getHospname() %></td>
			<td><%= dto.getResvdate().substring(0,4)+"년"+dto.getResvdate().substring(5,7)+"월"+dto.getResvdate().substring(8,10)+"일" %></td>
			<td><%= resvtime %></td>
			<td><%= vcode %></td>
			<td><%= hospaddr %></td>
		</tr>
	</table>
	<div id="button">
	<button type="button" onclick="location.href='../jsp/vaccresvList.jsp'">돌아가기</button>
	</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>