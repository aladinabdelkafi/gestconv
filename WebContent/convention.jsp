<%@page import="tn.iit.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="tn.iit.util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="tn.iit.model.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="nav.jsp"%>
<%
	HttpSession sessions = request.getSession();

	if (sessions.getAttribute("login") == null && sessions.getAttribute("password") == null) {

		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>
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

<link rel="stylesheet" href="plugins/select2/css/select2.min.css">
<link rel="stylesheet"
	href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">


</head>

<body onload="Test()"  onSubmit="return Validatedateexp();">

	<div id="wrapper">

		<!-- Navigation -->


		<%
			// gestion de la saisie de  l'utilisateur en cours
			int idConv = -1;
			String nametypeConv = null;
			String dateEditionConv = null;
			String objetConv = null;
			String dateVigueurConv = null;
			String dateExpConv = null;
			String date1 = null;
			String date2 = null;
			String date3 = null;
			String date4 = null;

			if (nametypeConv == null)
				nametypeConv = "";

			if (dateEditionConv == null)
				dateEditionConv = "";

			if (objetConv == null)
				objetConv = "";

			if (dateVigueurConv == null)
				dateVigueurConv = "";

			if (dateExpConv == null)
				dateExpConv = "";

			if (date1 == null)
				date1 = "";

			if (date2 == null)
				date2 = "";

			if (date3 == null)
				date3 = "";

			if (date4 == null)
				date4 = "";
			ArrayList<Part_Conv> listPartConvv;
			Convention conv = (Convention) request.getAttribute("convention");
			ArrayList<Integer> arr = new ArrayList();
			if (conv != null) {

				listPartConvv = (ArrayList<Part_Conv>) request.getAttribute("conventionParticipant");
				for (int i = 0; i < listPartConvv.size(); i++) {
					arr.add(listPartConvv.get(i).getParticipant().getIdParticipant());
					if (i == 0) {
						date1 = listPartConvv.get(i).getDateSigConv().toString();
					}
					if (i == 1) {
						date2 = listPartConvv.get(i).getDateSigConv().toString();
					}
					if (i == 2) {
						date3 = listPartConvv.get(i).getDateSigConv().toString();
					}
					if (i == 3) {
						date4 = listPartConvv.get(i).getDateSigConv().toString();
					}
				}
				System.out.println(date1 + "   " + date2 + "   " + date3 + "   " + date4);
				idConv = conv.getIdConv();
				nametypeConv = conv.getTypeConv().getNameType();
				dateEditionConv = conv.getDateEditionConv().toString();
				objetConv = conv.getObjetConv();
				dateVigueurConv = conv.getDateVigueurConv().toString();
				dateExpConv = conv.getDateExpConv().toString();

			}

			// Correction des  valleurs nulles
		%>
		<div id="page-wrapper" class="content-wrapper">
			<br>
			<div class="row">
				<div class="col-lg-12">
					<div class="card card-primary">
						<div class="card-header">
							<h1 id="titre" class="page-header">Ajouter Convention</h1>
						</div>
						<!-- /.card-header -->
						<div class="card-body">

							<form action="ConventionControlleur" method="POST" role="form">
								<input id="idConv" name="idConv" type="hidden"
									value="<%=idConv%>"> <input id="aa" name="nbr"
									type="hidden" value="<%=arr.size()%>">

								<div class="col-lg-8">

									<div class="form-group">
										<h4>
											<label>type convention</label>
										</h4>
										<select class="form-control" placeholder="Choisir"
											name="typeConv">
											<%
												TypeConvDao vDao = new TypeConvDao();
												List<TypeConv> lst = vDao.getAllTypeConv();
												for (int i = 0; i < lst.size(); i++) {
													if (nametypeConv.equals(lst.get(i).getNameType())) {
											%>
											<option value="<%=lst.get(i).getIdType()%>" selected>
												<%
													out.println(lst.get(i).getNameType());
												%>
											</option>
											<%
												} else {
											%>
											<option value="<%=lst.get(i).getIdType()%>">
												<%
													out.println(lst.get(i).getNameType());
												%>
											</option>
											<%
												}
												}
											%>
										</select>
										<p class="help-block"></p>
									</div>
									<div class="form-group">
										<h4>
											<label>les participants</label>
										</h4>
										<div class="select2-purple">
											<select id="select_demo" onChange="SelectPage(this);"
												class="select2" multiple data-placeholder="Select a State"
												name="parts" data-dropdown-css-class="select2-purple"
												style="width: 100%;">
												<%
													ParticipentDao pDao = new ParticipentDao();
													List<Participant> lstp = pDao.getAllParticipant();
													for (int i = 0; i < lstp.size(); i++) {
														if (arr.contains(lstp.get(i).getIdParticipant())) {
												%>

												<option selected value="<%=lstp.get(i).getIdParticipant()%>">
													<%
														out.println(lstp.get(i).getNameParticipant());
													%>
												</option>
												<%
													} else {
												%>
												<option value="<%=lstp.get(i).getIdParticipant()%>">
													<%
														out.println(lstp.get(i).getNameParticipant());
													%>
												</option>
												<%
													}

													}
												%>
											</select>
										</div>
									</div>




									<div class="form-group">
										<h4>
											<label> Date de l'edition </label>
										</h4>
										<div id="datetimepicker1" class="datetimepicker">

											<input type="date" name="dateEditionConv"
												placeholder="yyyy-MM-dd" value="<%=dateEditionConv%>" id="dateedit">
											<span></span>

										</div>

									</div>


									<div class="form-group">
										<h4>
											<label>Objet </label>
										</h4>

										<textarea class="form-control" name="objetConv" rows="3"><%=objetConv%></textarea>
										<p class="help-block"></p>
									</div>
									<div class="form-group">
										<h4>
											<label> Date d'entrée en vigueur </label>
										</h4>
										<div id="datetimepicker2" class="input-append date">
											<input type="date" name="dateVigueurConv"
												placeholder="yyyy-MM-dd" value="<%=dateVigueurConv%>" id="dateen">

										</div>
										<p class="help-block"></p>
									</div>

									<div class="form-group">
										<h4>
											<label> Date d'expiration </label>
										</h4>
										<div id="datetimepicker3" class="input-append date">
											<input type="date" name="dateExpConv"
												placeholder="yyyy-MM-dd" value="<%=dateExpConv%>" id="dateexp" >

										</div>
										<p class="help-block"></p>
									</div>
									<button type="submit"  class="btn btn-default">Submit</button>
									<button type="reset" class="btn btn-default">Reset</button>


								</div>


								<div class="col-lg-2">



									<div class="form-group1" id="d1" style="visibility: hidden;">
										<h4>
											<label> Date 1 </label>
										</h4>
										<div id="datetimepicker4" class="input-append date">
											<input type="date" name="date1" placeholder="yyyy-MM-dd"
												value="<%=date1%>" id="date1">

										</div>
										<p class="help-block"></p>
									</div>


									<div class="form-group2" id="d2" style="visibility: hidden;">
										<h4>
											<label> Date 2 </label>
										</h4>
										<div id="datetimepicker5" class="input-append date">
											<input type="date" name="date2" id="date2" placeholder="yyyy-MM-dd"
												value="<%=date2%>">

										</div>
										<p class="help-block"></p>
									</div>


									<div class="form-group3" id="d3" style="visibility: hidden;">
										<h4>
											<label> Date 3 </label>
										</h4>
										<div id="datetimepicker6" class="input-append date">
											<input type="date" name="date3" id="date3" placeholder="yyyy-MM-dd"
												value="<%=date3%>">

										</div>
										<p class="help-block"></p>
									</div>

									<div class="form-group4" id="d4" style="visibility: hidden;">
										<h4>
											<label> Date 4 </label>
										</h4>
										<div id="datetimepicker7" class="input-append date">
											<input type="date" name="date4" id="date4" placeholder="yyyy-MM-dd"
												value="<%=date4%>">

										</div>
										<p class="help-block"></p>
									</div>
								</div>

							</form>


						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col-lg-12 -->
			</div>

		</div>
	</div>
	<!-- /#page-wrapper -->


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

	<!-- Select2 -->
	<script src="plugins/select2/js/select2.full.min.js"></script>
	<script>
		function SelectPage(elem) {
			var d1 = document.querySelector('.form-group1');
			var d2 = document.querySelector('.form-group2');
			var d3 = document.querySelector('.form-group3');
			var d4 = document.querySelector('.form-group4');

			var count = $("#select_demo :selected").length;
			//alert(count);
			if (count == 0) {
				d1.style.visibility = 'hidden';
				d2.style.visibility = 'hidden';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
				document.getElementById("dd2").value = "";
				document.getElementById("dd3").value = "";
				document.getElementById("dd4").value = "";
				document.getElementById("dd1").value = "";

			}
			if (count == 1) {

				d1.style.visibility = 'visible';
				d2.style.visibility = 'hidden';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
				document.getElementById("dd2").value = "";
				document.getElementById("dd3").value = "";
				document.getElementById("dd4").value = "";
			}
			if (count == 2) {
				d1.style.visibility = 'visible';
				d2.style.visibility = 'visible';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
				document.getElementById("dd3").value = "";
				document.getElementById("dd4").value = "";

			}
			if (count == 3) {
				d1.style.visibility = 'visible';
				d2.style.visibility = 'visible';
				d3.style.visibility = 'visible';
				d4.style.visibility = 'hidden';
				document.getElementById("dd4").value = "";
			}
			if (count == 4) {
				d1.style.visibility = 'visible';
				d2.style.visibility = 'visible';
				d3.style.visibility = 'visible';
				d4.style.visibility = 'visible';
			}

		}

		$(function() {
			//Initialize Select2 Elements
			$('.select2').select2()
			//Initialize Select2 Elements
			$('.select2bs4').select2({
				theme : 'bootstrap4'
			})
		})

		$(document).ready(function() {
			$("#select_demo").select2({
				maximumSelectionLength : 4
			});
		});
		function Test() {
			var Valh = document.getElementById("idConv").value;
			if (Valh != -1) {
				document.getElementById("titre").innerHTML = "Modifier une Convention";
			}

			var d1 = document.querySelector('.form-group1');
			var d2 = document.querySelector('.form-group2');
			var d3 = document.querySelector('.form-group3');
			var d4 = document.querySelector('.form-group4');

			var inputVal = document.getElementById("aa").value;

			if (inputVal == 0) {
				d1.style.visibility = 'hidden';
				d2.style.visibility = 'hidden';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
			}
			if (inputVal == 1) {

				d1.style.visibility = 'visible';
				d2.style.visibility = 'hidden';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
			}
			if (inputVal == 2) {
				d1.style.visibility = 'visible';
				d2.style.visibility = 'visible';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
			}
			if (inputVal == 3) {
				d1.style.visibility = 'visible';
				d2.style.visibility = 'visible';
				d3.style.visibility = 'visible';
				d4.style.visibility = 'hidden';
			}
			if (inputVal == 4) {
				d1.style.visibility = 'visible';
				d1.style.visibility = 'visible';
				d1.style.visibility = 'visible';
				d1.style.visibility = 'visible';
			}

		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#select_demo").select2({
				maximumSelectionLength : 4
			});
		});
	</script>
	
	
	<script>
	
function Validatedateexp() {
	var dateen = document.getElementById("dateen").value;
	var dateexp = document.getElementById("dateexp").value;
	var dateedit = document.getElementById("dateedit").value;
	
	var date1 = document.getElementById("date1").value;
	var date2 = document.getElementById("date2").value;
	var date3 = document.getElementById("date3").value;
	var date4 = document.getElementById("date4").value;
	
	if(dateexp<=dateen){
		alert("La date d'expiration d'une convention doit etre supérieur au date d'entrée en vigueur")
		return false;
	}else if(dateexp<=dateedit){
		alert("La date d'expiration d'une convention doit etre supérieur au Date d'édition d'une convention")
		return false;
	}else if(dateen<dateedit){
		alert("La date d'entrée en vigueur d'une convention doit etre supérieur ou égale a la Date d'édition ")
		return false;
	}else if( date1<dateedit ||date1<dateen || date1>=dateexp ){
		alert("verifier date 1 ")
		return false;
	}else if( date2<dateedit ||date2<dateen || date2>=dateexp ){
		alert("verifier date 2 ")
		return false;
	}
	else if((date3!="") && (date3<dateedit ||date3<dateen || date3>=dateexp) ){
		alert("verifier date 3 ")
		return false;
	}
	else if((date4!="") && (date4<dateedit ||date4<dateen || date4>=dateexp) ){
		alert("verifier date 4 ")
		return false;
	}
	
	return true;



}
</script>
</body>

</html>
