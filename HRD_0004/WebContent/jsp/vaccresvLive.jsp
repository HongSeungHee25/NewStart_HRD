<%@page import="dto.HospDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.VacDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약조회</title>
<link rel="styleSheet" href="../css/layout.css">
<link rel="styleSheet" href="../css/list.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>백신예약현황</h1>
<% 
    VacDAO dao = VacDAO.getVacDAO();
    List<HospDTO> list = dao.getList();
    int sum = 0;
%>
<table>
    <tr>
        <th>병원지역</th>
        <th>병원지역명</th>
        <th>접종예약건수</th>
    </tr>
    <% 
        for(int i = 10; i <= 40; i += 10) {
            String addrNo = String.valueOf(i);
            String hosp = "";
            if(addrNo.equals("10")) hosp = "서울";
            else if(addrNo.equals("20")) hosp = "대전";
            else if(addrNo.equals("30")) hosp = "대구";
            else if(addrNo.equals("40")) hosp = "광주";

            int count = 0;
            for(HospDTO dto : list) {
                if(dto.getHospaddr().equals(addrNo)) {
                    count = dto.getConut();
                    break;
                }
            }
            sum += count;
    %>
    <tr>
        <td><%= addrNo %></td>
        <td><%= hosp %></td>
        <td><%= count %></td>
    </tr>
    <% 
        }
    %>
    <tr>
        <th colspan="2">총합</th>
        <td><%= sum %></td>
    </tr>
</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>