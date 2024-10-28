<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*"%>
<%
	String userId = (String)session.getAttribute("ex1_id");

  if(!"".equals(userId) && userId != null) {
    out.println("<script>locaion.href='main.jsp'</script>");
    return;
  }
%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>:: Crehacktive Company ::</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/pricing.css" rel="stylesheet">
  </head>

  <body>

    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
      <span data-feather="airplay"></span>&nbsp;&nbsp;
      <h5 class="my-0 mr-md-auto font-weight-normal">Crehacktive Company</h5>
    </div>

    <div class="container">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h1 class="display-4">MemberShip Page</h1>
    	<hr>
    </div>

      <div class="row">
        <div class="col-sm">
        </div>
        <div class="col-sm">
          <form class="needs-validation" action="loginAction.jsp" method="POST" novalidate>
            <div class="mb-3">
              <label for="username">ID</label>
              <div class="input-group">
                <input type="text" class="form-control" name="id" id="username" placeholder="ID" required>
              </div>
            </div>
            <div class="mb-3">
              <label>Password</label>
              <input type="password" class="form-control" name="password" placeholder="Password" required>
              <div class="invalid-feedback">
                (필수) 패스워드를 입력하세요.
              </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-success btn-sm btn-block" type="submit">LOGIN</button>
          </form>
        </div>
        <div class="col-sm">
        </div>
      </div>
    </div>
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
    <script>window.jQuery || document.write('<script src="../js/jquery-slim.min.js"><\/script>')</script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/holder.min.js"></script>
    <script>
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
  </body>
</html>
