<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="vendor/bootstrap/css/styles.css">
<!------ Include the above in your HEAD tag ---------->
<div class="wrapper fadeInDown">
	<div id="formContent">
		<!-- Tabs Titles -->
		<!-- Login Form -->
		<form action="LoginControlleur" method="POST" role="form">
			<%
				if (request.getParameter("erreur1") != null) {
			%><div class="alert alert-danger" role="alert">veuillez
				remplir tous les champs</div>
			<%
				}
			%>
			
			
			<%
				if (request.getParameter("erreur2") != null) {
			%><div class="alert alert-danger" role="alert">cet utilisateur n'existe pas</div>
			<%
				}
			%>
			<input type="text" id="login" class="fadeIn second" name="login"
				placeholder="login"> <input type="text" id="password"
				class="fadeIn third" name="password" placeholder="password">
			<input type="submit" class="fadeIn fourth" value="Log In">
		</form>
		<!-- Remind Passowrd -->
		<div id="formFooter">
			<a class="underlineHover" href="signup.jsp">You Don't Have an
				account?</a>
		</div>
	</div>
</div>