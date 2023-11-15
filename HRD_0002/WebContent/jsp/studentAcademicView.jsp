<%@page import="vo.AcademicVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적</title>
<link rel="stylesheet" href="../css/list.css">
<link rel="stylesheet" href="../css/layout.css">
</head>
<body>
<%
	@SuppressWarnings("unchecked")
	List<AcademicVo> list = (List<AcademicVo>)request.getAttribute("list");
%>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<h2>학생성적</h2>
<div id="list">
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
	int skor = 0;
	int smath = 0;
	int seng = 0;
	int shist = 0;
	int cnt = 0;


		for(int i=0;i<list.size();i++) {
%>
	<tr>
	<td><%= list.get(i).getGrade() %></td>
	<td><%= list.get(i).getClass1() %></td>
	<td><%= list.get(i).getClassnum() %></td>
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
		skor = skor + list.get(i).getEkor();
		smath += list.get(i).getEmath();
		seng += list.get(i).getEeng();
		shist += list.get(i).getEhist();
		cnt++;
		}
		System.out.println("cnt : "+cnt);
		System.out.println(skor/cnt);
%>		
	
	<tr>
		<td colspan="4">총 합</td>
		<td><%= skor %></td>
		<td><%= smath %></td>
		<td><%= seng %></td>
		<td><%= shist %></td>
		<td><%= skor+smath+seng+shist %></td>
		<td><%= (skor+smath+seng+shist)/4 %></td>
		<td rowspan="2"></td>
	</tr>
	<tr>
		<td colspan="4">총평균</td>
		<td><%= skor/cnt %></td>
		<td><%= smath/cnt %></td>
		<td><%= seng/cnt %></td>
		<td><%= shist/cnt %></td>
		<td><%= (skor+smath+seng+shist)/cnt %></td>
		<td><%= (skor+smath+seng+shist)/(cnt*4) %></td>
	</tr>
</table>
</div>

</section>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>