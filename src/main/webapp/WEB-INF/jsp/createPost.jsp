<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Audio-only Example</title>
	
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	</script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	
	
	<!-- AUDIO FILE LINKS -->
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
				          <li class="nav-item">
				            <a href="myprofile" class="nav-link text-dark">Home</a>
				          </li>
				          <li class="nav-item">
				            <a href="createpost" class="nav-link text-dark">Create Post</a>
				          </li>
				          <li class="nav-item">
				            <a href="myfriends" class="nav-link text-dark">Friends</a>
				          </li>
				          <li class="nav-item">
				            <a href="#" class="nav-link text-dark">Notifications</a>
				          </li>
				          <li class="nav-item">
				            <a href="login" class="nav-link text-dark" onclick="FB.logout()">Logout</a>
				          </li>

				        </ul>
				      </div>
				    </div>
				  </nav>
				</div>


			
				<div class="container py-5">
				    <div class="row">
				        <div class="col-md-6 mx-auto">
			                <div class="card border-secondary">
			                    <div class="card-header">
			                        <h3 class="mb-0 my-2">Create Profile</h3>
			                    </div>
			                    <div class="card-body">
									<form id="audioForm" action="/base64audio" method="post" enctype="multipart/form-data">
						                <div class="form-group error row">
						                    <label class="form-label col-sm-4">Select Image:</label> 
						                    <div class="form-field col-sm-8"><input type="file" name="imagefile"/></div>
						                </div>
						                <div class="form-group error row">
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
													$("#saveAudio").on("click",function(){
														$("#audioForm").submit();
													});
												});
												</script>
						                    	<input id="recording" name="recording" type="hidden">
						                    </div>
						                </div>
				                        <div class="form-group error row">
						                    <label class="form-label col-sm-4">Or write image caption:</label> 
						                    <div class="form-field col-sm-8"><input type="text" name="imagecaption"/></div>
						                </div>
						                <div class="form-group">
				                            <button type="submit" class="btn btn-success btn-md float-left" id="saveAudio">Save</button>
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