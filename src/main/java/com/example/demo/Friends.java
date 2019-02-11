package com.example.demo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OrderColumn;

@Entity
@IdClass(value=helperClass.class)
public class Friends implements Serializable
{
    private static final long serialVersionUID = 1L;

	@Id
	private Long friendId;

	@Id
	@ManyToOne
	@JoinColumn(name = "myId", referencedColumnName = "myId")
	@OrderColumn
	private User me;

	public User getMe() {
		return me;
	}

	public void setMe(User me) {
		this.me = me;
	}

	public Long getFriendId() {
		return friendId;
	}

	public void setFriendId(Long friendId) {
		this.friendId = friendId;
	}
}
