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

<title>Add Material</title>

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
	
</script>
<!-- Custom styles for this template -->
<link href="pricing.css" rel="stylesheet">
</head>
<body>
${list.message}
	<jsp:include page="/common/header.jsp"></jsp:include>



	<div class="container bg-info mt-5"
		style="width: 500px; height: 500px;">

		<div class="row ">

			<div class="col-md-12 mb-4 mt-4 text-center">
				<h4>
					<b>Add Material for ${list.pname}</b>
				</h4>

			</div>
			<div class="col-md-12 ml-4 mt-4 text-center">
				<form action="insertmaterial.html" class="form-group mt-3 ml-4 pl-5 text-center" >
					<input type="text" placeholder="ADD MATERIAL NAME" class="col-md-6 ml-4 m-3 text-center form-control" name="mname" required>
					<input type="text" placeholder="ADD MATERIAL DESC.." class="col-md-6 ml-4 m-3 text-center form-control" name="mdesc" required>
					<input type="number" class="col-md-6 ml-4 m-3 text-center form-control" min="1"	placeholder="ADD MATERIAL UNITS" name="unit" required> 
					<input class="col-md-6 ml-4 m-3 text-center form-control"	type="number" min="1" placeholder="ADD MATERIAL RATE" name="rate" required>
			</div>
			<div class="col-md-12 text-center mt-4 pr-4 ">
				<input name='pid' type="hidden" value='${list.pid}'> 
				<input name='pname' type="hidden" value='${list.pname}'> 
				<a	href="redirectthis.html" class="btn btn-danger mr-4">Close</a> 
					<input	type="submit" class="btn btn-primary ml-4" value='Add'>
				</form>
			</div>
		</div>

	</div>

	<!-- end add task -->
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
