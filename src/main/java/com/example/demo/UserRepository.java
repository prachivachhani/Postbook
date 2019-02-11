package com.example.demo;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long>
{
	public boolean existsByMyId(Long id);
	public List<User> findAll();
	public User findByMyId(Long id);
	public Long countByFriends(Friends friends);
}
