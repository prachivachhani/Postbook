<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

		<div class="container">
		<div class="row">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Id</th>
			      <th scope="col">Name</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
		 		  <c:forEach items="${user}" var="user">
				    <tr>
						<td><c:out value="${user.myId}"></c:out></td>
						<td><c:out value="${user.name}"></c:out></td>
						<td>
						<form action="/userprofileforadmin">
							<input type="hidden" value="${user.myId}" name="userid"/>
							<button class="btn btn-success">View Profile</button>
						</form>
						</td>
						</tr>
				   </c:forEach>
		 		</tbody>
			 </table>  
		</div>
		</div>


</body>
</html>