package com.quest.demo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import com.quest.demo.Repo.CompanyRepo;
import com.quest.demo.Repo.JobApplicationsRepo;
import com.quest.demo.Repo.JobPostRepo;
import com.quest.demo.Repo.UserRepo;
import com.quest.demo.model.Company;
import com.quest.demo.model.JobApplications;
import com.quest.demo.model.JobPost;
import com.quest.demo.service.CompanyService;
import com.quest.demo.service.SendEmailService;
import com.quest.demo.serviceImpl.JobPostServiceImpl;
import com.quest.demo.serviceImpl.UserServiceImpl;
import com.sendgrid.Response;
import jakarta.servlet.http.HttpServletResponse;
import org.bouncycastle.jcajce.provider.asymmetric.dh.BCDHPrivateKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.quest.demo.model.User;
import com.quest.demo.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {
	
	@Autowired
	private UserService  userService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private SendEmailService sendEmailService;
	@Autowired
	private JobPostRepo jobPostRepo;

	@Autowired
	private CompanyRepo companyRepo;

	@Autowired
	private UserRepo userRepo;

	@Autowired
	private UserServiceImpl userServiceImpl;

	@Autowired
	private JobPostServiceImpl jobPostServiceImpl;

	@Autowired
	private JobApplicationsRepo jobApplicationsRepo;
	private String email=null;
	
	/**
	 * Retrieves all users from the userService and adds them to the model for rendering.
	 * 
	 * @param model The Model object used to pass data to the view.
	 * @return String The name of the view to render.
	 */

	@PostMapping("/searchJob")
	public String jobSearch(@RequestParam("title")String title,
			@RequestParam("email")String email,Model model)
	{
		System.out.println(email);
		List<JobPost> jobPostListMatched = jobPostServiceImpl.findJobsByEmailLike(title);
		System.out.println("jobPostListMatched :"+jobPostListMatched);
		model.addAttribute("jobPostListMatched",jobPostListMatched);

		User allUsers = userService.getUserByEmail(email);
		model.addAttribute("ListUser",allUsers);
		return "users";
	}
	
	@GetMapping("/getallusers")
	public String findAllUsers(Model model){
//		System.out.println("email :"+email);

//		User allUsers = userService.getUserByEmail(email);
//		List<Company> allCompany = this.companyService.getAllCompany();
//
		List<JobPost> jobPostList = this.jobPostRepo.findAll();
		model.addAttribute("jobPostList",jobPostList);
//		System.out.println("jobPostList : " +jobPostList.toString());
//
//		model.addAttribute("ListUser", allUsers);
////		model.addAttribute("allCompany", allCompany);
//		System.out.println(allUsers.getFirstName());
        return "users";
	}

	/**
	 * Retrieves a user by their ID and redirects to the signup page with user details.
	 * 
	 * @param userId The unique identifier of the user to retrieve.
	 * @param redirectAttributes RedirectAttributes for adding flash attributes.
	 * @return String Redirects to the signup page.
	 */
	@GetMapping("/getusers/{id}")
	public String findUserById(@PathVariable("id") int userId, RedirectAttributes redirectAttributes) {
	    User userById = userService.findUserById(userId);
	    redirectAttributes.addFlashAttribute("abc", "abcxes");
	    redirectAttributes.addFlashAttribute("UserEdit", userById);
	    return "redirect:/signup";
	}

	@PostMapping("forgotpassword")
	public String forgotPassword(@RequestParam("email")String email,Model model)
	{
		Optional<User> optionalUser = userRepo.findByEmail(email);
		String userName = optionalUser.get().getFirstName();
		if (optionalUser.isPresent()) {
			User user = optionalUser.get();
			String otp = String.valueOf(new Random().nextInt(999999));
			user.setOtp(otp);
			user.setOtpExpiry(LocalDateTime.now().plusMinutes(10));
			userRepo.save(user);
			sendEmailService.sendEmailForgotPassword(email,otp,userName);
			System.out.println("OTP Sent : "+otp);
//			emailService.sendOtpEmail(email, otp);
		}
		model.addAttribute("email",email);
		return "redirect:/forgotpassword";
	}

	@GetMapping("forgotpassword")
	public String forgotPage()
	{
		return "forgotpassword";
	}


	@PostMapping("forgotSubmit")
	public String forgotPasswordDone(@RequestParam("otp") String otp,
									@RequestParam("email")String email, Model model)
	{
		System.out.println("OTP : "+otp);

		Optional<User> optionalUser = userRepo.findByEmail(email);
		String dbOtp = optionalUser.get().getOtp();

		System.out.println("DBOTP : "+dbOtp);
		if(dbOtp.equals(otp))
		{
			model.addAttribute("email",email);
			return "redirect:/newPassword";
		}else{
			return "redirect:/forgotpassword";
		}
	}

	@GetMapping("newPassword")
	public String newpasswod()
	{
		return "newPassword";
	}

	@PostMapping("savepassword")
	public String newPasswordSaved(@RequestParam("email")String email,
								   @RequestParam("password") String password, Model model)
	{
		System.out.println("password "+password);
		BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
		String encryptedPWD = bCrypt.encode(password);

		Optional<User> optionalUser = userRepo.findByEmail(email);
		optionalUser.get().setPassword(encryptedPWD);
		System.out.println("new password :"+password);
		userService.updateUserById(optionalUser.get().getId(),optionalUser.get());

		return "redirect:/main";
	}
	@GetMapping("forgot")
	public String getForgotPage()
	{
		return "forgot";
	}
	
	/**
	 * Handles the registration of a new user.
	 *
	 * @return String Redirects to the endpoint for retrieving all users.
	 */
//	@PostMapping("/register")
//	public String createUser(@ModelAttribute("user") User user,
//            Model model){
//		 userService.createUser(user);
//		 return "redirect:/login";
//
//	}

	@PostMapping("/register")
	public String registerUser(@Valid @RequestParam("firstName") String firstName,
							   @RequestParam("lastName") String lastName,
							   @RequestParam("password") String password,
							   @RequestParam("gender") String gender,
							   @RequestParam("skills") String skills,
							   @RequestParam("address") String address,
							   @RequestParam("dob") Date dob,
							   @RequestParam("phoneNumber") String phoneNumber,
							   @RequestParam("email") String email,
							   @RequestParam("image") MultipartFile image,
							   @RequestParam("resume") MultipartFile resume)throws IOException {

		User user =	new User();
		System.out.println(" PASSWORD :"+ password);

		System.out.println("skills : "+skills);

		BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
		String encryptedPWD = bCrypt.encode(password);

		System.out.println("ENCODED PASSWORD :"+encryptedPWD);

		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setDob(dob);
		user.setAddress(address);
		user.setGender(gender);
		user.setSkills(skills.toString());
		user.setPassword(encryptedPWD);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
		user.setImage(image.getBytes());
		user.setResume(resume.getBytes());

		Response sendEmail = sendEmailService.sendEmail(email);
		userService.createUser(user);
		return "login";
	}
	/**
	 * Handles the HTTP POST request to update a user with the specified ID.
	 * 
	 * @param id    The ID of the user to be updated.
	 * @param user  The updated user object containing new information.
	 * @param model The model used to pass data to the view.
	 * @return      Redirects the user to the "getallusers" endpoint after updating the user.
	 */




	@PostMapping("/updateUser")
	public String UpdateUser(@ModelAttribute("user") User user,
            Model model){

		 userService.updateUserById(user.getId(), user);

		System.out.println("EMAIL : "+user.getEmail());
		User allUsers = userService.getUserByEmail(user.getEmail());
//		List<Company> allCompany = this.companyService.getAllCompany();
//
		List<JobPost> jobPostList = this.jobPostRepo.findAll();
		model.addAttribute("jobPostList",jobPostList);
//		System.out.println("jobPostList : " +jobPostList.toString());
//
		model.addAttribute("ListUser", allUsers);

		System.out.println("In User Update Controller");
		 return "redirect:/getallusers";
	}

//	@PostMapping("/updateUser/{id}")
//	public String UpdateUser(@PathVariable("id") int id,@ModelAttribute("user") User user,
//							 @RequestParam("firstName") String firstName,
//							 @RequestParam("lastName") String lastName,
//							 @RequestParam("password") String password,
//							 @RequestParam("gender") String gender,
//							 @RequestParam("address") String address,
//							 @RequestParam("dob") Date dob,
//							 @RequestParam("phoneNumber") String phoneNumber,
//							 @RequestParam("email") String email)throws IOException{
//
//		user.setFirstName(firstName);
//		user.setLastName(lastName);
//		user.setDob(dob);
//		user.setAddress(address);
//		user.setGender(gender);
//		user.setPassword(password);
//		user.setPhoneNumber(phoneNumber);
//		user.setEmail(email);
//		user.setImage(image);
//
//		userService.updateUserById(id,firstName,lastName, gender, address, phoneNumber, email );
//		System.out.println("In User Update Controller$$$$$$$$$");
//		return "redirect:/getallusers";
//	}

	/**
	 * Handles the deletion of a user by their ID.
	 * 
	 * @param userId The unique identifier of the user to delete.
	 * @return String Redirects to the endpoint for retrieving all users.
	 */
	@GetMapping("/delete/{id}")
	public String deleteUser(@PathVariable("id") int userId) {
		userService.deleteUser(userId);
		 return "redirect:/getallusers";  
	}

	@GetMapping("/deleteemail/{email}")
	public String deleteUserByEmail(@PathVariable("email") String email)
	{

		String emailID = email.substring(1, email.length() - 1);
		System.out.println("EMAIL "+emailID);
		userService.deleteUserByEmail(emailID);
		return "admin";
	}
	/**
	 * Handles the login action.
	 * 
	 * @param user   The User object containing login information.
	 * @param result BindingResult for validation and binding errors.
	 * @param model  The Model object used to pass data to the view.
	 * @return String Redirects to the endpoint for retrieving all users if login is successful, otherwise returns to the login page with an error message.
	 */
	@PostMapping("/loginaction")
	public String loginAction(@ModelAttribute("user") User user,BindingResult result ,Model model) {

		if(user.getEmail().equals("admin@gmail.com") && user.getPassword().equals("admin"))
		{
			System.out.println("in adminnnn 1");
			int userCount = userRepo.findAll().size();
			model.addAttribute("userCount",userCount);

			System.out.println("in adminnnn 2");
			List<User> userList =  userRepo.findAll();
			model.addAttribute("userList",userList);

//			System.out.println("userList :::::::"+userList);

			System.out.println("in adminnnn 3");
			int companyCount = companyRepo.findAll().size();
			model.addAttribute("companyCount",companyCount);

			System.out.println("in adminnnn 4");
//			List<Company> companyList = companyRepo.findAll();
			List<Company> companyList = companyRepo.findAll();
			model.addAttribute("companyList",companyList);

//			for(Company c : companyList)
//			{
//				System.out.println(c.getName());
//			}
			System.out.println("in adminnnn 5");
//			model.addAttribute("companyList",companyList);
//			System.out.println("companyList : "+companyList.toString());

			int jobCount =  jobPostRepo.findAll().size();
			model.addAttribute("jobCount",jobCount);

			System.out.println("in adminnnn 6");
			List<JobApplications> jobAppList = jobApplicationsRepo.findAll();
			model.addAttribute("jobAppList",jobAppList);
//			System.out.println("jobAppList : : "+ jobAppList.iterator().next());

//			Company c = jobAppList.iterator().next().getCompany();
			System.out.println("jobAppList "+jobAppList.toString());

			int jobAppCount = jobApplicationsRepo.findAll().size();
			model.addAttribute("jobAppCount",jobAppCount);
			System.out.println("jobAppCount :: "+jobAppCount);

			System.out.println("in adminnnn 7");
			List<JobPost> jobList = jobPostRepo.findAll();
			model.addAttribute("jobList",jobList);


			return "admin";
		}


		boolean validaterUser = userService.validaterUser(user.getEmail(),user.getPassword());
		email=user.getEmail();
		this.sendEmailService.sendEmail(user.getEmail());
		if(!validaterUser) {
			 model.addAttribute("errorMessage", "Invalid Email or Password");
			 result.rejectValue("email", "error.user", "Invalid email or password.");
			 return "login";
		}

		User allUsers = userService.getUserByEmail(email);
//		List<Company> allCompany = this.companyService.getAllCompany();
//
		List<JobPost> jobPostList = this.jobPostRepo.findAll();
		model.addAttribute("jobPostList",jobPostList);
//		System.out.println("jobPostList : " +jobPostList.toString());
//
		model.addAttribute("ListUser", allUsers);
//		model.addAttribute("allCompany", allCompany);
//		System.out.println(allUsers.getFirstName());
		return "users";

	}

	@GetMapping("/users")
	String usersPage(){
		return "users";
	}

	/**
	 * Handles requests to "/main" and returns the view name "main".
	 * 
	 * @return String The name of the view to render.
	 */
	
	@RequestMapping("/main")
	public String MainPage() {
		
		return "main";
		
	}
	/**
	 * Handles requests to "/signup" and prepares a new User object for signing up.
	 *
	 * @param model The Model object used to pass data to the view.
	 * @return String The name of the view to render.
	 */
	@RequestMapping("/signup")
	public String signUp(Model model) throws IOException {
		User user= new User();
        model.addAttribute("user", user);
		return "signUp";

	}

	/**
	 * Handles GET requests to "/login" and returns the view name "login".
	 * 
	 * @return String The name of the view to render.
	 */
	@GetMapping("/login")
    public String login(){
        return "login";
    }
	/**
	 * Handles the verification of a phone number.
	 *
	 * @param user    The User object containing phone number information.
	 * @param result  BindingResult for validation and binding errors.
	 * @param model   The Model object used to pass data to the view.
	 * @param session HttpSession for session management.
	 * @return String Redirects to "main" if phone number is invalid, otherwise redirects to "success".
	 */
//	@PostMapping("/verifyPhoneNumber")
//	public String verifyPhoneNumber(@ModelAttribute("user") User user,BindingResult result ,Model model,HttpSession session) {
//		boolean validaterPhoneNumber = this.userService.validaterPhoneNumber(user.getPhoneNumber());
//		if(!validaterPhoneNumber) {
//			 model.addAttribute("errorMessage", "Invalid phoneNumber");
//			 session.setAttribute("displayedErrorMessage", true);
//			return "main";
//		}
//		 model.addAttribute("successMessage", "phoneNumber is verified");
//		return "main";
//
//	}

}
