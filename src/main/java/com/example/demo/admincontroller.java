package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class admincontroller {

	@Autowired
	FriendsRepository friendRepo;

	@Autowired
	UserRepository userRepo;
	
	@Autowired
	PostRepository postRepo;
	
	private Long numberoffriends;
	private Long numberofposts;

	@GetMapping(value="/admin")
	public ModelAndView viewadmin()
	{
		ModelAndView adminPage = new ModelAndView();
		
		adminPage.addObject("user", userRepo.findAll());
		
		adminPage.setViewName("admin");
		return adminPage;
	}
	
	@GetMapping(value="/userprofileforadmin")
	public ModelAndView getuser(@RequestParam("userid") String userid, HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView();

		User user = userRepo.findByMyId(Long.parseLong(userid));
		System.out.println("useriD::"+userid+"   d:"+user.getMyId());
		
		numberoffriends = friendRepo.countByMe(user);
		
		System.out.println("my friends count : " + numberoffriends);
		mv.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		mv.addObject("numberofposts", numberofposts);
		
		mv.addObject("posts", postRepo.findAllByMe(user));
		//mv.addObject("profileImg", user.getProfilepicURI());
		mv.addObject("user", user);
		mv.setViewName("userprofileforadmin");

		return mv;
	}

	@GetMapping(value="/deleteuserpost")
	public ModelAndView deletepost(@RequestParam("userid") String userid, @RequestParam("postid") String postid, HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView();

		Post post = postRepo.findByPostId(Long.parseLong(postid));
		User user = userRepo.findByMyId(Long.parseLong(userid));
		postRepo.deleteById(Long.parseLong(postid));
		
		numberoffriends = friendRepo.countByMe(user);
		
		System.out.println("my friends count : " + numberoffriends);
		mv.addObject("numberoffriends", numberoffriends);
	
		numberofposts = postRepo.countByMe(user);
		System.out.println("my posts count : " + numberofposts);
		mv.addObject("numberofposts", numberofposts);
		
		mv.addObject("posts", postRepo.findAllByMe(user));
		//mv.addObject("profileImg", user.getProfilepicURI());
		mv.addObject("user", user);
		mv.setViewName("userprofileforadmin");

		return mv;
	}

}
