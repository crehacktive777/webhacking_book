    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		<h1 class="display-4">Login Page</h1>
    	<hr>
    </div>

      <div class="row">
        <div class="col-md">
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
            <button class="btn btn-info btn-sm btn-block" type="submit">LOGIN</button>
          </form>
        </div>
      </div>
    </div>
