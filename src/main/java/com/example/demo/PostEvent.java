package com.example.demo;

import org.springframework.context.ApplicationEvent;

public class PostEvent extends ApplicationEvent
{
    private static final long serialVersionUID = 1L;
    private String notification;
    
    //Constructor's first parameter must be source
    public PostEvent(Object source, String notification)
    {
        //Calling this super class constructor is necessary
        super(source);
        this.notification = notification;
    }

	public String getNotification() {
		return notification;
	}

/*	public void setNotification(String notification) {
		this.notification = notification;
	}
*/	

}
    