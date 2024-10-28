<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getSession().getServletContext().getRealPath("/upload_example/example1/") + "upload";
    int maxSize  = 1024*1024*10;

    try{
        MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
        String fileName = multi.getFilesystemName("file");
        String contentType = multi.getContentType("file");

        // MIME 타입 검증
        boolean validMimeType = false;
        if(contentType != null) {
            List<String> allowedMimeTypes = Arrays.asList("image/jpeg", "image/png", "image/gif");
            validMimeType = allowedMimeTypes.contains(contentType);
        }

        if(validMimeType) {
            // 업로드 성공
            out.println("<script>alert('File Upload Success~!');location.href='index.html'</script>");
        } else {
            // 업로드 실패
            File uploadedFile = new File(path+"/"+fileName);
            uploadedFile.delete();
            out.println("<script>alert('File Upload Failed~!');history.back(-1);</script>");
        }
    } catch(Exception e) {
        e.printStackTrace();
    }

%>