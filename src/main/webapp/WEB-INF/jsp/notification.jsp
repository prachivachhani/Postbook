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


</head>
<body>
	<div class="container-fluid">
		<div class="row">


			<!-- col3 starts -->
			<div class="col-md-3 bg-light text-center no-gutters"
				style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">

				<div class="row">
					<div class="col bg-dark text-white display-4 p-3">POSTBOOK</div>
				</div>

				<div class="row">
					<div class="col py-4">
						<img src="${profileImg}" alt="Profile Img"
							class="rounded-circle img-css" height="200px" width="200px">
					</div>
				</div>
				<div class="row">
					<div class="col pb-4 ">
						<b><c:out value="${user.name}"></c:out></b><br>
						<c:out value="${user.description}"></c:out>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<div class="card text-center bg-dark w-50 m-auto text-white">
							<div class="card-body">
								<h4>Posts</h4>
								<h2>
									<i class="fa fa-thumbs-o-up mr-2"
										style="color: white; size: 20px;"></i>
									<c:out value="${numberofposts}"></c:out>
								</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-3 mb-5">
					<div class="col">
						<div class="card text-center bg-dark w-50 m-auto text-white">
							<div class="card-body">
								<h4>Friends</h4>
								<h2>
									<i class="fa fa-users mr-2" style="color: white; size: 20px;"></i>
									<c:out value="${numberoffriends}"></c:out>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- col 3 ends -->


			<div class="col-md-9">
				<!-- col9 navigation bar -->
				<div class="row">
					<nav class="navbar-nav navbar-expand-md navbar-light bg-light"
						style="width:100%; font-size: 20px;">
					<div class="container pt-5 pl-4">
						<button class="navbar-toggler" data-toggle="collapse"
							data-target="#navbarCollapse">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarCollapse">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item"><a href="myprofile"
									class="nav-link text-dark">Home</a></li>
								<li class="nav-item"><a href="createpost"
									class="nav-link text-dark">Create Post</a></li>
								<li class="nav-item"><a href="myfriends"
									class="nav-link text-dark">Friends</a></li>
								<li class="nav-item"><a href="notification" class="nav-link text-dark">Notifications</a>
								</li>
								<li class="nav-item"><a href="updateprofile"
									class="nav-link text-dark">Update Profile</a></li>
								<li class="nav-item"><a href="login"
									class="nav-link text-dark" onclick="FB.logout()">Logout</a></li>

							</ul>
						</div>
					</div>
					</nav>
				</div>
				<!-- col9 navigation div closes -->
				<!-- update profile form -->
				
				<div class="container p-3 m-2">
				    <div class="row pl-5">
				        <div class="col mx-auto bg-light p-2">
			           	  <c:forEach items="${user.notificationString}" var="heading">
								<c:out value="${heading}"></c:out>
						  </c:forEach>
				      </div>
				   </div>
				</div>
				
				
				
			</div>	
		</div>
	</div>

</body>
</html>