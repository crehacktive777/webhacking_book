<%
	String userId = (String)session.getAttribute("ex2_id");
	if(userId == null || "".equals(userId)) {
		response.setStatus(HttpServletResponse.SC_FOUND);
		response.setHeader("Location", "/url_example/example2/index.jsp");
	}
%>