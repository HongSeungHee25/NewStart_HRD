<%@page import="dto.TeacherDTO"%>
<%@page import="dao.TeacherDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/reg.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>수강신청</h1>
	<form action="classAction.jsp" method="post">
		<table>
			<tr>
				<th>수강월</th>
				<td><input type="text" name="resist_month" id="resist_month"></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>
				<select id="c_name" onchange="onChange()">
					<option value="0">회원명</option>
					<% 
						MemberDAO dao = MemberDAO.getMemberDAO();
						List<MemberDTO> list = dao.getMemberList();
						for(int i=0; i<list.size(); i++){
					%>
					<option value=<%= list.get(i).getC_no() %>><%= list.get(i).getC_name() %></option>
					<% 
						}
					%>
				</select>
				</td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="c_no" id="c_no" readonly="readonly"></td>
			</tr>
			<tr>
				<th>강의장소</th>
				<td>
				<input type="text" name="class_area" id="class_area">
				</td>
			</tr>
			<tr>
				<th>강의명</th>
				<td>
				<select id="class_name" name="teacher_code" onchange="onChange2()">
					<option value="0">강의신청</option>
					<% 
						TeacherDAO tdao = TeacherDAO.getTeacherDAO();
						List<TeacherDTO> tlist = tdao.getTeacherList();
						for(int i=0; i<tlist.size(); i++){
					%>
					<option value=<%= tlist.get(i).getTeacher_code() %>><%= tlist.get(i).getClass_name() %></option>
					<% 
						}
					%>
				</select>
				</td>
			</tr>
			<tr>
				<th>수강료</th>
				<td><input type="text" name="tuition" id="tuition" readonly="readonly">원</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" id="class">수강신청</button>
					<button type="reset" id="reset">다시쓰기</button>
				</th>
			</tr>
		</table>
	
	</form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
document.getElementById('class').addEventListener('click',function(e){
	var form = document.forms[0]
		
	var resist_month = document.getElementById('resist_month').value;
	var c_name = document.getElementById('c_name').value;
	var class_area = document.getElementById('class_area').value;
	var class_name = document.getElementById('class_name').value;
	
	if(resist_month.length == 0){
		alert('수강월이 입력되지 않았습니다!')
		document.getElementById('resist_month').focus()
	}else if(c_name == 0){
		alert('회원이 선택되지 않았습니다!')
	}else if(class_area.length == 0){
		alert('강의장소가 입력되지 않았습니다!')
		document.getElementById('class_area').focus()
	}else if(class_name == 0){
		alert('강의명이 선택되지 않았습니다!')
	}else{
		alert('수강신청이 완료되었습니다!')
		form.submit()
	}
})
document.getElementById('reset').addEventListener('click',function(e){
	alert('정보를 지우고 처음부터 다시 입력합니다!')
})
function onChange(){
	var values = document.getElementById('c_name').value;
	document.getElementById('c_no').value = values;
}
function onChange2(){
	var values = document.getElementById('class_name').value;
	var price = 0;
	
	switch(values){
	case "100" :
		price = 100000;
		break;
	case "200" :
		price = 200000;
		break;
	case "300" :
		price = 300000;
		break;
	case "400" :
		price = 400000;
		break;
	}
	var c_no = document.getElementById('c_no').value;
	if(c_no.charAt(0) > '1'){
		alert('수강료가 50%로 할인되었습니다!')
		price = price/2;
	}
	
	document.getElementById('tuition').value = price;
}

</script>
</body>
</html>