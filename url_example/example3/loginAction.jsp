<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*"%>
<%
	String userId = (String)session.getAttribute("ex1_id");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if(!(userId == null || "".equals(userId))) {
		out.println("<script>location.href='index.jsp';</script>");
		return;
	}
	
	if(!(id == null || "".equals(id)) && !(password == null || "".equals(password))) {
		if(id == "admin" && password =="admin123") {
			// 로그인 성공 로직
			session.setAttribute("id", "admin");
			out.println("<script>location.href='main.jsp';</script>");
			return;
		} else {
			// 로그인 실패 로직
			out.println("<script>alert('아이디 혹은 패스워드가 틀렸습니다.');location.href='index.jsp';</script>");
			return;
		}
	} else {
		out.println("<script>alert('아이디 혹은 패스워드가 입력되지 않았습니다.');location.href='index.jsp';</script>");
	}
%>