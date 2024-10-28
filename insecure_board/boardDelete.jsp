<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String idx = request.getParameter("idx");
	String query = "";
	
	// 게시글 삭제 로직
	if(idx == null || "".equals(idx)) {
		out.println("<script>alert('빈값이 존재합니다.');history.back(-1);</script>");
		return;
	}

	// DB Connection
	Connection conn = null;
	Statement stmt = null;	
	
	try {
		// DB Connection
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbHost, dbId, dbPw);
		stmt = conn.createStatement();
		
		query = "delete from insecure_board where idx="+idx;
		stmt.executeUpdate(query);
	} catch(Exception e) {
		out.println("<script>alert(\"에러가 발생되었습니다.\");history.back(-1);</script>");
	} finally {
	  stmt.close();
	  conn.close();
	}
	
	out.println("<script>location.href='index.jsp';</script>");
%>