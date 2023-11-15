<%@page import="vo.AcademicVo"%>
<%@page import="dao.AcademicDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	AcademicDao dao = AcademicDao.getAcademicDao();
	List<AcademicVo> list = dao.list();
	
	request.setAttribute("list", list);
	pageContext.forward("studentAcademicView.jsp");
%>