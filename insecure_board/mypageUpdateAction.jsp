<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String company = request.getParameter("company");
	String query = "";
	
	if(id == null || "".equals(id)) {
		out.println("<script>alert('아이디가 존재하지 않습니다.');history.back(-1);</script>");
		return;
	}
	
	if((name == null || "".equals(name)) || (email == null || "".equals(email)) || (company == null || "".equals(company))) {
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
		
		query = "update members set name='"+name+"', email='"+email+"', company='"+company+"' where id='"+id+"'";

		// Query Execute
		stmt.executeUpdate(query);
		
	} catch(Exception e) {
		out.println("<script>alert(\"에러가 발생되었습니다.\");history.back(-1);</script>");
	} finally {
	  stmt.close();
	  conn.close();
	}
	
	out.println("<script>alert('정보 수정 완료');location.href='index.jsp?taskPage=mypage.jsp&id="+id+"';</script>");
%>
