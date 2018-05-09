package com.example.demo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;


@Controller
@Component
public class profilecontroller 
{
	@Autowired
	UserRepository userRepo;
		
	@Autowired
	PostRepository postRepo;

	@Autowired
	FriendsRepository friendRepo;

	@Autowired
	ConnectToS3 s3object;
	
	private long numberoffriends;
	private long numberofposts;
	
	@PostMapping(value="/upload")
	public ModelAndView uploadImgToDb(@RequestParam("file") MultipartFile image, @RequestParam("description") String description, HttpServletRequest req) throws IOException
	{
		Long id = (Long) req.getSession().getAttribute("user_id");
			
		User user = userRepo.findByMyId(id);
		
		System.out.println("IN PROFILE CONTROLLER : USER_ID" + id);
		System.out.println("IN PROFILE CONTROLLER : USER_NAME" + user.getName());
		
		user.setDescription(description);
		user.setProfilepicURI(user.getMyId() + "profilepic");
		ModelAndView profilePage = new ModelAndView();
		String fileURI = s3object.upload(user.getProfilepicURI(), image.getInputStream());
		
		user.setProfilepicURI(fileURI);
		System.out.println("########################### in myprofile getmapping ###############");

		numberoffriends = friendRepo.countByMe(user);
		System.out.println("my friends count : " + numberoffriends);
		profilePage.addObject("numberoffriends", numberoffriends);

		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		profilePage.addObject("numberofposts", numberofposts);
		
		profilePage.addObject("profileImg", user.getProfilepicURI());
		profilePage.addObject("user", user);
		profilePage.setViewName("redirect:/myprofile");
		return profilePage;

	}
}
