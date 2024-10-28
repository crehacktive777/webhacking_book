<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>
<%
	String userId = (String)session.getAttribute("id");
	String userName = (String)session.getAttribute("name");
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("keyword");
	String sort = request.getParameter("sort");
	String sortColumn = request.getParameter("sortColumn");
	String query = "";
	
	if((searchType == null || "".equals(searchType)) && (keyword == null || "".equals(keyword))) {
		query = "select * from insecure_board";
	} else if(searchType.equals("all")) {
		query = "select * from insecure_board where title like '%"+keyword+"%' or name like '%"+keyword+"%' or content like '%"+keyword+"%'";
	} else {
		query = "select * from insecure_board where "+searchType+" like '%"+keyword+"%'";
	}
	
	if((sort == null || "".equals(sort)) && (sortColumn == null || "".equals(sortColumn))) {
		query += " order by idx desc";
	} else {
		query += " order by "+sortColumn+" "+sort;
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
		rs = stmt.executeQuery(query);
	
%>
    <div class="container">
    <% if(!(userId == null || "".equals(userId))) { %>
		<div class="text-right">
			<p><button type="button" class="btn btn-outline-secondary" onclick="location.href='index.jsp?taskPage=boardInsert.jsp'">Write</button><p>
    </div>
    <% } else { %>
      <p>&nbsp;</p>
    <% } %>
		<table class="table">
		  <thead class="thead-dark">
			<tr>
			  <th width="10%" scope="col" class="text-center"><a href="index.jsp?taskPage=boardList.jsp&sortColumn=idx&sort=desc" class="stretched-link text-white">No</a></th>
			  <th width="50%" scope="col" class="text-center"><a href="index.jsp?taskPage=boardList.jsp&sortColumn=title&sort=desc" class="stretched-link text-white">Title</a></th>
			  <th width="20%" scope="col" class="text-center"><a href="index.jsp?taskPage=boardList.jsp&sortColumn=name&sort=desc" class="stretched-link text-white">Name</a></th>
			  <th width="20%" scope="col" class="text-center"><a href="index.jsp?taskPage=boardList.jsp&sortColumn=regdate&sort=desc" class="stretched-link text-white">Date</a></th>
			</tr>
		  </thead>
		  <tbody>
			<% 
			int i = 0;
			while(rs.next()) {
			%>
			<tr>
			  <th scope="row" class="text-center"><%=rs.getString("idx")%></th>
			<% 
			if("y".equals(rs.getString("secret"))) { 
				if(rs.getString("name").equals(userName) || "admin".equals(userName)) {
			%>
			<td><span style="display:inline-block; height:15px; width:15px;" data-feather="lock"></span>&nbsp;<a href="index.jsp?taskPage=boardView.jsp&idx=<%=rs.getString("idx")%>"><%=rs.getString("title")%></a></td>
			<% 
				} else {
			%>
			<td><span style="display:inline-block; height:15px; width:15px;" data-feather="lock"></span>&nbsp;<a href="javascript:alert('접근 권한이 없습니다.');"><%=rs.getString("title")%></a></td>
			<% 
				}
			} else { %>
			<td><a href="index.jsp?taskPage=boardView.jsp&idx=<%=rs.getString("idx")%>"><%=rs.getString("title")%></a></td>
			<% } %>
			  
			  <td class="text-center"><%=rs.getString("name")%></td>
			  <td class="text-center"><%=rs.getString("regdate")%></td>
			</tr>
			<%
			  i += 1;
			}
			if(i == 0) {%>
            <tr>
              <td colspan="4" class="text-center">Posts does not exist.</td>
            </tr>
			<%
			}
			%>
		  </tbody>
		</table>
		<form action="index.jsp?taskPage=boardList.jsp" method="POST">
			<div class="input-group mb-3">
				<div class="col-auto my-1">
				  <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">search</label>
				  <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="searchType">
					<option value="all" selected>All</option>
					<option value="title">title</option>
					<option value="name">name</option>
					<option value="content">content</option>
				  </select>
				</div>
				<input type="text" class="form-control" placeholder="Keyword Input" name="keyword">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="submit">Search</button>
				</div>
			</div>
		</form>
    </div>
<%
	} catch(Exception e) {
		out.println(e.toString());
	} finally {
	  if (rs != null) {
		rs.close();
	  }
	  stmt.close();
	  conn.close();
	}
%>