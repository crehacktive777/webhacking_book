<%
	String referer = request.getHeader("Referer");
	if(referer == null || !referer.contains("/url_example/example3/")) {
		response.sendRedirect("/url_example/example3/index.jsp");
	}
%>