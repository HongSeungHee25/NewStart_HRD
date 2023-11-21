<%@page import="dto.ScoreDTO"%>
<%@page import="dao.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	ScoreDAO dao = ScoreDAO.getScoreDAO();
	ScoreDTO dto = new ScoreDTO(
			request.getParameter("sno"),
			request.getParameter("ekor"),
			request.getParameter("emath"),
			request.getParameter("eeng"),
			request.getParameter("ehist")
			);
	int result = dao.score(dto);
	
	out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
%>