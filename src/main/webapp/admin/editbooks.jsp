<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDts"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Add Books</title>
<%@ include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="nav.jsp"%>
	<div class="conatiner">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						
						
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
						BookDts b=dao.getBookbyId(id);
						
						%>
						<form action="../editbooks" method="post">
						<input type="hidden" name="id" value="<%=b.getBookid() %>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp" value="<%=b.getBookname()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedy="emailHelp" vaule="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>
							
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<%if("Active".equals(b.getStatus())) {
									%>
										<option value="active">Active</option>
										<option value="Inactive">Inactive</option>
									
									<%}
									else{%>
										<option value="Inactive">Inactive</option>
										<option value="active">Active</option>
										
									<%}
									%>
									
								</select>
							</div>
							<button type="submit" class="btn-btn-primary"
								style="background-color: #2979ff">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 40px;">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>