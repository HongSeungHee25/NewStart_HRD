/**
 * 
 */
document.getElementById('member').addEventListener('click',function(e){
	var form  = document.forms[0]
	
	var custname = document.getElementById('custname').value;
	var phone = document.getElementById('phone').value;
	var address = document.getElementById('address').value;
	var grade = document.getElementById('grade').value;
	var city = document.getElementById('city').value;
	
	if(custname.length == 0){
		alert('회원성명이 입력되지 않았습니다!')
		document.getElementById('custname').focus()
	}else if(phone.length == 0){
		alert('회원전화번호가 입력되지 않았습니다!')
		document.getElementById('phone').focus()
	}else if(address.length == 0){
		alert('회원주소가 입력되지 않았습니다!')
		document.getElementById('address').focus()
	}else if(grade.value == 'A' || grade.value == 'B' || grade.value == 'C'){
		alert('고객등급은 A,B,C 만 입력 가능합니다!')
		document.getElementById('grade').focus()
	}else if(city.length == 0){
		alert('도시코드가 입력되지 않았습니다!')
		document.getElementById('city').focus()
	}else{
		alert('회원등록이 완료 되었습니다!')
		form.submit()
	}
	
})