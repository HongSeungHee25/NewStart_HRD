<%@page import="dto.ResultDTO"%>
<%@page import="dao.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	ResultDAO dao = ResultDAO.getResultDAO();
	ResultDTO dto = new ResultDTO(
				request.getParameter("p_no"),
				request.getParameter("t_code"),
				request.getParameter("t_sdate"),
				request.getParameter("t_status"),
				request.getParameter("t_ldate"),
				request.getParameter("t_result")
			);
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
%>