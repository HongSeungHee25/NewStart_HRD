<%@page import="dto.VaccresvDTO"%>
<%@page import="dao.VaccresvDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	VaccresvDAO dao = VaccresvDAO.getVaccresvDAO();
	
	String resvnoParam = request.getParameter("resvno");
    int resvno = 0;
    if (resvnoParam != null && !resvnoParam.isEmpty()) {
        resvno = Integer.parseInt(resvnoParam);
    }
    
	VaccresvDTO dto =dao.getSelectOne(resvno);
    int result = 0;
    if (dto != null && resvno == dto.getResvno()) {
        result = 1;
    }
    
    if (resvno != 0 && result == 1) {
        out.print("<script>");
        out.print("location.href='vaccresvOne.jsp?resvno=" + resvno + "'");
        out.print("</script>");
    } else {
        out.print("<script>");
        out.print("location.href='vacNone.jsp?resvno=" + resvno + "'");
        out.print("</script>");
    }
%>