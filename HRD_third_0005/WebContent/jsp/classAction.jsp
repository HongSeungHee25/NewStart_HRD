<%@page import="dto.ClassDTO"%>
<%@page import="dao.ClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	ClassDAO dao = ClassDAO.getClassDAO();
	ClassDTO dto = new ClassDTO(
				request.getParameter("resist_month"),
				request.getParameter("c_no"),
				request.getParameter("class_area"),
				Integer.parseInt(request.getParameter("tuition")),
				request.getParameter("teacher_code")
			);
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
%>