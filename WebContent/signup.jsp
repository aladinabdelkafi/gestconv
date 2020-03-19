<%@page import="tn.iit.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="tn.iit.util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="tn.iit.model.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<div class="container">
	<br>
	<div class="card bg-light">
		<article class="card-body mx-auto" style="max-width: 400px;">
			<h4 class="card-title mt-3 text-center">Create Account</h4>
			<form action="SignupControlleur" method="POST" role="form">
				<%
					if (request.getParameter("erreur1") != null) {
				%><div class="alert alert-danger" role="alert">veuillez
					remplir tous les champs</div>
				<%
					}
				%>

				<%
					if (request.getParameter("erreur2") != null) {
				%><div class="alert alert-danger" role="alert">veuillez
					verifier le mot de passe</div>
				<%
					}
				%>

				<%
					if (request.getParameter("erreur3") != null) {
				%><div class="alert alert-danger" role="alert">login déjà
					utilisé</div>
				<%
					}
				%>
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="fullName" class="form-control" placeholder="Full name"
						type="text">
				</div>

				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="login" class="form-control" placeholder="login"
						type="text">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-envelope"></i>
						</span>
					</div>
					<input name="email" class="form-control"
						placeholder="Email address" type="email">
				</div>
				<!-- form-group end.// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" name="password"
						placeholder="Create password" type="password">
				</div>
				<!-- form-group// -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" name="password2"
						placeholder="Repeat password" type="password">
				</div>
				<!-- form-group// -->
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">
						Create Account</button>
				</div>
				<!-- form-group// -->
				<p class="text-center">
					Have an account? <a href="login.jsp">Log In</a>
				</p>
			</form>
		</article>
	</div>
	<!-- card.// -->
</div>
<!--container end.//-->
<br>
<br>