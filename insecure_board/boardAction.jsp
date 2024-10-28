<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, com.oreilly.servlet.*, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ include file="common.jsp" %>
<%
	String userId = (String)session.getAttribute("id");
	String userName = (String)session.getAttribute("name");
	
	// 로그인 되지 않을 경우 로그인 페이지로 리다이렉션
	if(userId == null || "".equals(userId)) {
		out.println("<script>location.href='index.jsp?taskPage=login.jsp';</script>");
		return;
	}
	
	int maxSize  = 5 * 1024 * 1024;
	String mode = "";
	String idx = "";
	String title = "";
	String content = "";
	String query = "";
	String secret = "";
	String fileId = "";
	String fileName = "";
	
	// 업로드 절대 경로 얻어내기
	String fileUploadPath = application.getRealPath(request.getRequestURI());
	fileUploadPath = fileUploadPath.substring(0, fileUploadPath.lastIndexOf(System.getProperty("file.separator")))+System.getProperty("file.separator")+"upload";
	
	//업로드 셋업
	MultipartRequest multi = new MultipartRequest(request, fileUploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	Enumeration formNames = multi.getFileNames();

	while(formNames.hasMoreElements()) {
		// 파일 업로드 정보 셋팅
		fileId = (String)formNames.nextElement();
		fileName = multi.getFilesystemName(fileId);
		
		// 파라미터 셋팅
		mode = multi.getParameter("mode");
		idx = multi.getParameter("idx");
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		secret = multi.getParameter("secret");
		
		// mode 값이 전달되지 않았을 경우 종료
		if(mode == null || "".equals(mode)) {
			out.println("<script>alert('정상적인 접근이 아닙니다.');location.href='index.jsp';</script>");
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

			if(mode.equals("insert")) {
				// 게시글 작성 로직
				if((title == null || "".equals(title)) || (content == null || "".equals(content))) {
					out.println("<script>alert('빈값이 존재합니다.');history.back(-1);</script>");
					return;
				}
				
				if("on".equals(secret)) {
					secret = "y";
				} else {
					secret = "n";
				}
				
				content = content.replace("\r\n", "<br>");
				
				if(!(fileName == null || "".equals(fileName))) {
					File fileObj = new File(fileUploadPath, fileName);
					query = "insert into insecure_board(title, content, id, name, file, regdate, secret) values('"+title+"', '"+content+"', '"+userId+"', '"+userName+"', '"+fileName+"', now(), '"+secret+"')";
				} else {
					query = "insert into insecure_board(title, content, id, name, regdate, secret) values('"+title+"', '"+content+"', '"+userId+"', '"+userName+"', now(), '"+secret+"')";
				}
				
				// Query Execute
				stmt.executeUpdate(query);
				
			} else if(mode.equals("update")) {
				
				// 게시글 수정 로직
				if((idx == null || "".equals(idx)) || (title == null || "".equals(title)) || (content == null || "".equals(content))) {
					out.println("<script>alert('빈값이 존재합니다.');history.back(-1);</script>");
					return;
				}
				
				if("on".equals(secret)) {
					secret = "y";
				} else {
					secret = "n";
				}
				
				content = content.replace("\r\n", "<br>");
				
				if(!(fileName == null || "".equals(fileName))) {
					File fileObj = new File(fileUploadPath, fileName);
					query = "update insecure_board set title='"+title+"', content='"+content+"', file='"+fileName+"',regdate=now(), secret='"+secret+"' where idx="+idx;
				} else {
					query = "update insecure_board set title='"+title+"', content='"+content+"', regdate=now(), secret='"+secret+"' where idx="+idx;
				}
				
				// Query Execute
				stmt.executeUpdate(query);
				out.println("<script>location.href='index.jsp?taskPage=boardView.jsp&idx="+idx+"';</script>");
				return;
			} else {
				out.println("<script>alert('잘못된 접근입니다.');history.back(-1);</script>");
				return;
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
	}
	out.println("<script>location.href='index.jsp';</script>");
	
%>