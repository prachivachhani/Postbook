package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
public class NotificationApplicationListener implements ApplicationListener<PostEvent>
{
//	public List<String> notification =new ArrayList<>();
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	FriendsRepository friendRepo;
	
	@Override
    public void onApplicationEvent(PostEvent event) {
		
		System.out.println("################ in notification listner #####################");
		String userid = event.getNotification();
		User user = userRepo.findByMyId(Long.parseLong(userid));
		
		List<Friends> friends = friendRepo.findByMe(user);
		
		for(int i=0; i < friends.size(); i++)
		{
			if(userRepo.existsByMyId(friends.get(i).getFriendId()))
			{
				User userfriend = new User();
				userfriend = userRepo.findByMyId(friends.get(i).getFriendId());
				userfriend.addNotificationString(user.getName() + " added a new post");
				System.out.println("Data for "+userfriend.getName()+" : "+user.getName() + " added a new post");

			}
		}
//		user.addNotificationString( user.getName() + " added a new post");
		
//		String userid = request.getSession().getAttribute("user_id");
		System.out.println("Received spring custom event - " + event.getNotification());
        
    }

}
