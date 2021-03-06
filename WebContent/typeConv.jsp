<%@page import="tn.iit.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="tn.iit.util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="tn.iit.model.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="nav.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Gestion Convention</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->

		</ul>
		<%
			// gestion de la saisie de  l'utilisateur en cours
			int idType = -1;
			String typeConv = null;

			if (typeConv == null)
				typeConv = "";

			TypeConv type = (TypeConv) request.getAttribute("type");

			if (type != null) {
				
				idType = type.getIdType();
				typeConv = type.getNameType();

			}

			// Correction des  valleurs nulles
		%>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Ajouter une Convention</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading"></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form action="TypeControlleur" method="POST" role="form">
										<input name="idType" type="hidden" value="<%=idType%>">

										<div class="form-group">
											<label><h4>Type Convention</h4> </label> <input type="text"
												name="typeConv" class="form-control" value="<%=typeConv%>">
											<p class="help-block"></p>

										</div>
										<button type="submit" class="btn btn-default">Submit</button>
										<button type="reset" class="btn btn-default">Reset</button>
									</form>
								</div>
								<!-- /.col-lg-6 (nested) -->



							</div>
							<!-- /.col-lg-6 (nested) -->
						</div>
						<!-- /.row (nested) -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>
	<script type="text/javascript"
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
		
	</script>
	<script type="text/javascript"
		src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
		
	</script>
	<script type="text/javascript"
		src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
		
	</script>
	<script type="text/javascript"
		src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
		
	</script>
	<script type="text/javascript">
		$('#datetimepicker1').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'FR'
		});
	</script>
	<script type="text/javascript">
		$('#datetimepicker2').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'FR'
		});
	</script>
	<script type="text/javascript">
		$('#datetimepicker3').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'FR'
		});
	</script>
	<script type="text/javascript">
		$('#datetimepicker4').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'FR'
		});
	</script>
</body>

</html>
