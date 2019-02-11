package com.example.demo;

import org.springframework.context.ApplicationEvent;

public class CommentEvent extends ApplicationEvent
{
    private static final long serialVersionUID = 1L;
    private String notification;
    
    public CommentEvent(Object source, String notification)
    {
        super(source);
        this.notification = notification;
    }

	public String getNotification() {
		return notification;
	}
}
    