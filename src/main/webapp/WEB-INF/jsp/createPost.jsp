<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Audio-only Example</title>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<link href="https://vjs.zencdn.net/6.8.0/video-js.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/videojs-record/2.2.0/css/videojs.record.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/6.7.2/video.min.js"></script>
 	<script src = "https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<link href="https://vjs.zencdn.net/6.6.3/video-js.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/videojs-record/2.1.0/css/videojs.record.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/6.7.2/video.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/RecordRTC/5.4.6/RecordRTC.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/adapterjs/0.15.0/adapter.min.js"></script>
	<script src="https://collab-project.github.io/videojs-record/dist/wavesurfer.min.js"></script>
	<script src="https://collab-project.github.io/videojs-record/dist/wavesurfer.microphone.min.js"></script>
	<script src="https://collab-project.github.io/videojs-record/dist/videojs.wavesurfer.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-record/2.1.2/videojs.record.min.js"></script>

  <style>
  /* change player background color */
  #myAudio {
      background-color: #9FD6BA;
  }
  /* change player background color */
  #myImage {
      background-color: #efc3e6;
  }
  </style>


</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 bg-light text-center no-gutters" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">

				<div class="row">
					<div class="col bg-dark text-white display-4 p-3"> POSTBOOK </div>
				</div>

				<div class="row">
					<div class="col py-4">
						<img src="${profileImg}" alt="Profile Img" class="rounded-circle img-css" height="200px" width="200px">		
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
									<i class="fa fa-thumbs-o-up mr-2" style="color:white;size: 20px;"></i><c:out value="${numberofposts}"></c:out>
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
									<i class="fa fa-users mr-2" style="color:white;size: 20px;"></i><c:out value="${numberoffriends}"></c:out>
								</h2>
							</div>
						</div>
					</div>
				</div>				
			</div>
			<div class="col-md-9">
				<div class="row">
				  <nav class="navbar-nav navbar-expand-md navbar-light bg-light" style="width:100%; font-size: 20px;">
				    <div class="container pt-5 pl-4">
				      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
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


			
				<div class="container py-5">
				    <div class="row">
				        <div class="col mx-auto">
			                <div class="card border-secondary w-75 mx-auto">
			                    <div class="card-header">
			                        <h3 class="mb-0 my-2">Create Post</h3>
			                    </div>
			                    <div class="card-body">
									<form id="audioForm" action="/base64audio" method="post" enctype="multipart/form-data">
						                <div class="form-group row">
						                    <label class="form-label col-sm-4">Click to upload image:</label> 
						                    <div class="form-field col-sm-8">
 						                    <video id="myImage" class="video-js vjs-default-skin"></video>

												<script>
												var player1 = videojs("myImage", {
												    controls: true,
												    width: 250,
												    height: 125,
												    controlBar: {
												        volumePanel: false,
												        fullscreenToggle: false
												    },
												    plugins: {
												        record: {
												            image: true,
												            debug: true
												        }
												    }
												}, function(){
												    // print version information at startup
												    videojs.log('Using video.js', videojs.VERSION,
												        'with videojs-record', videojs.getPluginVersion('record'));
												});
												
												// error handling
												player1.on('deviceError', function() {
												    console.warn('device error:', player1.deviceErrorCode);
												});
												
												// snapshot is available
												player1.on('finishRecord', function() {
												    // the blob object contains the image data that
												    // can be downloaded by the user, stored on server etc.
												    console.log('snapshot ready: ', player1.recordedData);
												    $("#imagefile").val(player1.recordedData);
												});
												</script>
							                    <input type="hidden" name="imagefile" id="imagefile" />
		<!-- 								<input type="file" name="imagefile" id="imagefile" /> -->
 										
 						                    </div>
						                </div>
						                <div class="form-group row">
						                    <label class="form-label col-sm-4">Click to upload audio:</label> 
						                    <div class="form-field col-sm-8">
						                    	<audio id="myAudio" class="video-js vjs-default-skin"></audio>
												<script>
												var player = videojs("myAudio", {
												    controls: true,
												    width: 250,
												    height: 125,
												    plugins: {
												        wavesurfer: {
												            src: "live",
												            waveColor: "#36393b",
												            progressColor: "black",
												            debug: true,
												            cursorWidth: 1,
												            msDisplayMax: 20,
												            hideScrollbar: true
												        },
												        record: {
												            audio: true,
												            video: false,
												            maxLength: 20,
												            debug: true
												        }
												    }
												}, function(){
												    // print version information at startup
												    videojs.log('Using video.js', videojs.VERSION,
												        'with videojs-record', videojs.getPluginVersion('record'),
												        '+ videojs-wavesurfer', videojs.getPluginVersion('wavesurfer'),
												        'and recordrtc', RecordRTC.version);
												});
												
												// error handling
												player.on('deviceError', function() {
												    console.log('device error:', player.deviceErrorCode);
												});
												
												// user clicked the record button and started recording
												player.on('startRecord', function() {
												    console.log('started recording!');
												});
												
												// user completed recording and stream is available
												player.on('finishRecord', function() {
												    // the blob object contains the recorded data that
												    // can be downloaded by the user, stored on server etc.
												    console.log('finished recording: ', player.recordedData);
												    
												    var reader = new FileReader();
												    var base64data;
												    reader.readAsDataURL(player.recordedData);
												    reader.onloadend = function()
												    {
												    	base64data = reader.result;
												    	console.log(base64data);
												    	
												    	$("#recording").val(base64data);
												    }
												});
												
												$(document).ready(function(){
													$("#savePost").on("click",function(){
														
														$("#audioForm").submit();
													});
												});
												</script>
						                    	<input id="recording" name="recording" type="hidden">
						                    </div>
						                </div>
				                        <div class="form-group row">
						                    <label class="form-label col-sm-4">Or write image caption:</label> 
						                    <div class="form-field col-sm-8"><input type="text" name="imagecaption"/></div>
						                </div>
						                <div class="form-group">
				                            <button type="submit" class="btn btn-success btn-md float-left" id="savePost">Save</button>
				                        </div>
				                    </form>
				                </div>
				           </div>
				      </div>
				   </div>
				</div>




			</div>		
		</div>
	</div>




</body>
</html>