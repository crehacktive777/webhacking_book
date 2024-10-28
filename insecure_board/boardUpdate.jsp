<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String userId = (String)session.getAttribute("id");
	String idx = request.getParameter("idx");
	String query = "";
	
	if(idx == null || "".equals(idx)) {
		out.println("<script>alert('게시글 번호가 존재하지 않습니다.');history.back(-1);</script>");
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
		query = "select * from insecure_board where idx="+idx;
	
		// Query Execute
		rs = stmt.executeQuery(query);
%>
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Modify Page</h1>
      <hr>
    </div>
	<% 
		int i = 0;
		while(rs.next()) {
			String content = rs.getString("content").replace("<br>", "\r\n");
	%>
    <div class="container">
		<form action="boardAction.jsp" method="POST" enctype="multipart/form-data">
		  <div class="form-group">
			<label>Title</label>
			<input type="text" class="form-control" name="title" placeholder="Title Input" value="<%=rs.getString("title")%>">
		  </div>
		  <div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="5" placeholder="Contents Input"><%=content%></textarea>
      </div>
		  <div class="form-group">
			<label for="exampleInputPassword1">File</label>
      <% if(!(rs.getString("file") == null || "".equals(rs.getString("file")))) { %>
      <p class="font-italic">[Attach]&nbsp;<%=rs.getString("file")%></p>
      <% } %>
			<input type="file" class="form-control" name="userfile">
		  </div>
      <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input" id="customCheck1" name="secret" <% if("y".equals(rs.getString("secret"))) out.println("checked"); %>>
        <label class="custom-control-label" for="customCheck1">Secret Post</label>
      </div>
		<div class="text-right">
			<input type="hidden" name="idx" value="<%=rs.getString("idx")%>">
			<input type="hidden" name="mode" value="update">
			<button type="submit" class="btn btn-outline-secondary">Update</button>
			<button type="button" class="btn btn-outline-danger" onclick="history.back(-1);">Back</button>
		</div>
		</form>
    </div>
<%
		  i += 1;
		}
		if(i == 0) {
			out.println("<script>alert(\"존재하지 않는 게시글 입니다.\");history.back(-1);</script>");
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