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

<title>Add Task</title>

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
<body>${list.message}
	<jsp:include page="/common/header.jsp"></jsp:include>



								<div class="container bg-info mt-5" style="width:500px;height:300px;">

									<div class="row " >
										
											<div class="col-md-12 mb-4 mt-4 text-center">
												<h4><b>Add	Task for ${list.pname}</b></h4>
													
											</div>
											<div class="col text-center mt-4">	
													<form action="inserttask.html" class="form-group mt-3">
													<input type="hidden" name="pid" value="${list.pid }">
														<input type="text" class="form-control text-center mb-4"  placeholder="ADD TASK DESCRIPTION" name="taskdesc" required>
												
												

													<input name='pname' type="hidden" value='${list.pname}'>
													
													<a href="redirectthis.html" class="btn btn-danger mr-4">Close</a>


													<input type="submit" class="btn btn-primary ml-4" value='Add'>
													</form>
												</div>
											</div>

									</div>

									<!-- end add task -->
								</div>
								<%-- <div class="col-sm">

									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary btn-sm btn-block"
										data-toggle="modal" data-target="#exampleModalCenter2">
										Add Material</button>

									<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle2"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">

											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel2">Add
														Material for ${projlist.pname}</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form action="addmaterial.html">
														<input type="text" placeholder="ADD MATERIAL NAME"
															name="mname"> <input type="text"
															placeholder="ADD MATERIAL DESCRIPTION" name="mdesc">
														<input type="text" placeholder="ADD MATERIAL UNIT"
															name="unit"> <input type="text"
															placeholder="ADD MATERIAL RATE" name="rate">
												</div>
												<div class="modal-footer">

													<input name='pid' type="hidden" value='${projlist.pid}'>
													<button type="button" class="btn btn-danger"
														data-dismiss="modal">Close</button>


													<input type="submit" class="btn btn-primary" value='Add'>
													</form>
												</div>
											</div>

										</div>
									</div>
								</div>
 --%>
						
						


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
