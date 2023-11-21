<%@page import="dto.ScoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>학생성적</h1>
<table>
	<tr>
		<th>학년</th>
		<th>반</th>
		<th>번호</th>
		<th>이름</th>
		<th>국어</th>
		<th>수학</th>
		<th>영어</th>
		<th>역사</th>
		<th>합계</th>
		<th>평균</th>
		<th>순위</th>
	</tr>
	<%
			ScoreDAO dao = ScoreDAO.getScoreDAO();
			List<ScoreDTO> list = dao.getScore();
			
			int count = 0;
			
			int t_kor = 0;
			int t_math = 0;
			int t_eng = 0;
			int t_hist = 0;
			int total = 0;
			double average = 0;
			
			for(ScoreDTO dto : list){
				if(!dto.getKor().equals("")){
					t_kor += Integer.parseInt(dto.getKor());
					t_math += Integer.parseInt(dto.getMath());
					t_eng += Integer.parseInt(dto.getEng());
					t_hist += Integer.parseInt(dto.getHist());
					total += Integer.parseInt(dto.getTotal());
					average += Double.parseDouble(dto.getAverage());
					count++;
				}
		%>
		<tr>
			<td><%= dto.getGrade() %></td>
			<td><%= dto.getS_class() %></td>
			<td><%= dto.getNum() %></td>
			<td><%= dto.getName() %></td>
			<td><%= dto.getKor() %></td>
			<td><%= dto.getMath() %></td>
			<td><%= dto.getEng() %></td>
			<td><%= dto.getHist() %></td>
			<td><%= dto.getTotal() %></td>
			<td><%= dto.getAverage() %></td>
			<td><%= dto.getRank() %></td>
		</tr>
		<%
			}
		%>
		<tr>
			<th colspan="4">총 합</th>
			<td><%= t_kor %></td>
			<td><%= t_math %></td>
			<td><%= t_eng %></td>
			<td><%= t_hist %></td>
			<td><%= total %></td>
			<td><%= average %></td>
			<td></td>
		</tr>
		<tr>
			<th colspan="4">총 평균</th>
			<td><%= (double)(t_kor/count*10/10) %></td>
			<td><%= (double)(t_math/count*10/10) %></td>
			<td><%= (double)(t_eng/count*10/10) %></td>
			<td><%= (double)(t_hist/count*10/10) %></td>
			<td><%= (double)(total/count*10/10) %></td>
			<td><%= Math.floor(average/count * 10)/10 %></td>
			<td></td>
		</tr>
</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>