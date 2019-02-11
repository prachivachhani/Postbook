package com.example.demo;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class notificationcontroller 
{
	@Autowired
	PostRepository postRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	FriendsRepository friendRepo;

	private Long numberofposts;
	private Long numberoffriends;
	
	@GetMapping(value="/notification")
	public ModelAndView viewnotifications(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		User user = userRepo.findByMyId((Long) request.getSession().getAttribute("user_id"));
		
//		mv.addObject("notificationString", user.getNotificationString());
		numberoffriends = friendRepo.countByMe(user);
		System.out.println("my friends count : " + numberoffriends);
		mv.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		mv.addObject("numberofposts", numberofposts);
		
		mv.addObject("posts", postRepo.findAllByMe(user));
		mv.addObject("profileImg", user.getProfilepicURI());
		mv.addObject("user", user);
		mv.addObject("user", user);		
		mv.setViewName("notification");
		return mv;
	}
}
