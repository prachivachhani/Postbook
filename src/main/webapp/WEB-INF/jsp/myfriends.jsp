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

<script>

// This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) 
  {
  	  	console.log('statusChangeCallback');
    	console.log(response);
    	// The response object is returned with a status field that lets the
    	// app know the current login status of the person.
    	// Full docs on the response object can be found in the documentation
    	// for FB.getLoginStatus().
    	if (response.status === 'connected') 
    	{
    		// Logged into your app and Facebook.
      		testAPI();
    	} 
    	else 
    	{
      	// The person is not logged into your app or we are unable to tell.
      	document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    	}
  }

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() 
  {
    	FB.getLoginStatus(function(response) 
    	{
	      	statusChangeCallback(response);
  		});
  }

  window.fbAsyncInit = function() 
  {
    	FB.init({
      	appId      : 567813833596853,
      	cookie     : true,  // enable cookies to allow the server to access 
                            // the session
    	xfbml      : true,  // parse social plugins on this page
    	version    : 'v2.12' // use graph api version 2.8
    	});

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    	FB.getLoginStatus(function(response) 
    	{
		      statusChangeCallback(response);
    	});

  };

  // Load the SDK asynchronously
  (function(d, s, id) 
	{
    	var js, fjs = d.getElementsByTagName(s)[0];
    	if (d.getElementById(id)) return;
    	js = d.createElement(s); js.id = id;
    	js.src = "https://connect.facebook.net/en_US/sdk.js";
    	fjs.parentNode.insertBefore(js, fjs);
  	}(document, 'script', 'facebook-jssdk')
  );

	// Here we run a very simple test of the Graph API after login is
  	// successful.  See statusChangeCallback() for when this call is made.
  	 
  	function testAPI() 
	{
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me?fields=id,name,email', function(response) 
	    {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	 	  	$('[name="myId"]').val(response.id);
	    	$('[name="myName"]').val(response.name);
	    	$('[name="myEmail"]').val(response.email);

	    	
		    FB.api('/me/friends', function(response) 
		    {
		            console.log(response);
					//Appends the data
					response.data.forEach(function(ele,i)
					{
						$("#tableBody").append(
						'<tr>'	+
						
						'<th scope="row">' + i + '</th>' +	'<td>' + ele.name + '</td>' +	'<td>' + ele.id + '</td>'  	
						
						+'</tr>'
						);
					
						//$('[name="myFriends"]').val(JSON.stringify(response.data));	
						
					var earlierval = $('[name="myFriends"]').val();
					$('[name="myFriends"]').val(earlierval + ele.id + "/" + ele.name + "/");
					});
					$("#getUserData").submit();
		    });

	    });
  	}
	
  	FB.logout(function(response) {
    	  // user is now logged out
    	});
</script>
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
				<!-- Show posts div -->
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
 						  <c:forEach items="${friends}" var="friends">
						    <tr>
								<td><c:out value="${friends.myId}"></c:out></td>
								<td><c:out value="${friends.name}"></c:out></td>
								<td>
								<form action="/friendsprofile">
								<input type="hidden" value="${friends.myId}" name="friendsid"/>
								<button class="btn btn-success">View Profile</button>
								</form>
								</td>
						    </tr>
					      </c:forEach>
 
 						
 						  </tbody>
					  </table>  
				</div>
				</div>
			</div>	
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>