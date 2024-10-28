

    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Write Page</h1>
      <hr>
    </div>
    
    <div class="container">
		<form action="boardAction.jsp" method="POST" enctype="multipart/form-data">
		  <div class="form-group">
			<label>Title</label>
			<input type="text" class="form-control" name="title" placeholder="Title Input">
		  </div>
		  <div class="form-group">
			<label for="exampleInputPassword1">Content</label>
			<textarea class="form-control" name="content" rows="5" placeholder="Contents Input"></textarea>
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">File</label>
        <input type="file" class="form-control" name="userfile">
		  </div>
      <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input" id="customCheck1" name="secret">
        <label class="custom-control-label" for="customCheck1">Secret Post</label>
      </div>
		<div class="text-right">
			<input type="hidden" name="mode" value="insert">
			<button type="submit" class="btn btn-outline-secondary">Register</button>
			<button type="button" class="btn btn-outline-danger" onclick="history.back(-1);">Back</button>
		</div>
		</form>
    </div>