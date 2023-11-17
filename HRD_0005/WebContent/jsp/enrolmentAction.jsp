<%@page import="dao.ClassDAO"%>
<%@page import="dto.ClassDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	request.setCharacterEncoding("UTF-8");
	
	ClassDTO dto = new ClassDTO(
			request.getParameter("resist_month"),
			request.getParameter("c_no"),
			request.getParameter("class_area"),
			Integer.parseInt(request.getParameter("tuition")),
			request.getParameter("class_name")
			);
	
	ClassDAO dao = ClassDAO.getClassDAO();
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
	
%>