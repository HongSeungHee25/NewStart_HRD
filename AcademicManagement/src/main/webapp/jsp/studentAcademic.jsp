<%@page import="java.util.List"%>
<%@page import="dao.AcademicDao"%>
<%@page import="vo.AcademicVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	AcademicDao dao = AcademicDao.getAcademicDao();
	List<AcademicVo> list = dao.list();
	
	request.setAttribute("list", list);
	pageContext.forward("studentAcademicView.jsp");
%>