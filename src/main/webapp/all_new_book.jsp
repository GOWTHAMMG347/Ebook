<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDts"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
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
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */

</style>
</head>
<body>
<%
User u=(User)session.getAttribute("userobj");

%>
<c:if test="${not empty addCart }">
<div id="toast">${addCart }</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
<c:remove var="addCart" scope="session"/>
</c:if>
<%@include file="all_compents/nav.jsp"%>
<div class="container-fluid">
	<div class="row p-3">
	
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
							<a href="cart?bid=<%=b.getBookid() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a> 
							<a
								href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-2">View Details</a> <br>
							<a 
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