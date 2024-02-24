<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">

<title>Select Employee</title>

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
</style>
<!-- Custom styles for this template -->
<link href="pricing.css" rel="stylesheet">
</head>
<body>${list.message }
	<jsp:include page="/common/header.jsp"></jsp:include>


	<br>
	<!-- new template -->
	<div class="container">

		
			
					<div class="card" >
						<!-- <img class="card-img-top" src="img_avatar1.png" alt="Card image">  -->
						<div class="card-body">
							<h4 class="card-title text-center">${ list.eb.emp_name }</h4>
							<div class="container text-center">
								<div class="row mb-4">
									<div class="col-sm">ID</div>
									<div class="col-sm">${ list.eb.empid }</div>
								</div>
								<div class="row mb-4">
									<div class="col-sm">DOB</div>
									<div class="col-sm">${ list.eb.dob}</div>
								</div>
								<div class="row mb-4" >
									<div class="col-sm">ADDRESS</div>
									<div class="col-sm">${ list.eb.address }</div>
								</div>
								<div class="row mb-4">
									<div class="col-sm">PHONE</div>
									<div class="col-sm">${ list.eb.phone }</div>
								</div>
								<div class="row mb-4">
									<div class="col-sm">WAGE</div>
									<div class="col-sm">${ list.eb.wage }</div>
								</div>
								<div class="row mb-4">
									<div class="col-sm">ACC. NO.</div>
									<div class="col-sm">${ list.eb.accno }</div>
								</div>
								<br>
								<div class="row mb-4">
									<div class="col-sm">
									<a type="button" href="paythem.html?empid=${ list.eb.empid }&pid=${ list.eb.pid }"	class="btn btn-sm btn-block btn-primary">Pay</a>
									</div>
									
								</div>
							</div>
						</div>
					
				</div>


	</div>




	<br>
	<br>
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
