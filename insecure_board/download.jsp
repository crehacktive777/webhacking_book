<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*"%>
<%@ include file="common.jsp" %>
<%
	FileInputStream fin = null;
	BufferedInputStream bin = null;
	BufferedOutputStream bout = null;

	String fileName = request.getParameter("file");
	String fPath = application.getRealPath(request.getRequestURI());
	fPath = fPath.substring(0, fPath.lastIndexOf(System.getProperty("file.separator"))+1)+"upload"+System.getProperty("file.separator");

	if(fileName == null && "".equals(fileName)) {
		out.println("<script>alert(\"파일 명이 입력되지 않았습니다.\");history.back(-1);</script>");
		return;
	}
	
	StringBuffer fPathBuff = new StringBuffer(fPath);
	File fd = new File(fPathBuff.append(fileName).toString());
	
	if(!fd.exists()) {
		out.println("<script>alert(\"파일이 존재하지 않습니다..\");history.back(-1);</script>");
		return;
	}
	
	try {
		fin = new FileInputStream(fd);
		bin = new BufferedInputStream(fin, 4096);
		bout = new BufferedOutputStream(response.getOutputStream(), 4096);
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachment; filename="+fileName.substring(fileName.lastIndexOf("/")+1)+";");	
		
		byte[] Buffer = new byte[4096];
		
		while(true) {
			int fLen = bin.read(Buffer);
			if(fLen == -1) break;
			bout.write(Buffer,0,fLen);
			bout.flush();
		}
	} catch(IOException ex) {
		out.println("Download Error");
	} finally {
		if(fin != null) fin.close();
		if(bin != null) bin.close();
		if(bout != null) bout.close();
	}
%>