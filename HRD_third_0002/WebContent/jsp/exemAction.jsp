<%@page import="dto.ExamDTO"%>
<%@page import="dao.ExamDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	ExamDAO dao = ExamDAO.getExamDAO();
	ExamDTO dto = new ExamDTO(
				request.getParameter("sno"),
				Integer.parseInt(request.getParameter("ekor")),
				Integer.parseInt(request.getParameter("emath")),
				Integer.parseInt(request.getParameter("eeng")),
				Integer.parseInt(request.getParameter("ehist"))
			);
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
%>