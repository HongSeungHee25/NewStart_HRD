<%@page import="java.util.Calendar"%>
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
<link rel="styleSheet" href="../css/member.css">
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
			List<VoteDTO> list = dao.getList();
			
			for(VoteDTO dto : list){
				char genderNo = dto.getV_jumin().charAt(6);
				String gender = "";
				if(genderNo == '1') gender = "남";
				else if(genderNo == '2') gender = "여";
				
				int currentYear = Calendar.getInstance().get(Calendar.YEAR);
				int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
				int currentDay = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
				
				int birthYear = 1900+Integer.parseInt(dto.getV_jumin().substring(0,2));
				int birthMonth = Integer.parseInt(dto.getV_jumin().substring(2,4));
				int birthDay = Integer.parseInt(dto.getV_jumin().substring(4,6));
				
				int age = currentYear - birthYear;
				
				//만약 생일이 지나지 않았으면 -1
				if(birthMonth * 100 + birthDay > currentMonth * 100 + currentDay)
					age--;
				
				String check = dto.getV_confirm();
				if(check.equals("Y")) dto.setV_confirm("확인");
				else if(check.equals("N")) dto.setV_confirm("미확인");
		%>
		<tr>
			<td><%= dto.getV_name() %></td>
			<td><%= "19" + dto.getV_jumin().substring(0,2) + "년" + dto.getV_jumin().substring(2,4) + "월" + dto.getV_jumin().substring(4,6) + "일생" %></td>
			<td><%= "만" + age + "세" %></td>
			<td><%= gender %></td>
			<td><%= dto.getM_no() %></td>
			<td><%= dto.getV_time().substring(0,2) + ":" + dto.getV_time().substring(2) %></td>
			<td><%= dto.getV_confirm() %></td>
		</tr>
		<%
			}
		%>
	</table>
</section>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>