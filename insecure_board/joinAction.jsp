<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String userId = (String)session.getAttribute("id");
	String id = request.getParameter("id");
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String company = request.getParameter("company");
	String query = "";

	// 로그인 되어 있을 경우 index.jsp 페이지로 리다이렉션
	if(!(userId == null || "".equals(userId))) {
		out.println("<script>location.href='index.jsp';</script>");
		return;
	}
	
	if(!(id == null || "".equals(id)) && !(password1 == null || "".equals(password1)) && !(password2 == null || "".equals(password2)) && !(name == null || "".equals(name)) && !(email == null || "".equals(email)) && !(company == null || "".equals(company))) {
		query = "select * from members where id='"+id+"'";
		
		if(!(password1.equals(password2))) {
			out.println("<script>alert('패스워드가 일치하지 않습니다.');history.back(-1);</script>");
			return;		
		}
		
		// DB Connection
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// DB Connection
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbHost, dbId, dbPw);
			stmt = conn.createStatement();
			
			// Query Execute
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				// 아이디 중복 O
				out.println("<script>alert('해당 아이디는 중복된 아이디 입니다.');history.back(-1);</script>");
				return;
			} else {
				// 회원가입 로직
				query = "insert into members(id, password, name, email, company) values('"+id+"', '"+password1+"', '"+name+"', '"+email+"', '"+company+"')";
				
				// Query Execute
				stmt.executeUpdate(query);
				
				out.println("<script>alert('회원가입이 완료되었습니다.');location.href='index.jsp?taskPage=login.jsp';</script>");
				return;
			}
		} catch(Exception e) {
			out.println("<script>alert('회원가입 시 에러가 발생되었습니다.');history.back(-1);</script>");
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