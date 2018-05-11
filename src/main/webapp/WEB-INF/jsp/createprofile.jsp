<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script>

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 text-success mt-3">
				Welcome <c:out value="${user.name}"></c:out> !
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 text-dark mt-3">
				Start by creating your profile page... 
			
			</div>
		</div>
	</div>

	<!--  CREATE PROFILE  -->
	<div class="container py-5">
	    <div class="row">
	        <div class="col-md-5 mx-auto">
                <div class="card border-secondary">
                    <div class="card-header">
                        <h3 class="mb-0 my-2">Create Profile</h3>
                    </div>
                    <div class="card-body">
                        <form class="form" role="form" autocomplete="off" action="/upload" method="post" enctype="multipart/form-data">
			                <div class="form-group error row">
			                    <label class="form-label col-sm-4">Select Image:</label> 
			                    <div class="form-field col-sm-8"><input type="file" name="file"/></div>
			                </div>
			                <div class="form-group error row">
			                    <label class="form-label col-sm-4">Profile Description:</label> 
			                    <div class="form-field col-sm-8"><textarea name="description" rows="5"></textarea></div>
			                </div>
	                        
	                        <div class="form-group">
	                            <button type="submit" class="btn btn-success btn-md float-left">Submit</button>
	                        </div>
	                    </form>
	                </div>
	           </div>
	      </div>
	   </div>
	</div>

</body>
</html>