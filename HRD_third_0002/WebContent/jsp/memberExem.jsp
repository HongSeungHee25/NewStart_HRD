<%@page import="dto.ExamDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ExamDAO"%>
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
			ExamDAO dao = ExamDAO.getExamDAO();
			List<ExamDTO> list = dao.getList();
			int count = 0;
			
			int t_kor = 0;
			int t_math = 0;
			int t_eng = 0;
			int t_hist = 0;
			int total = 0;
			double average = 0;
			
			for(int i=0; i<list.size(); i++){
				t_kor += list.get(i).getEkor();
				t_math += list.get(i).getEmath();
				t_eng += list.get(i).getEeng();
				t_hist += list.get(i).getEhist();
				total += list.get(i).getSum();
				average += list.get(i).getAvg();
				count++;
		%>
		<tr>
			<td><%= list.get(i).getSno().substring(0,1) %></td>
			<td><%= list.get(i).getSno().substring(1,3) %></td>
			<td><%= list.get(i).getSno().substring(3,5) %></td>
			<td><%= list.get(i).getSname() %></td>
			<td><%= list.get(i).getEkor() %></td>
			<td><%= list.get(i).getEmath() %></td>
			<td><%= list.get(i).getEeng() %></td>
			<td><%= list.get(i).getEhist() %></td>
			<td><%= list.get(i).getSum() %></td>
			<td><%= list.get(i).getAvg() %></td>
			<td><%= list.get(i).getRank() %></td>
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
			<th colspan="4">총평균</th>
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