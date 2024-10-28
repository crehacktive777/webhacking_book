<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*"%>
<%@ page import="java.util.regex.Pattern" %>
<%@ include file="common.jsp" %>
<%
    String ip = request.getParameter("ip");
    Process ps = null;
    ProcessBuilder pb = null;
    BufferedReader br = null;
    String line = "";
    String result = "";
    String currentPath = request.getRequestURI() + "?" + request.getQueryString();
	
    try {
        if(!(ip == null || "".equals(ip))) {
            ps = Runtime.getRuntime().exec("cmd.exe /c ping " + ip);
            // 바이트 스트림 > 문자 스트림 > 버퍼 저장
            br = new BufferedReader(new InputStreamReader(ps.getInputStream()));

            while((line = br.readLine()) != null) {
                result += line + "<br>";
            }
            ps.destroy();
        }

    } finally {
        if(br != null) br.close();
    }
%>
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Ping Check</h1>
      <hr>
    </div>
    <div class="container">
		<form action="<%=currentPath%>" method="POST">
		  <div class="form-group">
			<label>Ping</label>
			<input type="text" class="form-control" name="ip" placeholder="IP(ex: 192.168.0.100) Input">
		  </div>
			<div class="text-center">
				<button type="submit" class="btn btn-outline-secondary">Check</button>
			</div>
		</form>
	</div>
	<% if(!(result == null || "".equals(result))) { %>
	<hr>
	<%=result%>
	<% } %>