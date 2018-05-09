<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

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
</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->
<div class="container">
	<div class="row">
		<div class="col">
			<fb:login-button data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false" scope="public_profile,email,user_friends" onlogin="checkLoginState();">
			</fb:login-button>
		</div>
	</div>
</div>



<div id="status">
</div>

<form id="getUserData" method = "POST" action="getUserData">
<input type="hidden" name= "myId"/>
<input type="hidden" name= "myName"/>
<input type="hidden" name= "myEmail"/>
<input type="hidden" name= "myFriends"/>
</form>

</body>
</html>