package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class friendsprofilecontroller 
{
	@Autowired
	UserRepository userRepo;

	@Autowired
	PostRepository postRepo;

	@Autowired
	FriendsRepository friendRepo;

	private Long numberoffriends;
	private Long numberofposts;
	
	@GetMapping(value="/friendsprofile")
	public ModelAndView visitfriendsprofile(HttpServletRequest req,  @RequestParam("friendsid") String friendsid)
	{	
		System.out.println("##########in friends profile controller ###############");
		Long userid = (Long) req.getSession().getAttribute("user_id");
		User user = userRepo.findByMyId(userid);
		User friend = userRepo.findByMyId(Long.parseLong(friendsid));
		
		ModelAndView mv = new ModelAndView();
		
		numberoffriends = friendRepo.countByMe(friend);
		System.out.println("my friends count : " + numberoffriends);
		mv.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(friend);
		System.out.println("my posts count : " + numberofposts);
		mv.addObject("numberofposts", numberofposts);
		
		mv.addObject("posts", postRepo.findAllByMe(friend));
		mv.addObject("profileImg", friend.getProfilepicURI());
		System.out.println("ProfileURI : "+friend.getProfilepicURI());
		mv.addObject("user", friend);
		mv.setViewName("friendsprofile");
		return mv;
	}
}
