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
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Show Projects</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
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

.card-columns { @include media-breakpoint-only(lg) { column-count:4;
	
}

.card-columns { @include media-breakpoint-only(xl) { column-count:5;
	
}
}
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">
	<jsp:include page="/common/header.jsp"></jsp:include>
	<div class="container">
		<div class="py-5 text-center">
			<!-- <img class="d-block mx-auto mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
			<h2 class="mb-3">SHOW PROJECT</h2>

			<div class="col-sm order-md-1">

				<!-- <form class="needs-validation" action="" method="POST"> -->
				<div class="row text-center">
					<div class="col-md-4 mb-3">
						<label for="firstName">Project Name</label> <input type="text"
							class="form-control" name="projectname"
							placeholder="Project Name" value="${list.pname}" disabled>
						<div class="invalid-feedback">Valid Project name is
							required.</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="customername">Customer Name</label> <input type="text"
							class="form-control" name="customername"
							placeholder="Customer Name" value="${list.cust_name}" disabled>
						<div class="invalid-feedback">Valid Customer name is
							required.</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="custmob">Customer Mobile</label> <input type="text"
							class="form-control" name="custmob" placeholder="Customer Mobile"
							value="${list.cust_mob}" disabled>
						<div class="invalid-feedback">Valid Customer Mobile is
							required.</div>
					</div>
				</div>


				<hr class="mb-4">


				<div class="mb-3">
					<label for="address">Customer Address</label> <input type="text"
						class="form-control" name="address" placeholder="1234 Main St"
						value="${list.cust_addr}" disabled>
					<div class="invalid-feedback">Please enter Customer Address.
					</div>
				</div>
				<hr class="mb-4">

				<div class="row text-center">
					<div class="col-md-4 mb-3">
						<label for="Budget">Budget</label> <input type="text"
							class="form-control" name="Budget" placeholder="Budget"
							value="${list.budget}" disabled>
						<div class="invalid-feedback">Valid Budget is required.</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="sdate">Start Date</label> <input type="text"
							class="form-control" name="sdate" placeholder="dd/mm/yy"
							value="${list.start}" disabled>
						<div class="invalid-feedback">Valid Start Date is required.
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="edate">End Date</label> <input type="text"
							class="form-control" name="edate" placeholder="dd/mm/yy"
							value="${list.end}" disabled>
						<div class="invalid-feedback">Valid End Date is required.</div>
					</div>
				</div>






				<hr class="mb-4">
				<!-- start collapse -->
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button"
									data-toggle="collapse" data-target="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne">Show
									Tasks</button>
							</h2>
						</div>

						<div id="collapseOne" class="collapse show"
							aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body">
								<!-- content here -->
								<div class="container">

									<div class="row">
										<div class="col-sm-6 bg-success">
											<p>Completed Task</p>
											<c:forEach var="task1" items="${list.tasks1}">
												<c:set var="index1" value="${index1+1 }"></c:set>
												<!-- div tags and required fields -->
												<div class="alert alert-success ">
													<strong>${task1.tname}</strong>
												</div>
											</c:forEach>
										</div>
										<div class="col-sm-6 bg-warning">
											<p>Pending Task</p>
											<c:forEach var="task2" items="${list.tasks2}">
												<c:set var="index1" value="${index1+1 }"></c:set>
												<!-- div tags and required fields -->
												<div class="alert alert-warning ">
													<strong>${task2.tname}</strong>



													<form action="taskcomp.html">

														<input type="hidden" name="tid" value="${task2.tid}">
														<input type="hidden" name="pid" value="${task2.pid}">
														<button type="submit" class="bg-success rounded-circle">
															<i class="far fa-check-circle"></i>
														</button>

													</form>

													<form action="deletetask.html">

														<input type="hidden" name="tid" value="${task2.tid}">
														<input type="hidden" name="pid" value="${task2.pid}">
														<button type="submit" class="bg-danger rounded-circle">
															<i class="far fa-times-circle"></i>
														</button>

													</form>


												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									Show Material</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse"
							aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">
								<!--  content here -->
								<div class="container">

									<div class="row">
										<div class="col-sm bg-success">
											<div class="container">
												<div class="row">
													<div class="col-sm">Items</div>
													<div class="col-sm">Rate</div>
													<div class="col-sm">Unit</div>
												</div>
											</div>
											<c:forEach var="material1" items="${list.material1}">
												<c:set var="index1" value="${index1+1 }"></c:set>
												<!-- div tags and required fields -->
												<div class="alert alert-success ">
													<div class="container">
														<div class="row">
															<div class="col-sm">
																<strong>${material1.mname}</strong>
															</div>
															<div class="col-sm">
																<strong>${material1.rate}</strong>
															</div>
															<div class="col-sm">
																<strong>${material1.unit}</strong>
															</div>
														</div>
													</div>



												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header">
							<h6 class="mb-0">
								<a href="viewemp.html?pid=${list.pid }" class="bg-light ">
									Show Employee</a>
							</h6>
						</div>


					</div>

				</div>
				<!-- end collapse -->
				<div class="container mt-4">
					<div class="row text-center">
						<div class="col-md-4">
						<form action="TaskReport">
						<input type="hidden" name="pid" value="${list.pid}">
							<button type="submit" class="btn btn-primary btn-lg btn-block" >Task Report</button></form>
						</div>
						<div class="col-md-4">
						<form action="MaterialReport">
						<input type="hidden" name="pid" value="${list.pid}">
							<button type="submit" class="btn btn-primary btn-lg btn-block" >Material Report</button></form>
							
						</div>
						<div class="col-md-4">
						<form action="EmployeeReport">
						<input type="hidden" name="pid" value="${list.pid}">
							<button type="submit" class="btn btn-primary btn-lg btn-block" >Employee Report</button></form>
							
						</div>
					</div>
				</div>


				<hr class="mb-4">
				<a class="btn btn-primary btn-lg btn-block" href="project.html">Close</a>
				<!--    </form> -->
			</div>
		</div>

		<br>
	</div>
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
