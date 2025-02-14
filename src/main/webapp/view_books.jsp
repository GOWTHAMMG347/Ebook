<%@page import="com.entity.BookDts"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_compents/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_compents/nav.jsp"%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDts b = dao.getBookbyId(bid);
	%>
	<div class="container p-5">
		<div class="row p-5">
			<div clas="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhoto()%>"
					style="height: 100px; width: 150px" /><br>
				<h4 class="mt-2">
					Book Name:<span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name:<span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category:<span class="text-success"><%=b.getBookcategory()%></span>
				</h4>
			</div>
			<div class="col-md-6">
				<h2><%=b.getBookname()%></h2>
				<%
				if ("old".equals(b.getBookcategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i>Email:<%=b.getEmail()%></h5>

				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-danger p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Avaliable</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>

				</div>
				<%
				if ("old".equals(b.getBookcategory())) {
				%><div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a> <a href=""
						class="btn btn-danger"><%=b.getPrice() %><i
						class="fa-solid fa-indian-rupee-sign"></i></a>

				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><%=b.getPrice() %><i
						class="fa-solid fa-indian-rupee-sign"></i></a>

				</div>
				<%
				}
				%>

			</div>
			<div></div>
		</div>
	</div>
</body>
</html>