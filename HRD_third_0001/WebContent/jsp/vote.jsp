<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>투표하기</h1>
	<form action="voteAction.jsp" method="post">
	<table>
		<tr>
			<th>주민번호</th>
			<td><input type="text" name="v_jumin" id="v_jumin"></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="v_name" id="v_name"></td>
		</tr>
		<tr>
			<th>투표번호</th>
			<td>
			<select id="m_no" name="m_no">
			<option value="0"></option>
			<% 
				MemberDAO dao = MemberDAO.getMemberDAO();
				List<MemberDTO> list = dao.getMemberList();
				for(int i=0; i<list.size(); i++){
			%>
			<option value="<%= list.get(i).getM_no() %>">[<%= list.get(i).getM_no() %>]<%= list.get(i).getM_name() %></option>
	<% 
				}
	%>
			</select>
			</td>
		</tr>
		<tr>
			<th>투표시간</th>
			<td><input type="text" name="v_time" id="v_time"></td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td><input type="text" name="v_area" id="v_area"></td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td><input type="radio" name="v_confirm" id="check1" value="Y">확인
			<input type="radio" name="v_confirm" id="check2" value="N">미확인</td>
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
document.getElementById('vote').addEventListener('click', function(e){
	var form = document.forms[0]
	
	var v_jumin = document.getElementById('v_jumin').value;
	var v_name = document.getElementById('v_name').value;
	var m_no = document.getElementById('m_no').value;
	var v_time = document.getElementById('v_time').value;
	var v_area = document.getElementById('v_area').value;
	var check1 = document.getElementById('check1');
	var check2 = document.getElementById('check2');
	
	var isCheckd = false;
	if(check1.checked || check2.checked) isCheckd = true;
	
	if(v_jumin.length == 0){
		alert('주민번호가 입력되지 않았습니다!')
		document.getElementById('v_jumin').focus()
	}else if(v_name.length == 0){
		alert('성명이 입력되지 않았습니다!')
		document.getElementById('v_name').focus()
	}else if(m_no == 0){
		alert('후보번호가 선택되지 않았습니다!')
	}else if(v_time.length == 0){
		alert('투표시간이 입력되지 않았습니다!')
		document.getElementById('v_time').focus()
	}else if(v_area.length == 0){
		alert('투표장소가 입력되지 않았습니다!')
		document.getElementById('v_area').focus()
	}else if(!isCheckd){
		alert('유권자확인이 선택되지 않았습니다!')
	}else{
		alert('투표하기 정보가 정상적으로 등록 되었습니다!')
		form.submit()
	}
})
document.getElementById('reset').addEventListener('click', function(e){
	alert('정보를 지우고 처음부터 다시 입력합니다!')
})

</script>
</body>
</html>