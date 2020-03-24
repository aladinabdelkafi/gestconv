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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body onload="Test()">

	<div id="wrapper">

		<!-- Navigation -->

		</ul>
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
			ArrayList <Integer>arr= new ArrayList();
			if (conv != null) {
				
				
				listPartConvv= (ArrayList<Part_Conv>) request.getAttribute("conventionParticipant");
				for(int i=0;i<listPartConvv.size();i++){
					arr.add(listPartConvv.get(i).getParticipant().getIdParticipant());
					if(i==0){
						date1=listPartConvv.get(i).getDateSigConv().toString();
					}
					if(i==1){
						date2=listPartConvv.get(i).getDateSigConv().toString();
					}
					if(i==2){
						date3=listPartConvv.get(i).getDateSigConv().toString();
					}
					if(i==3){
						date4=listPartConvv.get(i).getDateSigConv().toString();
					}
				}
				System.out.println(date1+"   "+date2+"   "+date3+"   "+date4);
				idConv = conv.getIdConv();
				nametypeConv = conv.getTypeConv().getNameType();
				dateEditionConv = conv.getDateEditionConv().toString();
				objetConv = conv.getObjetConv();
				dateVigueurConv = conv.getDateVigueurConv().toString();
				dateExpConv = conv.getDateExpConv().toString();

			}

			// Correction des  valleurs nulles
		%>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 id="titre" class="page-header">Ajouter une Convention</h1>
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
										<input id="idConv" name="idConv" type="hidden" value="<%=idConv%>">
										<input id="aa" name="nbr" type="hidden" value="<%=arr.size()%>">



<div class="col-lg-10">
										<div class="form-group">
										
											<label><h4>type convention</h4></label> <select
												class="form-control" placeholder="Choisir" name="typeConv">
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
										<label><h4>les participants</h4></label> 
										<div class="select2-purple">
											<select id="select_demo" onChange="SelectPage(this);" class="select2" multiple
												data-placeholder="Select a State" name="parts"
												data-dropdown-css-class="select2-purple"
												style="width: 100%;">
												<%
													ParticipentDao pDao = new ParticipentDao();
													List<Participant> lstp = pDao.getAllParticipant();
													for (int i = 0; i < lstp.size(); i++) {
														if(arr.contains(lstp.get(i).getIdParticipant())){
													
												%>
												
												<option selected value="<%=lstp.get(i).getIdParticipant()%>">
													<%
														out.println(lstp.get(i).getNameParticipant());
													%>
												</option>
												<%
												}else{
												%>
												<option value="<%=lstp.get(i).getIdParticipant()%>">
													<%
														out.println(lstp.get(i).getNameParticipant());
													%>
												</option>
												<%}
														
													}
												%>
											</select>
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
											<label><h4>Objet</h4> </label>
											<textarea class="form-control" name="objetConv" rows="3"><%=objetConv%></textarea>
											<p class="help-block"></p>
										</div>
										<div class="form-group">
											<label>
												<h4>Date d'entrée en vigueur</h4>
											</label>
											<div id="datetimepicker2" class="input-append date">
												<input type="text" name="dateVigueurConv"
													value="<%=dateVigueurConv%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>

										<div class="form-group" >
											<label>
												<h4>Date d'expiration</h4>
											</label>
											<div id="datetimepicker3" class="input-append date" >
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
										
										
</div>	


<div  class="col-lg-2">
										
										
										
										<div class="form-group1" id="d1" style="visibility:hidden;" >
											<label>
												<h4>Date 1</h4>
											</label>
											<div id="datetimepicker4" class="input-append date" >
												<input  id="dd1" type="text" name="date1"
													value="<%=date1%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>
										
										
										<div class="form-group2" id="d2"  style="visibility:hidden;">
											<label>
												<h4>Date 2</h4>
											</label>
											<div id="datetimepicker5" class="input-append date" >
												<input  id="dd2" type="text" name="date2"
													value="<%=date2%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>
										
										
										<div class="form-group3" id="d3" style="visibility:hidden;">
											<label>
												<h4>Date 3</h4>
											</label>
											<div id="datetimepicker6" class="input-append date" >
												<input  id="dd3" type="text" name="date3"
													value="<%=date3%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>
										
										<div class="form-group4" id="d4" style="visibility:hidden;" >
											<label>
												<h4>Date 4</h4>
											</label>
											<div id="datetimepicker7" class="input-append date" >
												<input  id="dd4" type="text" name="date4"
													value="<%=date4%>"></input> <span class="add-on">
													<i data-time-icon="icon-time"
													data-date-icon="icon-calendar"></i>
												</span>
											</div>
											<p class="help-block"></p>
										</div>
</div>

									

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
	<script type="text/javascript">
		$('#datetimepicker5').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'FR'
		});
	</script>
	<script type="text/javascript">
		$('#datetimepicker6').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'FR'
		});
	</script>
	<script type="text/javascript">
		$('#datetimepicker7').datetimepicker({
			format : 'yyyy-MM-dd',
			language : 'FR'
		});
	</script>
	<!-- Select2 -->
	<script src="plugins/select2/js/select2.full.min.js"></script>
	<script>
	function SelectPage(elem)
	{
		var d1 =document.querySelector('.form-group1');
		var d2 =document.querySelector('.form-group2');
		var d3 =document.querySelector('.form-group3');
		var d4 =document.querySelector('.form-group4');
		
		
        
			var count = $("#select_demo :selected").length;
			//alert(count);
			if(count==0){
				d1.style.visibility = 'hidden';
				d2.style.visibility = 'hidden';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
				  document.getElementById("dd2").value = "";
				  document.getElementById("dd3").value = "";
				  document.getElementById("dd4").value = "";
				  document.getElementById("dd1").value = "";
				
			}
			if(count==1){
				
				d1.style.visibility = 'visible';
				d2.style.visibility = 'hidden';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
				  document.getElementById("dd2").value = "";
				  document.getElementById("dd3").value = "";
				  document.getElementById("dd4").value = "";
			}
			if(count==2){
				d1.style.visibility = 'visible';
				d2.style.visibility = 'visible';
				d3.style.visibility = 'hidden';
				d4.style.visibility = 'hidden';
				 document.getElementById("dd3").value = "";
				  document.getElementById("dd4").value = "";
				
			}
			if(count==3){
				d1.style.visibility = 'visible';
				d2.style.visibility = 'visible';
				d3.style.visibility = 'visible';
				d4.style.visibility = 'hidden';
				document.getElementById("dd4").value = "";
			}
			if(count==4){
				d1.style.visibility = 'visible';
				d1.style.visibility = 'visible';
				d1.style.visibility = 'visible';
				d1.style.visibility = 'visible';
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
		function Test()
		{ 
			var Valh = document.getElementById("idConv").value;
			if(Valh!=-1){
				document.getElementById("titre").innerHTML = "Modifier une Convention";
			}
			
			var d1 =document.querySelector('.form-group1');
			var d2 =document.querySelector('.form-group2');
			var d3 =document.querySelector('.form-group3');
			var d4 =document.querySelector('.form-group4');
			
		var inputVal = document.getElementById("aa").value;
		
		if(inputVal==0){
			d1.style.visibility = 'hidden';
			d2.style.visibility = 'hidden';
			d3.style.visibility = 'hidden';
			d4.style.visibility = 'hidden';
		}
		if(inputVal==1){
			
			d1.style.visibility = 'visible';
			d2.style.visibility = 'hidden';
			d3.style.visibility = 'hidden';
			d4.style.visibility = 'hidden';
		}
		if(inputVal==2){
			d1.style.visibility = 'visible';
			d2.style.visibility = 'visible';
			d3.style.visibility = 'hidden';
			d4.style.visibility = 'hidden';
		}
		if(inputVal==3){
			d1.style.visibility = 'visible';
			d2.style.visibility = 'visible';
			d3.style.visibility = 'visible';
			d4.style.visibility = 'hidden';
		}
		if(inputVal==4){
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
</body>

</html>
