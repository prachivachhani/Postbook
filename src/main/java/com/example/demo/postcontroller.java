package com.example.demo;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Base64.Decoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class postcontroller {

	@Autowired
	private ApplicationEventPublisher applicationEventPublisher;
	 
	@Autowired
	ConnectToS3 s3object;
	
	@Autowired
	PostRepository postRepo;

	@Autowired
	FriendsRepository friendRepo;

	@Autowired
	UserRepository userRepo;
	
	private long numberoffriends;
	private long numberofposts;
	
	@GetMapping(value="/createpost")
	public ModelAndView createPost(HttpServletRequest req)
	{
		ModelAndView postPage = new ModelAndView();
		Long id = (Long) req.getSession().getAttribute("user_id");
		User user = userRepo.findByMyId(id);
		
		System.out.println(user.getProfilepicURI());
		System.out.println("########################### in postcontroller getmapping createPost ###############");
		
		numberoffriends = friendRepo.countByMe(user);
		System.out.println("my friends count : " + numberoffriends);
		postPage.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		postPage.addObject("numberofposts", numberofposts);
		
		postPage.addObject("posts", postRepo.findAllByMe(user));
		postPage.addObject("profileImg", user.getProfilepicURI());
		postPage.addObject("numberoffriends", numberoffriends);
		postPage.addObject("numberofposts", numberofposts);
		postPage.addObject("user", user);
		postPage.setViewName("createPost");
		return postPage;
	}
	
	
	@PostMapping(value="/base64audio")
	public ModelAndView saveAudio(HttpServletRequest req, @RequestParam("imagefile") String imagefile, @RequestParam("recording") String recording,
			@RequestParam("imagecaption") String imagecaption) throws Exception
	{
		Long id = (Long) req.getSession().getAttribute("user_id");
		User user = userRepo.findByMyId(id);
		
		System.out.println("############################# in post controller ######################");
		System.out.println("USER_ID " + id);
		System.out.println("USER_NAME " + user.getName());

		Post post = new Post();

		post.setMe(user);
		user.addPost(post);
		postRepo.save(post);

		PostEvent postEvent = new PostEvent(this, id.toString());
		applicationEventPublisher.publishEvent(postEvent);
		
		
		Long postId = post.getPostId();
		System.out.println("IN POST CONTROLLER : POST_ID " + postId);


		post.setAudioURI(postId.toString() + "audio");
		post.setImageURI(postId.toString() + "image");
		post.setImagecaption(imagecaption);
		
		ModelAndView showPost = new ModelAndView();
		System.out.println("recording audio ...");
		
		Decoder decoder = Base64.getDecoder();
		
		System.out.println("recording...." + recording);
		
		byte [] decoderByte1 = decoder.decode(recording.split(",")[1]);
		byte [] decoderByte2 = decoder.decode(imagefile.split(",")[1]);
		
		FileOutputStream fos1;
		FileOutputStream fos2;
		
		try {
			fos1 = new FileOutputStream("PostAudio.webm");
			fos2 = new FileOutputStream("PostImage.jpg");
			fos1.write(decoderByte1);
			fos2.write(decoderByte2);
			fos1.close();
			fos2.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		
		System.out.println(".....post controller\nAUDIO FILE NAME : "+ post.getAudioURI());
		System.out.println(".....post controller\nIMAGE FILE NAME : "+ post.getImageURI());
		System.out.println(".....post controller\nIMAGE FILE CAPTION : "+ post.getImagecaption());
		
		String audioURI = s3object.upload(post.getAudioURI() + ".webm", new FileInputStream("PostAudio.webm"));
		String imageURI = s3object.upload(post.getImageURI() + ".jpg", new FileInputStream("PostImage.jpg"));
		
		post.setImageURI(imageURI);	
		post.setAudioURI(audioURI);

		numberoffriends = friendRepo.countByMe(user);
		System.out.println("my friends count : " + numberoffriends);
		showPost.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		showPost.addObject("numberofposts", numberofposts);
		
		showPost.addObject("posts", postRepo.findAllByMe(user));
		showPost.addObject("profileImg", user.getProfilepicURI());
		showPost.addObject("numberoffriends", numberoffriends);
		showPost.addObject("numberofposts", numberofposts);
		showPost.addObject("user", user);
		
		/*
		showPost.addObject("posts", postRepo.findAllByMe(user));
		showPost.addObject("imageURI", imageURI);
		showPost.addObject("audioURI", audioURI);
		*/
		
		showPost.setViewName("redirect:/myprofile");
		return showPost;
	}
}
