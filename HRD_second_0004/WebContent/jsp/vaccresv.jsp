<%@page import="dto.VaccresvDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.VaccresvDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>백신예약</h1>
	<form action="vaccresvAction.jsp" method="post">
	<table>
		<tr>
			<th>예약번호</th>
			<td>
			<% 
				VaccresvDAO dao = VaccresvDAO.getVaccresvDAO();
				int resvno = dao.max();
			%>
			<input type="text" name="resvno" id="resvno" value="<%= resvno %>" readonly="readonly">
			</td> 
		</tr>
		<tr>
			<th>주민번호</th>
			<td><input type="text" name="jumin" id="jumin">예)790101-1111111</td> 
		</tr>
		<tr>
			<th>백신코드</th>
			<td>
			<select name="vcode" id="vcode">
			<option value="0">백신코드명</option>
			<option value="V001">A백신</option>
			<option value="V002">B백신</option>
			<option value="V003">C백신</option>
			</select>
			</td> 
		</tr>
		<tr>
			<th>병원코드</th>
			<td>
			<input type="radio" name="hospcode" id="hospcode1" value="H001">가_병원
			<input type="radio" name="hospcode" id="hospcode2" value="H002">나_병원
			<input type="radio" name="hospcode" id="hospcode3" value="H003">다_병원
			<input type="radio" name="hospcode" id="hospcode4" value="H004">라_병원
			</td> 
		</tr>
		<tr>
			<th>예약날짜</th>
			<td><input type="text" name="resvdate" id="resvdate">예)20210101</td> 
		</tr>
		<tr>
			<th>예약시간</th>
			<td><input type="text" name="resvtime" id="resvtime">예)0930,1130</td> 
		</tr>
		<tr>
			<th colspan="2">
			<button type="button" id="resv">등록</button>
			<button type="reset" id="reset">취소</button>
			</th>
		</tr>
	</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
document.getElementById('resv').addEventListener('click', function(e){
	var form = document.forms[0]
	
	var resvno = document.getElementById('resvno').value;
	var jumin = document.getElementById('jumin').value;
	var vcode = document.getElementById('vcode').value;
	var hospcode1 = document.getElementById('hospcode1');
	var hospcode2 = document.getElementById('hospcode2');
	var hospcode3 = document.getElementById('hospcode3');
	var hospcode4 = document.getElementById('hospcode4');
	var resvdate = document.getElementById('resvdate').value;
	var resvtime = document.getElementById('resvtime').value;
	
	var hospcode = false;
	if(hospcode1.checked || hospcode2.checked || hospcode3.checked || hospcode4.checked) hospcode = true;
	
	if(resvno.length == 0){
		alert('회원번호가 입력되지 않았습니다!')
		document.getElementById('resvno').focus()
	}else if(jumin.length == 0){
		alert('주민번호가 입력되지 않았습니다!')
		document.getElementById('jumin').focus()
	}else if(vcode == 0){
		alert('백신코드가 선택되지 않았습니다!')
	}else if(!hospcode){
		alert('병원코드가 선택되지 않았습니다!')
	}else if(resvdate.length == 0){
		alert('예약날짜가 입력되지 않았습니다!')
		document.getElementById('resvdate').focus()
	}else if(resvtime.length == 0){
		alert('예약시간이 입력되지 않았습니다!')
		document.getElementById('resvtime').focus()
	}else{
		alert('백신예약이 정상적으로 등록되었습니다!')
		form.submit()
	}
	
})
</script>
</body>
</html>