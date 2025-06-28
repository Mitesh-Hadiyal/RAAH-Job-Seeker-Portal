package com.quest.demo.service;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import com.quest.demo.model.JobPost;
import com.quest.demo.model.User;
import org.springframework.web.bind.annotation.RequestParam;

public interface UserService {
	
	
	 List<User> getAllUsers();
	
	 User findUserById(int userId);
	 
	 void createUser(User user);
	 
//	 void updateUserById(int userId,User user);

	 void updateUserById(int userId,User user);

	 void deleteUser(int UserId);

	void deleteUserByEmail(String email);
	 
	 boolean validaterUser(String email,String password);
	 
	 boolean validaterPhoneNumber(Long phoneNumber);
	 
	 User getUserByEmail(String email);


}
