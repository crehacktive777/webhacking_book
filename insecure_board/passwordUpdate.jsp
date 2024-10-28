<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.net.*, java.text.*, java.io.*, java.lang.*, java.sql.*, javax.sql.*"%>
<%@ include file="common.jsp" %>

    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Password Update</h1>
      <hr>
    </div>
	
	<form action="passwordUpdateAction.jsp" method="POST">
		<div class="form-group">
			<div class="form-group">
			<label for="exampleInputPassword1">Password</label>
			<input type="password" class="form-control" name="password1" placeholder="Password Input">
			</div>
			<div class="form-group">
			<label for="exampleInputPassword2">Password Check</label>
			<input type="password" class="form-control" name="password2" placeholder="Password Check Input">
			</div>
			<div class="text-center">
				<input type="submit" class="btn btn-success" value="패스워드 변경">
			</div>
		</div>
	</form>