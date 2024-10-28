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
		<h1 class="display-4">View Page</h1>
    	<hr>
    </div>
    
    <div class="container">
	<% 
		int i = 0;
		if(rs.next()) {
	%>
		<table class="table table-bordered">
		  <tbody>
			<tr>
			  <th scope="row" width="20%" class="text-center">Title</th>
			  <td><%=rs.getString("title")%></td>
			</tr>
			<tr>
			  <th scope="row" width="20%" class="text-center">Name</th>
			  <td><%=rs.getString("name")%></td>
			</tr>
			<tr>
			  <th scope="row" width="20%" class="text-center">Date</th>
			  <td><%=rs.getString("regdate")%></td>
			</tr>
			<tr>
			  <th scope="row" width="20%" class="text-center">Content</th>
			  <td><%=rs.getString("content")%></td>
			</tr>
			<% if(!(rs.getString("file") == null || "".equals(rs.getString("file")))) { %>
			<tr>
			  <th scope="row" width="20%" class="text-center">File</th>
			  <td><a href="download.jsp?file=<%=rs.getString("file")%>"><%=rs.getString("file")%></a></td>
			</tr>
			<% } %>
		  </tbody>
		</table>
		<div class="text-right">
			<% if(rs.getString("id").equals(userId)) { %>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='index.jsp?taskPage=boardUpdate.jsp&idx=<%=rs.getString("idx")%>'">Modify</button>
			<button type="button" class="btn btn-outline-danger" onclick="delAction()">Delete</button>
			<% } %>
			<button type="button" class="btn btn-outline-warning" onclick="location.href='index.jsp'">List</button>
		</div>
    </div>
	<script>
		function delAction(){
			if(confirm("게시글을 삭제하시겠습니까?") == true) {
				location.href='boardDelete.jsp?idx=<%=rs.getString("idx")%>';
			} else {
				return false;
			}
		}
	</script>
<%
			i += 1;
		}
		if(i == 0) {
			out.println("<script>alert(\"존재하지 않는 게시글 입니다.\");history.back(-1);</script>");
		}
	} catch(Exception e) {
		out.println("<script>alert(\"에러가 발생되었습니다.\");history.back(-1);</script>");
		out.println("<!-- "+e.toString()+" -->");
	} finally {
	  if (rs != null) {
		rs.close();
	  }
	  stmt.close();
	  conn.close();
	}
%>