<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String id = (String)session.getAttribute("id");
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	String query = "";
	
	if(id == null || "".equals(id)) {
		out.println("<script>alert('잘못된 접근 입니다.');history.back(-1);</script>");
		return;
	}
	
	if((password1 == null || "".equals(password1)) || (password2 == null || "".equals(password2))) {
		out.println("<script>alert('입력 되지 않은 값이 있습니다.');history.back(-1);</script>");
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
		
		if(password1.equals(password2)) {
			query = "update members set password='"+password1+"' where id='"+id+"'";
		} else {
			out.println("<script>alert('패스워드가 일치하지 않습니다.');history.back(-1);</script>");
			return;
		}
		
		// Query Execute
		stmt.executeUpdate(query);
		
	} catch(Exception e) {
		out.println("<script>alert(\"에러가 발생되었습니다.\");history.back(-1);</script>");
	} finally {
	  stmt.close();
	  conn.close();
	}
	
	out.println("<script>alert('패스워드 변경 완료');location.href='index.jsp?taskPage=mypage.jsp&id="+id+"';</script>");
%>
