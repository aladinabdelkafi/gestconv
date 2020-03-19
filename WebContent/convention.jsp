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
			int idConv = -1;
			String typeConv = null;
			String dateEditionConv = null;
			String dateSigConv = null;
			String objetConv = null;
			String dateVigueurConv = null;
			String dateExpConv = null;
			String participant1 = null;
			String participant2 = null;
			String participant3 = null;
			String participant4 = null;
			
			if (typeConv == null)
				typeConv = "";

			if (dateEditionConv == null)
				dateEditionConv = "";

			if (dateSigConv == null)
				dateSigConv = "";

			if (objetConv == null)
				objetConv = "";

			if (dateVigueurConv == null)
				dateVigueurConv = "";

			if (dateExpConv == null)
				dateExpConv = "";

			if (participant1 == null)
				participant1 = "";

			if (participant2 == null)
				participant2 = "";

			if (participant3 == null)
				participant3 = "";

			if (participant4 == null)
				participant4 = "";

			Convention conv = (Convention) request.getAttribute("convention");

			if (conv != null) {
				System.out.println(conv.toString());
				idConv=conv.getIdConv();
				typeConv = conv.getTypeConv();
				dateEditionConv = conv.getDateEditionConv().toString();
				dateSigConv = conv.getSateSigConv().toString();
				objetConv = conv.getObjetConv();
				dateVigueurConv = conv.getDateVigueurConv().toString();
				dateExpConv = conv.getDateExpConv().toString();
				participant1 = conv.getParticipant1();
				participant2 = conv.getParticipant2();
				participant3 = conv.getParticipant3();
				participant4 = conv.getParticipant4();

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
									<form action="ConventionControlleur" method="POST" role="form">
										<input  name="idConv" type="hidden" value="<%=idConv%>">

										<div class="form-group">
											<label><h4>type convention</h4></label> <select
												class="form-control" placeholder="Choisir" name="typeConv">
												<option value="<%=typeConv%>"><%=typeConv%></option>
												<option value="universitaire">universitaire</option>
												<option value="industrielle nationale">
													industrielle nationale</option>
												<option value="industrielle">industrielle</option>
											</select>
											<p class="help-block"></p>
										</div>

										<div class="form-group">
											<label><h4>participant N1</h4></label> <input type="text"
												name="participant1" class="form-control"
												value="<%=participant1%>">
											<p class="help-block"></p>
										</div>
										<div class="form-group">
											<label><h4>participant N2</h4></label> <input type="text"
												name="participant2" class="form-control"
												value="<%=participant2%>">
											<p class="help-block"></p>
										</div>
										<div class="form-group">
											<label>
												<h4>participant N3</h4>
											</label> <input type="text" name="participant3" class="form-control"
												value="<%=participant3%>">
											<p class="help-block"></p>
										</div>
										<div class="form-group">
											<label><h4>participant N4</h4></label> <input type="text"
												name="participant4" class="form-control"
												value="<%=participant4%>">
											<p class="help-block"></p>
										</div>
										<div class="form-group">
											<label>
												<h4>Date de l'edition</h4>
											</label>
											<div id="datetimepicker1" class="input-append date">
												<input type="text" name="dateEditionConv"
													value="<%=dateEditionConv%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>

										<div class="form-group">
											<label>
												<h4>Date de signature</h4>
											</label>
											<div id="datetimepicker2" class="input-append date">
												<input type="text" name="dateSigConv"
													value="<%=dateSigConv%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>
										<div class="form-group">
											<label><h4>Objet</h4> </label>
											<textarea class="form-control" name="objetConv"
												 rows="3"><%=objetConv%></textarea>
											<p class="help-block"></p>
										</div>

										<div class="form-group">
											<label>
												<h4>Date d'entrée en vigueur</h4>
											</label>
											<div id="datetimepicker3" class="input-append date">
												<input type="text" name="dateVigueurConv"
													value="<%=dateVigueurConv%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>

										<div class="form-group">
											<label>
												<h4>Date d'expiration</h4>
											</label>
											<div id="datetimepicker4" class="input-append date">
												<input type="text" name="dateExpConv"
													value="<%=dateExpConv%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
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
