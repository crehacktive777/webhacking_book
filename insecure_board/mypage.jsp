<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String id = request.getParameter("id");
	String query = "";
	
	if(id == null || "".equals(id)) {
		out.println("<script>alert('아이디가 존재하지 않습니다.');history.back(-1);</script>");
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
      <h1 class="display-4">My Page</h1>
      <hr>
    </div>
	<% 
		int i = 0;
		while(rs.next()) {
	%>
	<table class="table table-bordered">
	  <tbody>
		<tr>
		  <th scope="row" width="20%" class="text-center">Name</th>
		  <td><%=rs.getString("name")%></td>
		</tr>
		<tr>
		  <th scope="row" width="20%" class="text-center">E-Mail</th>
		  <td><%=rs.getString("email")%></td>
		</tr>
		<tr>
		  <th scope="row" width="20%" class="text-center">Company</th>
		  <td><%=rs.getString("company")%></td>
		</tr>
	  </tbody>
	</table>
    <div class="form-group">
		<div class="text-center">
			<input type="button" class="btn btn-info" onclick="location.href='index.jsp?taskPage=mypageUpdate.jsp&id=<%=rs.getString("id")%>'" value="정보수정">
			<input type="button" class="btn btn-success" onclick="location.href='index.jsp?taskPage=passwordUpdate.jsp'" value="패스워드 변경">
			<button type="button" class="btn btn-danger" onclick="if(confirm('탈퇴 하시겠습니까?')) location.href='withdrawal.jsp'">회원탈퇴</button>
		</div>
	</div>
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