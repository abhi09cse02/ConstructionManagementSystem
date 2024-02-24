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

<title>View Employee</title>

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


	
		<div class="conatiner ml-3">
			<div class="row text-center">

				<c:forEach var="emp" items="${list.emp.emp1}">
					<c:set var="index1" value="${index1+1 }"></c:set>

				
							<div class="col-sm-2 mb-3">
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
									
										<a href="payemp.html?empid=${emp.empid}&pid=${emp.pid}">
											<button  class="btn btn-sm btn-block btn-success">PAY</button></a>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>

					

				</c:forEach>





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
