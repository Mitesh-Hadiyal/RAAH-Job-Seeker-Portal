package com.quest.demo.controller;

import com.quest.demo.Repo.CompanyRepo;
import com.quest.demo.Repo.JobApplicationsRepo;
import com.quest.demo.Repo.JobPostRepo;
import com.quest.demo.model.JobApplications;
import com.quest.demo.model.JobPost;
import com.quest.demo.model.User;
import com.quest.demo.service.CompanyService;
import com.quest.demo.service.UserService;
import com.quest.demo.serviceImpl.JobPostServiceImpl;
import com.quest.demo.serviceImpl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class JobApplicationsController {

    @Autowired
    private JobApplicationsRepo jobApplicationsRepo;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private UserService userService;

    @Autowired
    private JobPostRepo jobPostRepo;

    @Autowired
    private JobPostServiceImpl jobPostServiceImpl;

    @PostMapping("/apply")
    public String applyJob(@RequestParam("jobId") int jobId,
                           @RequestParam("user_email")String user_email,
                           @RequestParam("com_email")String com_email,
                           @ModelAttribute("jobApplication") JobApplications jobApplications, Model model)
    {
//        System.out.println("user email :::::"+user_email);
//        System.out.println("com email   :::::" + com_email);
//        System.out.println("job IDD :::"+jobId);

        JobApplications jobApplications1 = new JobApplications();
        jobApplications1.setCompany(companyService.getCompanyByEmail(com_email));
        jobApplications1.setUser(userServiceImpl.getUserByEmail(user_email));
        jobApplications1.setJobPost(jobPostServiceImpl.getJobpostByID(jobId));
//        System.out.println("In JOb Application Controller");
        jobApplicationsRepo.save(jobApplications1);


        User allUsers = userService.getUserByEmail(user_email);
//		List<Company> allCompany = this.companyService.getAllCompany();
//
        List<JobPost> jobPostList = this.jobPostRepo.findAll();
        model.addAttribute("jobPostList",jobPostList);
//		System.out.println("jobPostList : " +jobPostList.toString());
//
        model.addAttribute("ListUser", allUsers);
//		model.addAttribute("allCompany", allCompany);
//		System.out.println(allUsers.getFirstName());
//        return "users";

        return "users";
    }


//    @GetMapping("/apply/{email}")
//    public String getDetailsOfUser(@PathVariable("email") String email)
//    {
//        System.out.println("EMAIL :: "+email);
//        return "getallusers";
//    }
}
