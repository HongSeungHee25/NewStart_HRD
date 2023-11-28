<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	MemberDAO dao = MemberDAO.getMemberDAO();
	MemberDTO dto = new MemberDTO(
			Integer.parseInt(request.getParameter("custno")),
			request.getParameter("custname"),
			request.getParameter("phone"),
			request.getParameter("address"),
			null,
			request.getParameter("grade"),
			request.getParameter("city")
			);
	int result = dao.insert(dto);
	
	out.print("<script>");
	out.print("location.href='memberList.jsp'");
	out.print("</script>");
%>