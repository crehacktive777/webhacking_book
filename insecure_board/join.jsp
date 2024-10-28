    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Join Page</h1>
      <hr>
    </div>
    
    <div class="container">
		<form action="joinAction.jsp" method="POST">
		  <div class="form-group">
			<label>ID</label>
			<input type="text" class="form-control" name="id" placeholder="ID Input">
		  </div>
		  <div class="form-group">
			<label for="exampleInputPassword1">Password</label>
			<input type="password" class="form-control" name="password1" placeholder="Password Input">
		  </div>
		  <div class="form-group">
			<label for="exampleInputPassword2">Password Check</label>
			<input type="password" class="form-control" name="password2" placeholder="Password Check Input">
		  </div>
		  <div class="form-group">
			<label>Name</label>
			<input type="text" class="form-control" name="name" placeholder="Name Input">
		  </div>
		  <div class="form-group">
			<label>E-mail</label>
			<input type="email" id="email" class="form-control" name="email" placeholder="E-mail Input">
		  </div>
		  <div class="form-group">
			<label>Company</label>
			<input type="text" class="form-control" name="company" placeholder="Company Input">
		  </div>
      <div class="text-center">
      <button type="submit" class="btn btn-outline-danger">JOIN</button>
      </div>
		</form>
    </div>
 