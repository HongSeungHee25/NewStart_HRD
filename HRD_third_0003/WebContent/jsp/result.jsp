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
	<form action="resultAction.jsp" method="post">
		<table>
			<tr>
				<th>환자번호</th>
				<td><input type="text" name="p_no" id="p_no"></td>
			</tr>
			<tr>
				<th>검사코드</th>
				<td>
				<select name="t_code" id="t_code">
					<option value="0">검사명</option>
					<% 
						LabDAO dao = LabDAO.getLabDAO();
						List<LabDTO> list = dao.getLabList();
						for(int i=0; i<list.size(); i++){
					%>
					<option value="<%= list.get(i).getT_code() %>">[<%= list.get(i).getT_code() %>]<%= list.get(i).getT_name() %></option>
					<% 
					}
					%>
				</select>
				</td>
			</tr>
			<tr>
				<th>검사시작일자</th>
				<td><input type="text" name="t_sdate" id="t_sdate"></td>
			</tr>
			<tr>
				<th>검사상태</th>
				<td>
				<input type="radio" name="t_status" id="t_status1" value="1">검사중
				<input type="radio" name="t_status" id="t_status2" value="2">검사완료
				</td>
			</tr>
			<tr>
				<th>검사완료일자</th>
				<td><input type="text" name="t_ldate" id="t_ldate"></td>
			</tr>
			<tr>
				<th>검사결과</th>
				<td>
				<input type="radio" name="t_result" id="t_result1" value="X">미입력
				<input type="radio" name="t_result" id="t_result2" value="P">양성
				<input type="radio" name="t_result" id="t_result3" value="N">음성
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" id="result">검사결과등록</button>
					<button type="reset" id="reset">다시쓰기</button>
				</th>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
	document.getElementById('result').addEventListener('click', function(e){
		var form = document.forms[0]
	
		var p_no = document.getElementById('p_no').value;
		var t_code = document.getElementById('t_code').value;
		var t_sdate = document.getElementById('t_sdate').value;
		var t_status1 = document.getElementById('t_status1');
		var t_status2 = document.getElementById('t_status2');
		var t_result1 = document.getElementById('t_result1');
		var t_result2 = document.getElementById('t_result2');
		var t_result3 = document.getElementById('t_result3');
		var t_ldate = document.getElementById('t_ldate').value;
		
		var isStatus = false;
		if(t_status1.checked || t_status2.checked) isStatus = true;
		
		var isResult = false;
		if(t_result1.checked || t_result2.checked || t_result3.checked) isResult = true;
		
		if(p_no.length == 0){
			alert('환자번호가 입력되지 않았습니다!');
			document.getElementById('p_no').focus()
		}else if(t_code == 0){
			alert('검사코드가 선택되지 않았습니다!');
		}else if(t_sdate.length == 0){
			alert('검사시작일자가 입력되지 않았습니다!');
			document.getElementById('t_sdate').focus()
		}else if(!isStatus){
			alert('검사상태가 선택되지 않았습니다!');
		}else if(t_ldate.length == 0){
			alert('검사완료일자가 입력되지 않았습니다!');
			document.getElementById('t_ldate').focus()
		}else if(!isResult){
			alert('검사결과가 선택되지 않았습니다!');
		}else{
			alert('검사결과가 정상적으로 등록되었습니다!')
			form.submit()
		}
	})
	document.getElementById('reset').addEventListener('click', function(e){
		alert('정보를 지우고 처음부터 다시 입력합니다!')
	})
	
</script>
</body>
</html>