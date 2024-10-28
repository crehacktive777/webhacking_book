<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*"%>
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
      <h5 class="my-0 mr-md-auto font-weight-normal">Crehacktive Company Membership</h5>
      <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="main.jsp">Home</a>
        <a class="p-2 text-dark" href="about.jsp">About</a>
        <a class="p-2 text-dark" href="photo.jsp">Photo</a>
        <a class="p-2 text-dark" href="forum.jsp">Forum</a>
      </nav>
    </div>

    <div class="container">
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h1 class="display-4">Photo</h1>
    	<hr>
    </div>

      <div class="row">
        <table class="table">
          <thead class="thead-light">
          <tr>
            <th width="10%" scope="col" class="text-center">No</th>
            <th width="50%" scope="col" class="text-center">Title</th>
            <th width="20%" scope="col" class="text-center">Name</th>
            <th width="20%" scope="col" class="text-center">Date</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <th scope="row" class="text-center">2</th>
            <td><a href="#">자연배경</a></td>
            <td class="text-center">김대준</td>
            <td class="text-center">2024-10-13</td>
          </tr>
          <tr>
            <th scope="row" class="text-center">1</th>
            <td><a href="#">컴퓨터 배경화면 추천!</a></td>
            <td class="text-center">박수윤</td>
            <td class="text-center">2024-10-12</td>
          </tr>
          </tbody>
        </table>
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
