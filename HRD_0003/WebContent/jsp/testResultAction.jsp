<%@page import="dao.ResultDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.ResultDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("UTF-8");
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    try {
        Date t_sdate = new Date(format.parse(request.getParameter("t_sdate")).getTime());
        Date t_ldate = new Date(format.parse(request.getParameter("t_ldate")).getTime());

        ResultDTO dto = new ResultDTO(
            request.getParameter("p_no"),
            request.getParameter("t_code"),
            t_sdate,
            request.getParameter("t_status"),
            t_ldate,
            request.getParameter("t_result")
        );
    	ResultDAO dao = ResultDAO.getResultDAO();
    	int result = dao.getInsert(dto);
    } catch (Exception e) {
        e.printStackTrace();
    }
    out.print("<script>");
	out.print("location.href='../index.jsp'");
	out.print("</script>");
%>
