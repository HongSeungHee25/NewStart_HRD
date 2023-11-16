<%@page import="dto.LabDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.LabDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과입력</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
<script type="text/javascript">
	function chkVal() {
		var test = document.tData;
	}
</script>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>검사결과입력</h1>
	<form action="testResultAction.jsp" method="post">
	<table>
		<tr>
		<th>환자번호</th>
		<td><input type="text" name="p_no" id="p_no">예)1001</td>
		</tr>
		<tr>
		<th>검사코드</th>
		<td>
		<select id="num" name="num">
			<option value="0">검사명</option>
			<% 
				LabDAO dao = LabDAO.getLabDAO();
				List<LabDTO> list = dao.getList();
				
				for(LabDTO dto : list){
			%>
			<option value="<%= dto.getT_code() %>">[<%= dto.getT_code() %>] <%= dto.getT_name() %></option>
		<% 
				}
		%>
		</select>
		</td>
		</tr>
		<tr>
		<th>검사시작일자</th>
		<td><input type="text" name="t_sdate" id="t_sdate">예)20200101</td>
		</tr>
		<tr>
		<th>검사상태</th>
		<td><input type="radio" name="t_status" id="t_status1" value="1">검사중
		<input type="radio" name="t_status" id="t_status2" value="2">검사완료
		</td>
		</tr>
		<tr>
		<th>검사완료일자</th>
		<td><input type="text" name="t_ldate" id="t_ldate">예)20200101</td>
		</tr>
		<tr>
		<th>검사결과</th>
		<td><input type="radio" name="t_result" id="t_result1" value="X">미입력
		<input type="radio" name="t_result" id="t_result1" value="P">양성
		<input type="radio" name="t_result" id="t_result1" value="N">음성
		</td>
		</tr>
		<tr>
		<th colspan="2"><button type="button">검사결과등록</button>
		<button type="reset">다시쓰기</button>
		</th>
		</tr>
	</table>
	</form>
</section>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>