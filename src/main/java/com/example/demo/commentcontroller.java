package com.example.demo;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import org.json.*;

@Controller
public class commentcontroller {

	@Autowired
	private CommentsRepository commentRepo;

	@Autowired
	private PostRepository postRepo;

	@Autowired
	private UserRepository userRepo;

	@RequestMapping(value="commentform", method=RequestMethod.POST)
	public String commentform(HttpServletRequest req, @RequestParam("response") String usercomment)
	{
//		req.getSession().setAttribute("post", arg1);
		System.out.println(usercomment);
		return "success";
	}
	
	 @PostMapping(value = "/saveComment")
     public void saveComment(HttpServletResponse response, HttpServletRequest request, @RequestParam("inputcomment") String usercomment, @RequestParam("post_id") Long post_id) 
	 {
		System.out.println(usercomment);
		System.out.println(post_id);
		response.setContentType("application/json");
		try {
			String date =(new Date()).toString();

			Long userid = (Long) request.getSession().getAttribute("user_id");
			User newuser = userRepo.findByMyId(userid);
			String name = newuser.getName();

			Comments comment = new Comments();
			Post post = postRepo.findByPostId(post_id);
						
			comment.setComment(usercomment);
			comment.setPost(post);
			comment.setDate(date);
			comment.setUsername(name);
			commentRepo.save(comment);
			
			JSONObject json=new JSONObject();
			JSONObject commentObj=new JSONObject();
			try {
				commentObj.put("comment", comment.getComment());
				commentObj.put("post", comment.getPost().getPostId());
				commentObj.put("date", comment.getDate());
				commentObj.put("user", comment.getUsername());
				
				//json.put("commentDetails", commentObj);
				
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.getWriter().write(commentObj.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	   }
}
