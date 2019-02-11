package com.example.demo;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Controller
public class logincontroller 
{
	
	@Value("#{environment.AWS_ACCESSKEY}")
	String accesskey;
	
	@Value("#{environment.AWS_SECRETKEY}")
	String secretkey;

	@Autowired 
	private FriendsRepository friendRepo;
	
	@Autowired 
	private PostRepository postRepo;
	
	@Autowired
	private UserRepository userRepo;

	private List<User> showingfriends = new ArrayList<>();

	private long numberoffriends;
	private long numberofposts;
	
	@GetMapping(value="/login")
	public ModelAndView ModelView()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@PostMapping(value="/getUserData")
	public ModelAndView saveUser(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName") String myName,
			@RequestParam(name="myEmail") String myEmail,
			@RequestParam(name="myFriends") String myFriends,
			HttpServletRequest req
			)
	{
		req.getSession().setAttribute("user_id", Long.parseLong(myId));
		Long id = (Long) req.getSession().getAttribute("user_id");
		User testuser = userRepo.findByMyId(id);
		//System.out.println("################ in login controller ###################");
		
		System.out.println(myId + myName + myEmail + myFriends);
		String[] splitted = myFriends.split("/");
		
		for(int i = 0 ; i<splitted.length ; i++)
		{
			System.out.println(i + " : " + splitted[i]);
		}
		
		if(testuser==null) {
			User u = new User();
			
			u.setMyId(Long.parseLong(myId));
			u.setName(myName);
			u.setEmail(myEmail);
			for(int i = 0 ; i<splitted.length ; i=i+2)
			{
				System.out.println(i + " : " + splitted[i]);
				Friends f = new Friends();
			    f.setMe(u);
				u.addFriends(f);
				f.setFriendId(Long.parseLong(splitted[i]));

				userRepo.save(u);
			}
			return new ModelAndView ("redirect:/createprofile");
		}
		else {
			return new ModelAndView ("redirect:/myprofile");
			
		}
	}
	
	@GetMapping(value="/myfriends")
	public ModelAndView getFriendList(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView(); 

		try {
					Long id = (Long) req.getSession().getAttribute("user_id");
					System.out.println(id);

					User user = userRepo.findByMyId(id);
					System.out.println(user.getEmail());

					List<Friends> friends = friendRepo.findByMe(user);
					
					for(int i=0; i < friends.size(); i++)
					{
						if(userRepo.existsByMyId(friends.get(i).getFriendId()))
						{
							User userfriend = new User();
							userfriend = userRepo.findByMyId(friends.get(i).getFriendId());
							System.out.println(userfriend.getName());
							showingfriends.add(userfriend);
						}
						System.out.println(" i+1 loop"+friends.get(i).getFriendId());
					}

					numberoffriends = friendRepo.countByMe(user);
					System.out.println("my friends count : " + numberoffriends);
					mv.addObject("numberoffriends", numberoffriends);
				
					numberofposts = postRepo.countByMe(user);
					System.out.println("my posts count : " + numberofposts);
					mv.addObject("numberofposts", numberofposts);
					
					mv.addObject("posts", postRepo.findAllByMe(user));
					mv.addObject("profileImg", user.getProfilepicURI());
					mv.addObject("user", user);
					mv.setViewName("myprofile");
					
					mv.addObject("friends", showingfriends);
					mv.setViewName("myfriends");
		}
		catch(Exception e){
			mv.addObject("error", "No Friends yet");
			mv.setViewName("nofriendspage");
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@GetMapping(value="/myprofile")
	public ModelAndView viewFriends(HttpServletRequest req)
	{		
		ModelAndView profilePage = new ModelAndView();
		Long id = (Long) req.getSession().getAttribute("user_id");
		User user = userRepo.findByMyId(id);
		
		System.out.println(user.getProfilepicURI());
		//System.out.println("########################### in myprofile getmapping ###############");

		numberoffriends = friendRepo.countByMe(user);
		System.out.println("my friends count : " + numberoffriends);
		profilePage.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		profilePage.addObject("numberofposts", numberofposts);
		
		profilePage.addObject("posts", postRepo.findAllByMe(user));
		profilePage.addObject("profileImg", user.getProfilepicURI());
		profilePage.addObject("user", user);
		profilePage.setViewName("myprofile");
		return profilePage;

	}
	
	@GetMapping(value="/createprofile")
	public ModelAndView createProfilePage(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView();
		Long id = (Long) req.getSession().getAttribute("user_id");
		User user = userRepo.findByMyId(id);
		
		mv.addObject("user", user);
		mv.setViewName("createprofile");
		return mv;
	}
	
	@GetMapping(value="/updateprofile")
	public ModelAndView updateprofile(HttpServletRequest req)
	{		
		ModelAndView mv = new ModelAndView();
		Long id = (Long) req.getSession().getAttribute("user_id");
		User user = userRepo.findByMyId(id);
		
		System.out.println(user.getProfilepicURI());
		//System.out.println("########################### in myprofile getmapping ###############");

		numberoffriends = friendRepo.countByMe(user);
		System.out.println("my friends count : " + numberoffriends);
		mv.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		mv.addObject("numberofposts", numberofposts);
		
		mv.addObject("posts", postRepo.findAllByMe(user));
		mv.addObject("profileImg", user.getProfilepicURI());
		mv.addObject("user", user);
		mv.setViewName("updateprofile");
		return mv;
	}
}