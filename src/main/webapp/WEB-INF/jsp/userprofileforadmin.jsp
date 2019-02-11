<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>

<script>
 function play(){
	 var audio = document.getElementById("imageaudio");
	 audio.play();
     console.log(audio);

 }
 </script>
<style>

</style>
												
<title>Postbook profile page</title>
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
						<img src="${user.profilepicURI}" alt="Profile Img"
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
								<li class="nav-item"><a href="admin"
									class="nav-link text-dark">Home</a></li>
								<li class="nav-item"><a href="login"
									class="nav-link text-dark" onclick="FB.logout()">Logout</a></li>
							</ul>
						</div>
					</div>
					</nav>
				</div>
				<!-- col9 navigation div closes -->
				<!-- Show posts div -->
				<div class="container mb-4 mt-4">
					<div class="row">
						<c:forEach items="${posts}" var="posts">
							<div class="col-auto mb-3">
								<div class="card bg-light" style="width: 18rem;">
									<div class="card-body">
										<div class="card-text">
											<input type="hidden" value="${posts.postId}" id="card_postid" />

											<a href="#modal${posts.postId} " onclick="showmodal(${posts.postId})" class="imagemodal"
												id="image${posts.postId}" data-toggle="modal"> 
												<img id="imagesource${posts.postId} " class="card-img-top img-responsive" src="${posts.imageURI}"
												alt="Card image cap"> 
												<audio id="audiosource${posts.postId} " src="${posts.audioURI}"
													type="audio/webm"></audio>
											</a>

											<div class="modal fade" id="modal${posts.postId}"
												tabindex="-1" role="dialog"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog modal-md">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">
															Image preview
															</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<img src="" id="imagepreview${posts.postId}"
																class="imagepreview mx-auto modal-body"
																style="max-height: 100%; max-width: 100%">
															<audio src="" id="audiopreview${posts.postId}"
																class="audiopreview" type="audio/webm" autoplay>
															</audio>
														</div>

														<div class="modal-footer">
															<div>
																<div id="commentform">
																	<form class="mr-auto">
																		<label class="mt-2">Leave a comment : </label> 
																		<input
																			name="post_id" value="${posts.postId}" type="hidden"
																			id="model_postid"> <input
																			name="inputcomment${posts.postId}" type="text"
																			id="inputcomment${posts.postId}" size="30" value="">
																		<button type="button"
																			onclick="commentclick(${posts.postId})"
																			class="bg-success mt-2 p-2">Comment</button>
																	</form>
																</div>
																<div class="list-comments mt-2"
																	id="listcomments${posts.postId}"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>



										<script>
										
											function showmodal(postId)
											{
												var post_id1 = document.getElementById("card_postid").value;
													$('#imagepreview'+postId).attr('src', $('#image'+postId).find('img').attr('src'));
													$('#audiopreview'+postId).attr('src', $('#image'+postId).find('audio').attr('src'));
													$('#modal'+postId).modal('show');  
											
											}
										</script>

									</div>
									<div class="card-footer">
										<c:out value="${posts.imagecaption}"></c:out>
									</div>
								</div>
							</div>
					
					</c:forEach>
					<!-- Model Div -->

					</div>

					<!-- Model div closes -->
				</div>
				<!-- closes row div -->
			</div>
			<!-- closes container div -->
		</div>
	</div>



	<script type="text/javascript">
		function commentclick(postid)
		{
			var $text = document.getElementById('inputcomment'+postid).value;//$('#inputcomment'+postid).value;
			var	response;
			response = $text;	
			$.ajax({
					url:"/saveComment",
					type:"POST",
					data:{"inputcomment": $text, "post_id": postid},
					
					success:function(data){
						
						$('#listcomments'+postid).append('<div class="bg-light container mb-2 p-2">'+ 
														'<div class="row pl-4">	<b>' + data['user'] + '</b> </div>'+
														'<div class="row pl-4">' + data['comment']+ 
															'</div><div class="row text-muted small pl-4">'+ data['date']+
															'</div>'+
														'</div>');
						
							
						 
						$('#inputcomment'+postid).value="";
					}
					});
			return false;
		}
	</script>
</body>
</html>