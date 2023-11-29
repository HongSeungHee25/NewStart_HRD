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
				request.getParameter("m_no"),
				request.getParameter("v_time"),
				request.getParameter("v_area"),
				request.getParameter("v_confirm")
			);
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='voteList.jsp'");
	out.print("</script>");
	
%>