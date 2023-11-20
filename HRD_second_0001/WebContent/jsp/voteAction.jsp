<%@page import="dto.VoteDTO"%>
<%@page import="dao.VoteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	VoteDAO dao = VoteDAO.getVoteDAO();
	VoteDTO dto = new VoteDTO(
			request.getParameter("v_jumin"),
			request.getParameter("v_name"),
			request.getParameter("num"),
			request.getParameter("v_time"),
			request.getParameter("v_area"),
			request.getParameter("v_conflrm")
			);
	
	int result = dao.vote(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");

%>