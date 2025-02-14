<%@page import="java.util.List"%>
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
<title>Admin:All Books</title>
<%@ include file="allcss.jsp"%>
</head>
<body>
	<%@include file="nav.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../Login.jsp">
	</c:redirect>
	</c:if>
	<h3 class="text-center">Hello Admin</h3>
	<c:if test="${not empty succMsg}">
						<h5 class="text-center text-success">${succMsg}</h5>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger">${failedMsg }</p>
						<c:remove var="failedMsg" scope="session"/>
						</c:if>
	<table class="table">
  <thead class="bg-primary text-white">
    <tr>
    <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
       <th scope="col">Book Category</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <% 
  	BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
  	List<BookDts> list=dao.getAllBooks();
  	for (BookDts b : list){
	%>

 	
    <tr>
      <td><%=b.getBookid() %></td>
      <td><img src="../book/<%=b.getPhoto() %>" style="width: 50px; height: 50px;"></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookcategory() %></td>
      <td><%=b.getStatus() %></td>
      <td>
      <a href="editbooks.jsp?id=<%=b.getBookid() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a>
      <a href="../delete?id=<%=b.getBookid() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a>
      </td>
    </tr>
     <%
 	 }
  	%>
   
  </tbody>
  
</table>
</div>
	<div style="margin-top:300px; ">
		<%@ include file="footer.jsp"%>
		</div>
</body>
</html>