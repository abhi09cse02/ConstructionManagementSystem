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

<title>Employee</title>

<!-- Bootstrap core CSS -->
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
	<!-- new template -->
	<div class="container">

		<div class="row">

			<c:forEach var="emp" items="${list}">
				<c:set var="index1" value="${index1+1 }"></c:set>

				<div class="col-sm-4 mb-4">
					<div class="card" style="width: 300px;">
						 <img class="card-img-top" src="${emp.photo }" width="150px" height="200px" alt="Card image"> 
						<div class="card-body">
							<input type="hidden" name="empid" value="${ emp.empid }">
							<div class="col text-center">
								<div class="row ">
									<div class="col-sm">NAME</div>
									<div class="col-sm"><b>${ emp.emp_name}</b></div>
								</div>
								<div class="row">
									<div class="col-sm">DOB</div>
									<div class="col-sm"><b>${ emp.dob}</b></div>
								</div>
								<div class="row mb-4">
									<div class="col-sm-6">PHONE</div>
									<div class="col-sm-6"><b>${ emp.phone}</b></div>
								</div>
								<div class="row">
									<div class="col-sm-12">ADDRESS</div>
									<div class="col-sm-12"><b>${ emp.address }</b></div>
								</div>
								
								
								<div class="row">
									<div class="col-sm">
									
									<%-- <form action="uploadpage.html">
											<input type="hidden" name="empid" value="${emp.empid}">
											<input type="submit" class="btn btn-sm btn-block btn-success"
												value="PAY">
										</form> --%>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
			<!-- demo add employee  -->
			
				<div class="card float-left" style="width: 250px; height: 280px;">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal"></h4>
					</div>
					<div class="card-body mt-4 pt-4 text-center">
						<svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
							focusable="false" data-prefix="fas" data-icon="plus"
							class="svg-inline--fa fa-plus fa-w-50" width="50px" height="50px"
							role="img" viewBox="0 0 448 512">
					<path fill="currentColor"
								d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z" /></svg>
						<h5>ADD EMPLOYEE</h5>
						<a type="button" href="newemployee.html"
							class="btn btn-sm btn-block btn-primary">CREATE</a>
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
