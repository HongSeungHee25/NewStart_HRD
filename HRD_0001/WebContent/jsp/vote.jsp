<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/table.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>투표하기</h1>
	<form action="voteAction.jsp" method="post">
		<table>
			<tr>
				<th>주민번호</th>
				<td><input type="text" id="jumin" name="jumin"> 예 : 8906153154726</td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<th>투표번호</th>
				<td>
					<select id="num" name="num">
						<option value="0"></option>
						<%
							MemberDAO dao = MemberDAO.getMemberDAO();
											List<MemberDTO> list = dao.getList();
											
											for(MemberDTO dto : list){
						%>
						<option value="<%= dto.getM_no() %>">[<%= dto.getM_no() %>] <%= dto.getM_name() %></option>
						<% 
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th>투표시간</th>
				<td><input type="text" id="time" name="time"></td>
			</tr>
			<tr>
				<th>투표장소</th>
				<td><input type="text" id="place" name="place"></td>
			</tr>
			<tr>
				<th>유권자 확인</th>
				<td><input type="radio" id="check1" name="check" value="Y">확인<input type="radio" id="check2" name="check" value="N">미확인</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" id="vote">투표하기</button>
					<button type="reset" id="reset">다시하기</button>
				</th>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
document.getElementById('vote').addEventListener('click', function(e) {
	var form = document.forms[0]
	
	var jumin = document.getElementById('jumin').value;
	var name = document.getElementById('name').value;
	var num = document.getElementById('num').value;
	var time = document.getElementById('time').value;
	var place = document.getElementById('place').value;
	var check1 = document.getElementById('check1');
	var check2 = document.getElementById('check2');
	var isChecked = false;
	
	if(check1.checked || check2.checked) isChecked = true;
	
	if(jumin.length == 0){
		alert('주민번호가 입력되지 않았습니다!')
		document.getElementById('jumin').focus()
	} else if(name.length == 0)
		alert('성명이 입력되지 않았습니다!')
	else if(num == 0)
		alert('후보번호가 선택되지 않았습니다!')
	else if(time.length == 0)
		alert('투표시간이 입력되지 않았습니다!')
	else if(place.length == 0)
		alert('투표장소가 입력되지 않았습니다!')
	else if(!isChecked)
		alert('유권자확인이 선택되지 않았습니다!')
	else{
		alert('투표하기 정보가 정상적으로 등록 되었습니다!')
		form.submit();
	}
})

document.getElementById('reset').addEventListener('click', function(e){
	alert('정보를 지우고 처음부터 다시 입력합니다!')
	document.getElementById('jumin').focus()
})
</script>

</body>
</html>