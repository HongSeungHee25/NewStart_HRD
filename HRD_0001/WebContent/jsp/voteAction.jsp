<%@page import="dao.VoteDAO"%>
<%@page import="dto.VoteDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	VoteDTO dto = new VoteDTO(
				request.getParameter("jumin"),
				request.getParameter("name"),
				request.getParameter("num"),
				request.getParameter("time"),
				request.getParameter("place"),
				request.getParameter("check")
			);
	VoteDAO dao = VoteDAO.getVoteDAO();
	int result = dao.vote(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
%>