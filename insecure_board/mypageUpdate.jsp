<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String id = request.getParameter("id");
	String query = "";
	
	if(id == null || "".equals(id)) {
		out.println("<script>alert('잘못된 접근 입니다.');history.back(-1);</script>");
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
		
		query = "select * from members where id='"+id+"'";
	
		// Query Execute
		rs = stmt.executeQuery(query);
%>
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">My Page Update</h1>
      <hr>
    </div>
	<% 
		int i = 0;
		while(rs.next()) {
	%>
	<form action="mypageUpdateAction.jsp?id=<%=rs.getString("id")%>" method="POST">
    <div class="form-group">
		<div class="form-group">
			<label>Name</label>
			<input type="text" class="form-control" name="name" placeholder="Name Input" value="<%=rs.getString("name")%>">
		</div>
		<div class="form-group">
			<label>E-mail</label>
			<input type="email" id="email" class="form-control" name="email" placeholder="E-mail Input" value="<%=rs.getString("email")%>">
		</div>
		<div class="form-group">
			<label>Company</label>
			<input type="text" class="form-control" name="company" placeholder="Company Input" value="<%=rs.getString("company")%>">
		</div>
		<div class="text-center">
			<input type="submit" class="btn btn-warning" value="정보수정">
		</div>
	</div>
	</form>
<%
		  i += 1;
		  break;
		}
		if(i == 0) {
			out.println("<script>alert(\"존재하지 않는 사용자 입니다.\");history.back(-1);</script>");
		}
	} catch(Exception e) {
		out.println("<script>alert(\"에러가 발생되었습니다.\");history.back(-1);</script>");
	} finally {
	  if (rs != null) {
		rs.close();
	  }
	  stmt.close();
	  conn.close();
	}
%>