package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderColumn;

@Entity
public class Post {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long postId;
	
	@ManyToOne
	@JoinColumn(name = "myId", referencedColumnName = "myId")
	@OrderColumn
	private User me;

	private String imageURI;
	private String audioURI;
	private String imagecaption;
	
	public Long getPostId() {
		return postId;
	}
	public void setPostId(Long postId) {
		this.postId = postId;
	}
	public User getMe() {
		return me;
	}
	public void setMe(User me) {
		this.me = me;
	}
	public String getImageURI() {
		return imageURI;
	}
	public void setImageURI(String imageURI) {
		this.imageURI = imageURI;
	}
	public String getAudioURI() {
		return audioURI;
	}
	public void setAudioURI(String audioURI) {
		this.audioURI = audioURI;
	}
	public String getImagecaption() {
		return imagecaption;
	}
	public void setImagecaption(String imagecaption) {
		this.imagecaption = imagecaption;
	}
}
