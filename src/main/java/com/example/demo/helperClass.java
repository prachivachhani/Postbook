package com.example.demo;

import java.io.Serializable;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

public class helperClass implements Serializable
{
	
	private User me;
	private Long friendId;

	public helperClass() {}
	
	public helperClass(User me, Long friendId)
	{
		this.me = me;
		this.friendId = friendId;
	}
}
