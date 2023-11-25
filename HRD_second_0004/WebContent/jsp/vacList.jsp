<%@page import="dto.VaccresvDTO"%>
<%@page import="dao.VaccresvDAO"%>
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
		int resvno = Integer.parseInt(request.getParameter("resvno"));
		VaccresvDAO dao = VaccresvDAO.getVaccresvDAO();
		VaccresvDTO dto = dao.selectOne(resvno);
		
		char jumin = dto.getJumin().charAt(7);
		String gender = "";
		if(jumin == '1') gender = "남";
		if(jumin == '2') gender = "여";
		
		String addrNo = dto.getHospaddr();
		String address = "";
		if(addrNo.equals("10")) address = "서울";
		else if(addrNo.equals("20")) address = "대전";
		else if(addrNo.equals("30")) address = "대구";
		else if(addrNo.equals("40")) address = "광주";
		
		String vac = dto.getVcode();
		String vcode = "";
		if(vac.equals("V001")) vcode="A백신";
		else if(vac.equals("V002")) vcode="B백신";
		else if(vac.equals("V003")) vcode="C백신";
		
		int time = dto.getResvtime();
		String resvTime = String.format("%02d:%02d", time / 100, time % 100);
	%>
	<tr>
		<td><%= dto.getResvno() %></td>
		<td><%= dto.getName() %></td>
		<td><%= gender %></td>
		<td><%= dto.getHospname() %></td>
		<td><%= dto.getResvdate().substring(0,4)+"년"+ dto.getResvdate().substring(5,7)+"월"+dto.getResvdate().substring(8,10)+"일" %></td>
		<td><%= resvTime %></td>
		<td><%= vcode %></td>
		<td><%= address %></td>
	</tr>
	</table>
	<div id="button">
		<button onclick="location.href='vaccresvSelect.jsp'">돌아가기</button> 
		</div>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>