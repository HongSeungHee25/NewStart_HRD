<%@page import="java.sql.SQLException"%>
<%@page import="vo.StudentVo"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    StudentDao dao = StudentDao.getStudentDao();
    List<StudentVo> list = null;
    String errorMessage = null;

    try {
        list = dao.selectList();
    } catch (SQLException e) {
        errorMessage = "데이터를 불러오는 중 오류가 발생했습니다: " + e.getMessage();
    }

    request.setAttribute("list", list);
    request.setAttribute("errorMessage", errorMessage);
    pageContext.forward("studentListView.jsp");
%>
