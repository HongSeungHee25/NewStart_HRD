<%@page import="dto.ClassDTO"%>
<%@page import="dao.ClassDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClassMemberDAO"%>
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
	<form action="enrolmentAction.jsp" method="post">
	<table>
		<tr>
			<th>수강월</th>
			<td><input type="text" name="resist_month" id="resist_month">2022년03월 예)202203</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>
			<select name="num" id="num">
				<option value="0">회원 선택</option>
				<% 
					ClassMemberDAO dao = ClassMemberDAO.getMemberDAO();
					List<MemberDTO> list = dao.getMember();
					for(int i = 0; i < list.size(); i++){
				%>
				<option value="<%= list.get(i).getC_no() %>"><%= list.get(i).getC_name() %></option>
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
					ClassDAO cdao = ClassDAO.getClassDAO();
					List<ClassDTO> plist = cdao.getClassPay();
					for(int i = 0; i < plist.size(); i++){
				%>
				<option value="<%= plist.get(i).getTeacher_code() %>"><%= plist.get(i).getClass_name() %></option> 
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
			<th colspan="2"><button type="button" id="Aclass">수강신청</button>
			<button type="reset" id="reset">다시쓰기</button></th>
		</tr>
	</table>
	</form>
	
</section>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">
document.getElementById('Aclass').addEventListener('click',function(e){
	var form = document.forms[0]
	
	var resist_month = document.getElementById('resist_month').value;
	var num = document.getElementById('num').value;
	var class_area = document.getElementById('class_area').value;
	var class_name = document.getElementById('class_name').value;
	
	if(resist_month.length == 0){
		alert('수강월이 입력되지 않았습니다!')
		document.getElementById('resist_month').focus()
	}else if(num == 0){
		alert('회원명이 선택되지 않았습니다!')
	}else if(class_area.length == 0){
		alert('강의장소가 입력되지 않았습니다!')
		document.getElementById('class_area').focus()
	}else if(class_name == 0){
		alert('강의명이 선택되지 않았습니다!')
	}else{
		alert('수강신청이 정상적으로 등록 되었습니다!')
		form.submit();
	}
})

document.getElementById('num').addEventListener('change', function() {
  var selectedOption = this.options[this.selectedIndex]; // 선택된 옵션 요소
  var cNo = selectedOption.value; // 선택된 옵션의 값인 c_no 가져오기
  document.getElementById('c_no').value = cNo; // c_no를 입력란에 표시
});

document.getElementById('class_name').addEventListener('change', function() {
    var selectedOption = this.options[this.selectedIndex]; // 선택된 옵션 요소
    var tcode = selectedOption.value; // 선택된 강사 코드 가져오기
    
    var salePrice = 0;

    switch (tcode) {
        case "100":
            salePrice = 100000;
            break;
        case "200":
            salePrice = 200000;
            break;
        case "300":
            salePrice = 300000;
            break;
        case "400":
            salePrice = 400000;
            break;
    }
    
    var mbr = document.getElementById('c_no').value; // 회원번호 가져오기
    if (mbr.charAt(0) === '2') {
        alert("수강료가 50% 할인 되었습니다.");
        salePrice = salePrice / 2;
    }
    
    document.getElementById('tuition').value = salePrice; // 수강료 입력란에 가격 표시
});


document.getElementById('reset').addEventListener('click', function(){
	alert('정보를 지우고 처음부터 다시 입력합니다!')
})
</script>
</body>
</html>