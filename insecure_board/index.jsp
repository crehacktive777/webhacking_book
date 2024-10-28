<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%
	String userId = (String)session.getAttribute("id");
	String taskPage = request.getParameter("taskPage");

	if(taskPage == null || "".equals(taskPage)) {
		taskPage = "boardList.jsp";
	} else {
    String[] pageList = {"login.jsp", "join.jsp", "mypage.jsp", "pingcheck.jsp", "boardView.jsp", "boardList.jsp", "boardInsert.jsp", "boardUpdate.jsp", "mypageUpdate.jsp", "passwordUpdate.jsp"};
    boolean isValid = false;
    for (String cPage : pageList) {
      if(taskPage.contains(cPage)) {
        isValid = true;
        break;
      }
    }

    if(!isValid) {
      taskPage = "error.jsp";
    }
  }
%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>::CREHACKTIVE INSECURE WEB-SITE ::</title>

    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./css/pricing.css" rel="stylesheet">
  </head>

  <body>

    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
      <span data-feather="box"></span>&nbsp;&nbsp;
      <h5 class="my-0 mr-md-auto font-weight-normal">CREHACKTIVE INSECURE WEB-SITE</h5>
      <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="index.jsp">Home</a>
        <% if(userId == null || "null".equals(userId)) { %>
        <a class="p-2 text-dark" href="index.jsp?taskPage=login.jsp">Login</a>
        <a class="p-2 text-dark" href="index.jsp?taskPage=join.jsp">Join</a>
        <% } else { %>
        <a class="p-2 text-dark" href="index.jsp?taskPage=mypage.jsp&id=<%=userId%>">MyPage</a>
        <% if(userId.equals("admin")) { %>
        <a class="p-2 text-dark" href="index.jsp?taskPage=pingcheck.jsp">Ping Check</a>
        <% } %>
        <!--a class="p-2 text-dark" href="index.jsp?taskPage=pingcheck.jsp">Ping Check</a-->
        <a class="p-2 text-dark" href="logout.jsp">Logout</a>
        <% } %>
      </nav>
    </div>

    <div class="container">
		<jsp:include page="<%=taskPage%>" flush="false"/>
    </div>
    
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="./js/jquery-slim.min.js"><\/script>')</script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/holder.min.js"></script>
    <script>
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
  </body>
</html>
