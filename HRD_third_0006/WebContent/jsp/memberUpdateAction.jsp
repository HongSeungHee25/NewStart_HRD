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
    	
    	int result = dao.update(dto);
    	
    	out.print("<script>");
    	if(result == 1){
    	out.print("alert('회원정보 수정이 완료되었습니다!');");
    	}else{
    	out.print("alert('회원정보 수정을 실패했습니다!');");
    	}
    	out.print("location.href='memberList.jsp';");
    	out.print("</script>");
    
    %>
