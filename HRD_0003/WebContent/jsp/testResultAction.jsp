<%@page import="dao.ResultDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.ResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("UTF-8");

        ResultDTO dto = new ResultDTO(
            request.getParameter("p_no"),
            request.getParameter("num"),
            request.getParameter("t_sdate"),
            request.getParameter("t_status"),
            request.getParameter("t_ldate"),
            request.getParameter("t_result")
        );
        
    	ResultDAO dao = ResultDAO.getResultDAO();
    	int result = dao.getInsert(dto);
    out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
%>
