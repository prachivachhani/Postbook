package com.example.demo;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>
{
	public Long countByMe(User user);
	public Post findByPostId(Long id);
	public List<Post> findAllByMe(User user);
}
