package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderColumn;

@Entity
public class Comments {

		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		private Long commentId;
		
		@ManyToOne
		@JoinColumn(name = "postId", referencedColumnName = "postId")
		@OrderColumn
		private Post post;

		private String comment;

		private String date;
		
		private String username;
		
		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public Long getCommentId() {
			return commentId;
		}

		public void setCommentId(Long commentId) {
			this.commentId = commentId;
		}

		public Post getPost() {
			return post;
		}

		public void setPost(Post post) {
			this.post = post;
		}

		public String getComment() {
			return comment;
		}

		public void setComment(String comment) {
			this.comment = comment;
		}
}
