package com.quest.demo.serviceImpl;

import java.util.List;
import java.util.Optional;

import com.quest.demo.Repo.JobPostRepo;
import com.quest.demo.Repo.UserRepo;
import com.quest.demo.model.JobPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.quest.demo.execption.ResourceNotFoundException;
import com.quest.demo.model.User;
import com.quest.demo.service.SendEmailService;
import com.quest.demo.service.UserService;
import com.sendgrid.Response;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private JobPostRepo jobPostRepo;
	
	@Autowired
	private SendEmailService sendEmailService;

	@Override
	public List<User> getAllUsers() {
		List<User> allUser = this.userRepo.findAll();
		
		return allUser;
	}


	@Override
	public User findUserById(int userId) {
		User user = userRepo.findById(userId).orElseThrow(()-> new ResourceNotFoundException("User Not Found by ID::" +userId));
		return user;
	}


	@Override
	public void createUser(User user) {
		Optional<User> existingUser = userRepo.findByEmail(user.getEmail());

		if (existingUser.isPresent()) {
			throw new RuntimeException("Email already exists");
		}

		System.out.println("existingUser : "+existingUser);

		System.out.println("existingUser.isPresent() : "+ existingUser.isPresent());
//		 if (userMapper.countByNickname(user.getNickName()) > 0) {
//	            throw new RuntimeException("Nickname already exists");
//	        }
//	        if (userRepo.findByEmail(user.getEmail()).get()>0) {
//	            throw new RuntimeException("Email already exists");
//	        }
//	        if (userMapper.countByPhoneNumber(user.getPhoneNumber()) > 0) {
//	            throw new RuntimeException("Phone number already exists");
//	        }
		userRepo.save(user);
		 Response sendEmail = sendEmailService.sendEmail(user.getEmail());
		 
	}


	@Override
	public void updateUserById(int userId,User user) {
		User user1 = userRepo.findById(userId).orElseThrow(()-> new ResourceNotFoundException("User Not Found by ID::" +userId));
		user.setId(userId);
		User save = userRepo.save(user);
	}


	@Override
	public void deleteUser(int userId) {
		User user1 = userRepo.findById(userId).orElseThrow(()-> new ResourceNotFoundException("User Not Found by ID::" +userId));
		userRepo.delete(user1);
	}

	@Override
	public void deleteUserByEmail(String email)
	{
		System.out.println("email"+email);
		User user = userRepo.findByEmail(email).orElseThrow(()->new ResourceNotFoundException("User Not Found by Email "+email));
		userRepo.delete(user);
	}


	@Override
	public boolean validaterUser(String email, String password) {
		User user = this.userRepo.findByEmail(email).orElseThrow(()-> new ResourceNotFoundException("Email I'd Not Found::" +email));

		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

		if(bCryptPasswordEncoder.matches(password, user.getPassword())){
			return true;
		}

		return false;
	}


	@Override
	public boolean validaterPhoneNumber(Long phoneNumber) {
//		if(this.userMapper.getUserByphoneNumber(phoneNumber)==null) {
//			return false;
//		}
		return true;
	}

	@Override
	public User getUserByEmail(String email) {
		User user = this.userRepo.findByEmail(email).get();
//		System.out.println("USEeeeeer ::"+user);
		return user;
	}


}
