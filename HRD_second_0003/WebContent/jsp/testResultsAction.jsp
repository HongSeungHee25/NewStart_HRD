<%@page import="dto.ResultDTO"%>
<%@page import="dao.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	ResultDAO dao = ResultDAO.getResultDAO();
	ResultDTO dto = new ResultDTO(
			request.getParameter("p_no"),
			request.getParameter("num"),
			request.getParameter("sdate"),
			request.getParameter("status"),
			request.getParameter("ldate"),
			request.getParameter("result")
			);
	
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");

%>