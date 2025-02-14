<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDts"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook: index</title>
<%@include file="all_compents/allcss.jsp"%>
<style type="text/css">
.back-img{
background: url("img/books.jpg");
height: 50vh;
width: 100%;
background-repeat: no-repeat;
background-size: cover;
}
.crd-ho:hover{
background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
<%
User u=(User)session.getAttribute("userobj");

%>
	<%@include file="all_compents/nav.jsp"%>
	<div class="container-fluid back-img">
	<h2 class="text-center text-light">Ebook Management System</h2>
	</div>
	
	<!-- start Recent Book  -->
	
	<div class="container" >
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		<%
		BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
		List<BookDts> list2=dao2.getRecentBooks();
		for(BookDts b:list2){%>
		
				<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<p>
						<%
						if(b.getBookcategory().equals("old"))
						{%>
						Categories:<%=b.getBookcategory() %></p>
							<div class="row">
							
								<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-2">View Details</a> <br> <a
								href="" class="btn btn-danger btn-sm ml-2 mt-2"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
							
						<%}
						else{
						%>
							Categories:<%=b.getBookcategory() %></p>
						<div class="row">
						<%if(u==null)
						{%>
						<a href="Login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%}
						else
						{%>
							<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%}
						%>
							
						 <a
								href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-2">View Details</a> <br> <a
								href="" class="btn btn-danger btn-sm  ml-2 mt-2"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>
						
						
						
					</div>
				</div>
		
		
		
			</div>
			<% 
			}
			%>
			
		</div>
		<div class="text-center mt-1">
		<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- end Recent Book  -->
	<hr>
	<!-- start New Book  -->
	
	<div class="container" >
		<h3 class="text-center">New Book</h3>
		<div class="row">
			
			<%
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			List<BookDts> list=dao.getNewBook();
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
						<%if(u==null)
						{%>
						<a href="Login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%}
						else
						{%>
							<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%}
						%>
							
							 <a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-2">View Details</a> <br>
							  <a href="" class="btn btn-danger btn-sm ml-2  mt-2"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
				<%
			}
			
			%>
				
			
			
			
		</div>
		<div class="text-center mt-1">
		<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- end New Book  -->
	<hr>
	<!-- start Old Book  -->
	
	<div class="container" >
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
		BookDAOImpl dao3=new BookDAOImpl(DBConnect.getConn());
		List<BookDts> list3=dao3.getOldBooks();
		for(BookDts b:list3){%>
		
				<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto() %>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<p><%=b.getBookcategory() %></p>
						<div class="row">
							 <a
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
		<div class="text-center mt-1">
		<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- end Old Book  -->
	<hr>
	<%@include file="all_compents/footer.jsp" %>
</body>
</html>