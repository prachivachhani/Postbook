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
	UserRepository userRepo;
	
	@GetMapping(value="/notification")
	public ModelAndView viewnotifications(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		User user = userRepo.findByMyId((Long) request.getSession().getAttribute("user_id"));
		
//		mv.addObject("notificationString", user.getNotificationString());		
		mv.addObject("user", user);		
		mv.setViewName("notification");
		return mv;
	}
}
