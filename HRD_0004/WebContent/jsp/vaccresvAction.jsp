<%@page import="dao.VacDAO"%>
<%@page import="dto.VacDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	VacDTO dto = new VacDTO(
			Integer.parseInt(request.getParameter("resvno")),
			request.getParameter("jumin"),
			request.getParameter("hospcode"),
			request.getParameter("resvdate"),
			Integer.parseInt(request.getParameter("resvtime")),
			request.getParameter("vcode")
			);
	
	VacDAO dao = VacDAO.getVacDAO();
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");

%>