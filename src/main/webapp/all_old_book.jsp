<%@page import="com.entity.BookDts"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Book </title>
<%@include file="all_compents/allcss.jsp"%>
<style type="text/css">
.crd-ho:hover{
background-color: #fcf7f7;
}
</style>
</head>
<body>
<%@include file="all_compents/nav.jsp"%>
<div class="container-fluid">
	<div class="row p-3">
	
	<%
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			List<BookDts> list=dao.getAllNewBook();
			for (BookDts b:list){
				%>
				<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories<%=b.getBookcategory() %></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a> <a
								href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-2">View Details</a> <br> <a
								href="" class="btn btn-danger btn-sm ml-2  mt-2"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
				<%
			}
			
			%>
				
					
	</div>
</div>
</body>
</html>