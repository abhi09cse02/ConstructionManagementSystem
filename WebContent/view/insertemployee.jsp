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

<title>Insert Employee</title>

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
<script type="text/javascript">
function Add() {
	 alert("employee added!");
	
	}
function Remove() {
	 alert("employee removed!");
	}
</script>
<!-- Custom styles for this template -->
<link href="pricing.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/common/header.jsp"></jsp:include>


	<br>
	<br>
	<br>
	<div class="container">
		<div class="alert alert-primary" role="alert">
			<div class="row">
				<div class="col text-center ">CHECK</div>
				<div class="col text-center">Employee Name</div>
				<div class="col text-center">Employee Id</div>
				<div class="col text-center">Phone</div>
			</div>
		</div>
		
			<div class="alert alert-primary" role="alert">


				<div class="alert alert-primary" role="alert">

					<div class="row">
						<c:forEach var="list" items="${list}">
							<c:set var="index" value="${index+1 }"></c:set>

							<div class="col-md-3 mb-3 text-center ">
								<div class="row">
									<div class="col">
										<form action="empadd.html">
											<input type="hidden" name="pid" value="${list.pid}">
											<input type="hidden" name="empid" value="${list.empid}">
											<input type="submit" onclick=Add() class="btn btn-sm btn-block btn-success"
												value="ADD">
										</form>
									</div>
									<div class="col">
										<form action="empremove.html">
											<input type="hidden" name="pid" value="${list.pid}">
											<input type="hidden" name="empid1" value="${list.empid}">
											<input type="submit" onclick=Remove() class="btn btn-sm btn-block btn-danger"
												value="REMOVE">
										</form>
									</div>
								</div>


							</div>
							<div class="col-md-3 mb-3  text-center">${list.emp_name}</div>
							<div class="col-md-3 mb-3  text-center">${list.empid}</div>
							<div class="col-md-3 mb-3  text-center">${list.phone}
								
							</div>

						</c:forEach>
					</div>
				</div>

			</div>

			<a href="project.html" class="btn btn-lg btn-block btn-primary">ADD EMPLOYEES</a>
		
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
