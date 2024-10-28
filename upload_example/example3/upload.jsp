<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%
    request.setCharacterEncoding("UTF-8");
    String path = request.getSession().getServletContext().getRealPath("/upload_example/example3/") + "upload";
    int maxSize  = 1024*1024*10;
    
    try{
        MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
        String fileName = multi.getFilesystemName("file");
        String fileExt = fileName.substring(fileName.indexOf(".") + 1).toLowerCase();

        // 확장자 검증 - 화이트리스트 방식
        boolean validExt = false;
        if(fileExt != null) {
            List<String> whiteListExts = Arrays.asList("jpg", "gif", "png");
            for(String ext : whiteListExts) {
                if(fileExt.contains(ext)) {
                    validExt = true;
                    break;
                }
            }
        }

        if(validExt) {
            // 업로드 성공
            out.println("<script>alert('File Upload Success~!');location.href='index.html'</script>");
        } else {
            // 업로드 실패
            File uploadedFile = new File(path+"/"+fileName);
            uploadedFile.delete();
            out.println("<script>alert('File Upload Failed~!');history.back(-1);</script>");
        }
    } catch(Exception e) {
        out.println("Error Msg: "+e.toString());
    }

%>