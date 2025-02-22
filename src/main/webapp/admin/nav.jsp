<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class="container-fluid" style="height:10px;background-color: #303f9f; "></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i>Ebooks
			</h3>
		</div>
		
		<div class="col md-3">
		<c:if test="${not empty userobj}">
		<a  class="btn btn-success class="text-white"><i class="fas fa-user"></i>${userobj.name}</a>
				<a  data-toggle="modal" data-target="#exampleModalLong" class="btn btn-primary text-white class="btn btn-success"><i class="fas fa-sign-in-alt"></i>Logout</a>
		
		</c:if>
		<c:if test="${ empty userobj}">
			<a href="../Login.jsp" class="btn btn-success">Login</a> <a href="../register.jsp"
				class="btn btn-primary text-white">Register</a>
		</c:if>
		</div>
	</div>
</div>
<!-- logout model -->

<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="text-center">
       <h4>Do You Want Logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary">Logout</a>
        </div>
        
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
<!-- logout model -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i>
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">home
					<span class="sr-only">(current)</span>
			</a></li>
			
		</form>
	</div>
	</nav>