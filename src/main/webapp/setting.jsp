<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_compents/allcss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
a:hover{
text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_compents/nav.jsp"%>
	<div class="container">
		<h3 class="text-center ml-15">hello pabitra</h3>
		<div class="row p-5">
			<div class="col-md-4">
			<a href="">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-book-open fa-3x"></i>
					</div>
					<h3>Sell Old Book</h3>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4">
			<a href="">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-primary">
					<i class="fa-solid fa-pen-to-square fa-3x"></i>
					</div>
					<h3>Login & Security (Edit Profile)</h3>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4  mt-3">
			<a href="">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-warning">
						<i class="fa-solid fa-location-dot fa-3x"></i>			
					</div>
					<h3>Your Address</h3>
					<p>Track Your Order</p>
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-4  mt-3">
			<a href="">
				<div class="card">
					<div class="card-body text-center">
					<div class="text-danger">
						<i class="fas fa-box-open fa-3x"></i>			
					</div>
					<h3>Help Center</h3>
					<p>Track Your Order</p>
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>
	<div>
	<%@include file="all_compents/footer.jsp" %>
	</div>
</body>
</html>