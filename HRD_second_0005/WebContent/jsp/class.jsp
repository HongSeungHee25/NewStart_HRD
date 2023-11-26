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
	<form action="classAction.jsp"  method="post">
		<table>
			<tr>
				<th>수강월</th>
				<td><input type="text" name="resist_month" id="resist_month">2023년03월 예)202203</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>
				<select name="name" id="name">
				<option value="0">회원명</option>
				<% 
					MemberDAO dao = MemberDAO.getMemberDAO();
					List<MemberDTO> list = dao.getMember();
					for(int i=0; i<list.size(); i++){
				%>
				<option value="<%= list.get(i).getC_no() %>"> <%= list.get(i).getC_name() %></option>
				<% 
					}
				%>
				</select>
				</td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="c_no" id="c_no" readonly="readonly">예)10001</td>
			</tr>
			<tr>
				<th>강의장소</th>
				<td><input type="text" name="class_area" id="class_area"></td>
			</tr>
			<tr>
				<th>강의명</th>
				<td>
				<select name="class_name" id="class_name">
					<option value="0">강의신청</option>
					<% 
						TeacherDAO tdao = TeacherDAO.getTeacherDAO();
						List<TeacherDTO> Tlist = tdao.getTeacherList();
						for(int i=0; i<Tlist.size(); i++){
					%>
					<option value="<%= Tlist.get(i).getTeacher_code() %>"><%= Tlist.get(i).getClass_name() %>
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
	var name = document.getElementById('name').value;
	var class_area = document.getElementById('class_area').value;
	var class_name = document.getElementById('class_name').value;
	
	if(resist_month.length == 0){
		alert('수강월이 입력되지 않았습니다!')
		document.getElementById('resist_month').focus()
	}else if(name == 0){
		alert('이름이 선택되지 않았습니다!')
	}else if(class_area.length == 0){
		alert('강의장소가 입력되지 않았습니다!')
		document.getElementById('class_area').focus()
	}else if(class_name == 0){
		alert('강의명이 선택되지 않았습니다!')
	}else{
		alert('수강신청이 정상적으로 완료되었습니다!')
		form.submit()
	}
})

document.getElementById('name').addEventListener('change',function(){
	var select = this.options[this.selectedIndex];
	var cno = select.value;
	document.getElementById('c_no').value = cno;
})

document.getElementById('class_name').addEventListener('change',function(){
	var select = this.options[this.selectedIndex];
	var tcode = select.value;
	
	var saleprice = 0;
	
	switch(tcode){
	case "100" :
		saleprice = 100000;
		break;
	case "200" : 
		saleprice = 200000;
		break; 
	case "300" : 
		saleprice = 300000;
		break;
	case "400" :
		saleprice = 400000;
		break;
	}
	
	var num = document.getElementById('c_no').value;
	if(num.charAt(0) > '1'){
		alert('수강료가 50%로 할인 되었습니다!')
		saleprice = saleprice / 2;
	}
	document.getElementById('tuition').value = saleprice;
})

document.getElementById('reset').addEventListener('click',function(e){
	alert('정보를 지우고 처음부터 다시 입력합니다!')
})
</script>
</body>
</html>