package com.example.demo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
public class User {

	@Id
	private Long myId;
	
	private String name;
	
	private String profilepicURI;
		
	@Column(unique=true)
	private String email;
	
	@OneToMany(mappedBy="me", cascade=CascadeType.ALL, orphanRemoval = true)
	private List<Friends> friends = new ArrayList<>();

	@OneToMany(mappedBy="me", cascade=CascadeType.ALL, orphanRemoval = true)
	private List<Post> post = new ArrayList<>();
	
	private String description;

	
//	@Column(columnDefinition="mediumblob")
 //   private byte[] profileImage;
	

//	@OneToMany(mappedBy="me")
//	private List<Friends> friends;
//	private List<Post> posts;

	public String getProfilepicURI() {
		return profilepicURI;
	}
	public void setProfilepicURI(String profilepicURI) {
		this.profilepicURI = profilepicURI;
	}
	
	public List<Post> getPost() {
		return post;
	}
	public void addPost(Post post) {
		this.post.add(post);
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Friends> getFriends() {
		return friends;
	}
	public void addFriends(Friends friends) {
		this.friends.add(friends);
	}
	public String getName() {
		return name;
	}
	public Long getMyId() {
		return myId;
	}
	public void setMyId(Long myId) {
		this.myId = myId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}