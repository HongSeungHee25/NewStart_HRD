<%@page import="dao.ExamDao"%>
<%@page import="vo.ExamVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	ExamVo vo = new ExamVo(
			request.getParameter("sno"),
			Integer.parseInt(request.getParameter("ekor")),
			Integer.parseInt(request.getParameter("emath")),
			Integer.parseInt(request.getParameter("eeng")),
			Integer.parseInt(request.getParameter("ehist"))
			);
	
	ExamDao dao = ExamDao.getExamDao();
	int result = dao.insert(vo);
	out.print("<script>");
	if(result==1) {
		out.print("alert('회원 등록을 완료했습니다.');");
	}else {
		out.print("alert('회원 등록 문제가 발생했습니다.');");
	}
	out.print("location.href='studentList.jsp'");
	out.print("</script>");
%>