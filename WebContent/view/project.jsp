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

<title>Projectss Page</title>

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
</style>
<!-- Custom styles for this template -->
<link href="pricing.css" rel="stylesheet">
</head>
<body>
${list.message }
	<jsp:include page="/common/header.jsp"></jsp:include>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<div class="row  text-center">
			<c:forEach var="projlist" items="${list.emp}">
				<c:set var="index" value="${index+1 }"></c:set>

				<div class="col-md-4 mb-4">
					<div class="card">
						<div class="card-header">
							<h4 class="my-0 font-weight-normal">${projlist.pname}</h4>
						</div>
						<div class="card-body">
						<div class="row ">
									<div class="col-sm-6">
										<h6 class="card-title pricing-card-title">Budget</h6>
							<h6 class="card-title pricing-card-title">${projlist.budget}</h6>
									</div>
									<div class="col-sm-6">
									
							<h6 class="card-title pricing-card-title">Balance</h6>
							<h6 class="card-title pricing-card-title">${projlist.balance}</h6>
									</div>
									</div>
							
							<div class="container">
								<div class="row">
									<div class="col-sm">
										<b><h6>Customer Name</h6></b>
									</div>
									<div class="col-sm">
										<b><h6>${projlist.cust_name}</h6></b>
									</div>
								</div>
							</div>
							<br>
							<div class="container">
								<div class="row mb-4">
									<div class="col-sm-6">
										<p>Start Date:</p>
										<b>${projlist.start}</b>
									</div>
									<div class="col-sm-6">
										<p>End Date:</p>
										<b>${projlist.end}</b>
									</div>
									<div class="col-sm-6 mt-4">
										<a href="addtask.html?pid=${projlist.pid}&pname=${projlist.pname}"> <input
											type="submit" value="ADD TASK"
											class="btn btn-sm btn-block btn-primary">
										</a>
									</div>
									<div class="col-sm-6 mt-4">
										<a href="addmaterial.html?pid=${projlist.pid}&pname=${projlist.pname}"> <input
											type="submit" value="ADD MATERIAL"
											class="btn btn-sm btn-block btn-primary">
										</a>
									</div>
								</div>


							</div>

							<!-- add employee,show more, delete -->
							<div class="form-group  text-center">
								<form class="mb-3" action="showmoreproject.html">

									<input type="hidden" name="pid" value="${projlist.pid}">

									<input type="submit" value="Show More"
										class="btn btn-sm btn-block btn-primary">

								</form>
								<form class="mb-3" action="insertemployee.html">

									<input type="hidden" name="pid" value="${projlist.pid}">

									<input type="submit" value="ADD EMPLOYEE"
										class="btn btn-sm btn-block btn-primary">

								</form>

								<a href="deleteproject.html?pid=${projlist.pid}"> <input
									type="submit" value="Delete"
									class="btn btn-sm btn-block btn-danger">
								</a>

							</div>

						</div>
					</div>


				</div>
			</c:forEach>

			<div class="card float-left " style="width: 360px;">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal"></h4>
				</div>
				<div class="card-body text-center">
					<svg xmlns="http://www.w3.org/2000/svg" class="mb-5"
						aria-hidden="true" focusable="false" data-prefix="fas"
						data-icon="plus" class="svg-inline--fa fa-plus fa-w-50"
						width="100px" height="100px" role="img" viewBox="0 0 448 512">
					<path fill="currentColor"
							d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" /></svg>
					<h4>ADD PROJECT</h4>
					<br> <br> <a type="button" href="addproject.html"
						class="btn btn-lg btn-block btn-primary">CREATE</a>
				</div>
				<div class="card-header">
					<h4 class="my-0 font-weight-normal"></h4>
				</div>
			</div>

		</div>

	</div>


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
