<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Add Project</title>
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.container {
	max-width: 960px;
}

.lh-condensed {
	line-height: 1.25;
}
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
<script type="text/javascript">

function myonload(){
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd = '0'+dd;
	} 

	if(mm<10) {
	    mm = '0'+mm;
	} 

	today = yyyy + '-' + mm + '-' + dd ;
	dd++;
	var nextday= yyyy + '-' + mm + '-' + dd ;
	document.getElementById("starts").min=today;
	
	console.log(nextday);
}
function myonclick(){
	var startdate = document.getElementById("starts").value;
	document.getElementById("ends").min=startdate;
	console.log(document.getElementById("ends").min);
}


</script>
</head>
<body class="bg-light" onload="myonload()">
${message }
	<jsp:include page="/common/header.jsp"></jsp:include>
	<div class="container">
		<div class="py-5 text-center">
			<!-- <img class="d-block mx-auto mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h2 class="mb-3">ADD PROJECT</h2>

			<div class="col-sm order-md-1">

				<form class="needs-validation" action="addingprojectinfo.html"
					method="POST">
					<div class="row text-center">
						<div class="col-md-4 mb-3">
							<label for="pname">Project Name</label> <input type="text"
								class="form-control" name="pname" placeholder="Project Name"
								value="" required>
							<div class="invalid-feedback">Valid Project name is
								required.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="cust_name">Customer Name</label> <input type="text"
								class="form-control" name="cust_name" pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
								placeholder="Customer Name" value="" required>
							<div class="invalid-feedback">Valid Customer name is
								required.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="cust_mob">Customer Mobile</label> <input type="text"
								class="form-control" name="cust_mob"  pattern="[0-9]{3}[0-9]{3}[0-9]{4}" 
								placeholder="Customer Mobile" value="" required>
							<div class="invalid-feedback">Valid Customer Mobile is
								required.</div>
						</div>
					</div>


					<hr class="mb-4">


					<div class="mb-3">
						<label for="cust_addr">Customer Address</label> <input type="text"
							class="form-control" name="cust_addr" placeholder="1234 Main St"
							required>
						<div class="invalid-feedback">Please enter Customer Address.
						</div>
					</div>
					<hr class="mb-4">

					<div class="row text-center">
						<div class="col-md-4 mb-3">
							<label for="budget">Budget</label> <input type="number"
								class="form-control" name="budget" placeholder="Budget" min="50000" value=""
								required>
							<div class="invalid-feedback">Valid Budget is required.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="start">Start Date</label>
							<div class="input-group">
								 <input type="date" class="form-control" id="starts" name="start" onchange="myonclick()"  value="" required>
							</div>
							 
							<div class="invalid-feedback">Valid Start Date is required.
							</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="end">End Date</label>
							<div class="input-group">
								<input type="date" class="form-control" name="end" id="ends" value="" required>
							</div>
						
							<div class="invalid-feedback">Valid End Date is required.</div>
						</div>
					</div>





					<hr class="mb-4">



					<button class="btn btn-primary btn-lg btn-block" type="submit">Confirm</button>
				</form>
			</div>
		</div>

		<br>
	</div>
	<!-- Jquery JS-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/datepicker/moment.min.js"></script>
	<script src="vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="js/global.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/docs/4.2/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="/docs/4.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-zDnhMsjVZfS3hiP7oCBRmfjkQC4fzxVxFhBx8Hkz2aZX8gEvA/jsP3eXRCvzTofP"
		crossorigin="anonymous"></script>
	<script src="form-validation.js"></script>
</body>
</html>
