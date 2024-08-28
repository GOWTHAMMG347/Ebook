<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All Orders</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
	<%@include file="nav.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../Login.jsp">
	</c:redirect>
	</c:if>
	<h3 class="text-center">Hello Admin</h3>
	
	<table class="table">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
       <th scope="col">Phoneno</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Payment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
       <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
       <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
       <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">4</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
       <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
       <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">5</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
       <td>Otto</td>
      <td>@mdo</td>
    </tr>
  </tbody>
 
</table>
 <div style="margin-top:300px;">
		<%@ include file="footer.jsp"%>
		</div>
</body>
</html>