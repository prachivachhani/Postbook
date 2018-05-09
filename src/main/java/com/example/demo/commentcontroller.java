package com.example.demo;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.minidev.json.JSONObject;

@Controller
public class commentcontroller {

	@RequestMapping(value="commentform", method=RequestMethod.POST)
	public String commentform(HttpServletRequest req, @RequestParam("response") String usercomment)
	{
//		req.getSession().setAttribute("post", arg1);
		System.out.println(usercomment);
		return "success";

	}
	
	 @PostMapping(value = "/saveComment")
	   public void saveComment(HttpServletResponse response,  @RequestParam("inputcomment") String usercomment, @RequestParam("post_id") Long post_id) {
		System.out.println("comment" +usercomment);
		System.out.println("c:");
		System.out.println(usercomment);
		System.out.println(post_id);
		response.setContentType("text/plain");
		try {
			response.getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	   }
}
