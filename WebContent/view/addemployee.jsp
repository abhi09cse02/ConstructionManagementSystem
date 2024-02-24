<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">

<title>Add Employee</title>

<!-- Bootstrap core CSS -->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">


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
</style>
<!-- Custom styles for this template -->
<link href="pricing.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>


	<br>



	<!-- 	//add employee -->
	<div class="container">
		<div class="py-5 text-center">
			
			<h2 class="mb-3">ADD EMPLOYEE</h2>

			<div class="col-sm order-md-1">

				<form class="needs-validation" action="addemployee.html"
					method="post" enctype="multipart/form-data">
					<div class="row text-center">
						<div class="col-md-4 mb-3">
							<label for="pname">Employee Name</label> <input type="text"
								class="form-control" name="emp_name"
								pattern="[a-zA-Z][a-zA-Z ]+[a-zA-Z]$"
								placeholder="Employee Name" value="" required>
							<div class="invalid-feedback">Valid Employee name is
								required.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="cust_name">DoB</label>
							<div class="input-group">
								<input class="input--style-3 form-control" type="date"
									placeholder="dd/mm/yy" name="dob" max="2000-01-01"
									min="1970-01-01" required>

							</div>
							<div class="invalid-feedback">Valid Employee DOB is
								required.</div>
						</div>
						<div class="col-md-4 mb-3">
							<label for="cust_mob">Employee Mobile</label> <input type="tel"
								class="form-control" name="phone"
								pattern="[0-9]{3}[0-9]{3}[0-9]{4}" placeholder="Employee Mobile"
								value="" required>
							<div class="invalid-feedback">Valid Employee Mobile is
								required.</div>
						</div>
					</div>


					<hr class="mb-4">
					<div class="mb-3">
						<label for="cust_addr">Employee Address</label> <input type="text"
							class="form-control" name="address" placeholder="1234 Main St"
							required>
						<div class="invalid-feedback">Please enter Employee Address.
						</div>
					</div>

<div class="row">
	<div class="col-md-6">
	<label for="cust_name">Profile Picture</label>
	<div class="input-group">
	<input type="file" class="btn btn-light" name="Image"></div> <br></div>
	<div class="col-md-6"><label for="cust_name">Account No.</label>
							<div class="input-group">
								<input class="input--style-3 form-control" type="number"
									placeholder="account number" name="accno"  required>

							</div>
							<div class="invalid-feedback">Valid Employee account number is
								required.</div></div>
</div>

					

					<hr class="mb-4">


					<input type="submit" class="btn btn-primary btn-lg btn-block"
						value="Confirm">
				</form>
			</div>
		</div>
	</div>

	<br>





	<br>
	<br>

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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>

</body>
</html>
