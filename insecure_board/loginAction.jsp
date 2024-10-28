<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String userId = (String)session.getAttribute("id");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String query = "";

	if(!(userId == null || "".equals(userId))) {
		out.println("<script>location.href='index.jsp';</script>");
		return;
	}
	

	if(!(id == null || "".equals(id)) && !(password == null || "".equals(password))) {
		query = "select * from members where id='"+id+"' and password='"+password+"'";
		
		// DB Connection
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// DB Connection
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbHost, dbId, dbPw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				// 로그인 성공 로직
				session.setAttribute("id", rs.getString("id"));
				session.setAttribute("name", rs.getString("name"));
				out.println("<script>location.href='index.jsp';</script>");
				return;
			} else {
				// 로그인 실패 로직
				out.println("<script>alert('아이디 혹은 패스워드가 틀렸습니다.');location.href='index.jsp?taskPage=login.jsp';</script>");
				return;
			}
		} finally {
		  if (rs != null) {
			rs.close();
		  }
		  stmt.close();
		  conn.close();
		}
	} else {
		out.println("<script>alert('아이디 혹은 패스워드가 입력되지 않았습니다.');location.href='index.jsp?taskPage=login.jsp';</script>");
	}
%>