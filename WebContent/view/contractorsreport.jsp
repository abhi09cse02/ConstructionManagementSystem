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

<title>Contractors Report</title>

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
	<jsp:include page="/common/adminheader.jsp"></jsp:include>


	<br>
	<br>
	<br>
	<div class="container">
		<div class="alert alert-dark" role="alert">
			<div class="row text-center">
				<div class="col-md-2">Contractors Id</div>
				<div class="col-md-2">Full Name</div>
				<div class="col-md-3">Email</div>
				<div class="col-md-2">User Name</div>
				<div class="col-md-2">Mobile</div>
			

			</div>



		</div>
		<c:forEach var="projlist" items="${list}">
				<c:set var="index" value="${index+1 }"></c:set>

		<div class="alert alert-dark" role="alert">
			<div class="row text-center">
				<div class="col-md-2">${projlist.conid}</div>
				<div class="col-md-2">${projlist.fullname}</div>
				<div class="col-md-3">${projlist.email}</div>
				<div class="col-md-2">${projlist.username}</div>
				<div class="col-md-2">${projlist.mobile}</div>
			

			</div>


		</div>
		</c:forEach>
		 <div>  
		<form action="ReportContractor">
			<button type="submit" class="btn btn-lg btn-block btn-primary">Print</button>
		</form>
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
