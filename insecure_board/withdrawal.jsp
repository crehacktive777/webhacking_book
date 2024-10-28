<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String id = (String)session.getAttribute("id");
	session.invalidate();
	
	if(id == null || "".equals(id)) {
		out.println("<script>alert('잘못된 접근 입니다.');history.back(-1);</script>");
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
		
		query = "delete from members where id='"+id+"'";

		// Query Execute
		stmt.executeUpdate(query);
		
	} catch(Exception e) {
		out.println("<script>alert(\"에러가 발생되었습니다.\");history.back(-1);</script>");
	} finally {
	  stmt.close();
	  conn.close();
	}
	
	out.println("<script>alert('회원 탈퇴 완료');location.href='index.jsp';</script>");
%>
