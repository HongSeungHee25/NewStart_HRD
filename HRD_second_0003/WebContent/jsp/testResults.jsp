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
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>검사결과입력</h1>
	<form action="testResultsAction.jsp" method="post">
	<table>
		<tr>
			<th>환자번호</th>
			<td><input type="text" name="p_no" id="p_no">예)1001</td>
		</tr>
		<tr>
			<th>검사명</th>
			<td>
			<select name="num" id="num">
			<option value="0">검사명</option>
			<% 
				LabDAO dao = LabDAO.getLabDAO();
				List<LabDTO> list = dao.getList();
				for(int i=0;i<list.size();i++){
			%>
			<option value="<%= list.get(i).getT_code() %>">[<%= list.get(i).getT_code() %>]<%= list.get(i).getT_name() %>
			 <% 
				}
			 %>
			</select>
			</td>
		</tr>
		<tr>
			<th>검사시작일자</th>
			<td><input type="text" name="sdate" id="sdate">예)20200101</td>
		</tr>
		<tr>
			<th>검사상태</th>
			<td>
			<input type="radio" name="status" id="status1" value="1">검사중
			<input type="radio" name="status" id="status2" value="2">검사완료
			</td>
		</tr>
		<tr>
			<th>검사완료일자</th>
			<td><input type="text" name="ldate" id="ldate">예)20200101</td>
		</tr>
		<tr>
			<th>검사결과</th>
			<td>
			<input type="radio" name="result" id="result1" value="X">미입력
			<input type="radio" name="result" id="result2" value="P">양성
			<input type="radio" name="result" id="result3" value="N">음성
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="button" id="test">검사결과등록</button>
				<button type="reset" id="reset">다시쓰기</button>
			</th>
		</tr>	
	</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
	document.getElementById('test').addEventListener('click',function(e){
		var form = document.forms[0]
		
		var p_no = document.getElementById('p_no').value;
		var num = document.getElementById('num').value;
		var sdate = document.getElementById('sdate').value;
		var status1 = document.getElementById('status1');
		var status2 = document.getElementById('status2');
		var ldate = document.getElementById('ldate').value;
		var result1 = document.getElementById('result1');
		var result2 = document.getElementById('result2');
		var result3 = document.getElementById('result3');
		
		var isStatus = false;
		if(status1.checked || status2.checked) isStatus = true;
		
		var isResult = false; 
		if(result1.checked ||result2.checked ||result3.checked) isResult = true;
		
		if(p_no.length == 0){
			alert('환자번호가 입력되지 않았습니다!')
			document.getElementById('p_no').focus()
		}else if(num == 0){
			alert('검사코드가 선택되지 않았습니다!')
		}else if(sdate.length == 0){
			alert('검사시작날짜가 입력되지 않았습니다!')
			document.getElementById('sdate').focus()
		}else if(!isStatus){
			alert('검사상태가 선택되지 않았습니다!')
		}else if(ldate.length == 0){
			alert('검사시작날짜가 입력되지 않았습니다!')
			document.getElementById('ldate').focus()
		}else if(!isResult){
			alert('검사결과가 선택되지 않았습니다!')
		}else{
			alert('검사결과가 정상적으로 등록되었습니다!')
			form.submit()
		}
	})
	
</script>
</body>
</html>