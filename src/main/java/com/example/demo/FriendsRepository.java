package com.example.demo;

import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FriendsRepository extends CrudRepository<Friends, helperClass>
{
	public List<Friends> findByMe(User user);
	public List<Friends> findAll();
	public Long countByMe(User user);
}
