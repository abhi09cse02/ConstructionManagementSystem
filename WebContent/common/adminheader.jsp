<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal">Construction Management System</h5>
  <nav class="my-2 my-md-0 mr-md-3">
   <a class="p-2 text-dark" href="admin.html">Dashboard</a>
    <a class="p-2 text-dark" href="projectreport.html">Projects</a>
    <a class="p-2 text-dark" href="employeereport.html">Employees</a>
    <a class="p-2 text-dark" href="contractorsreport.html">Contractors</a>
    
  </nav>
  <a class="btn btn-outline-primary" href="logout.html">
   <c:if test="${username!=null}">
		${username} 
	</c:if>
  Logout</a>
</div>