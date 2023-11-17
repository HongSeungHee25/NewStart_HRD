<%@page import="dao.VacDAO"%>
<%@page import="dto.VacCheckDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("UTF-8");
    VacDAO dao = VacDAO.getVacDAO();
    String resvnoParam = request.getParameter("resvno");
    int resvno = 0;
    if (resvnoParam != null && !resvnoParam.isEmpty()) {
        resvno = Integer.parseInt(resvnoParam);
    }
    
    VacCheckDTO dto = dao.selectOne(resvno);
    int result = 0;
    if (dto != null && resvno == dto.getResvno()) {
        result = 1;
    }
    
    if (resvno != 0 && result == 1) {
        out.print("<script>");
        out.print("location.href='vacNo.jsp?resvno=" + resvno + "'");
        out.print("</script>");
    } else {
        out.print("<script>");
        out.print("location.href='vacX.jsp?resvno=" + resvno + "'");
        out.print("</script>");
    }
%>
