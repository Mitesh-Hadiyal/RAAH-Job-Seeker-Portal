package com.quest.demo.controller;

import com.quest.demo.Repo.CompanyRepo;
import com.quest.demo.Repo.JobPostRepo;
import com.quest.demo.Repo.UserRepo;
import com.quest.demo.dto.JobDto;
import com.quest.demo.model.Company;
import com.quest.demo.model.JobPost;
import com.quest.demo.model.User;
import com.quest.demo.service.JobPostService;
import com.quest.demo.service.SendEmailService;
import com.quest.demo.serviceImpl.JobPostServiceImpl;
import com.sendgrid.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class JobPostController {
    @Autowired
    private JobPostService jobPostService;
    @Autowired
    private JobPostServiceImpl jobPostServiceImpl;

    @Autowired
    private JobPostRepo jobPostRepo;

    @Autowired
    private SendEmailService sendEmailService;
    @Autowired
    private CompanyRepo companyRepo;

    @Autowired
    private UserRepo userRepo;
    @PostMapping("/addJobPost")
    public String addJobPost(@ModelAttribute("jobPost") JobPost jobPost, @RequestParam("company.id") Company companyId, Model model)
    {
        System.out.println("1");
//      System.out.println("in Job Post Controller");
        jobPost.setCompany(companyId);
//      System.out.println(companyId);
        jobPostService.addJobPost(jobPost);
//        System.out.println("+++++++++++++"+ jobPost);

        String[] skills = jobPost.getSkills().split(",");
//        System.out.println("Array of Skills : " + skills[0]+ skills[1]+ skills[2]);

        List<User> sortedUser = getEmailsBySkills(skills);

        for (User user : sortedUser) {
          sendEmailService.sendEmailToProfileMatch(user.getEmail(),user.getFirstName(),jobPost.getJobTitle(),jobPost.getLocation(),jobPost.getCompany().getName());
//            System.out.println("Email Sent to all user matched with profile.");
        }

        Company company = companyRepo.findById(companyId.getId()).get();
//      Company company1 = companyRepo.findByEmail(company.getEmail()).get();
//      Company companyDetails = this.companyService.getCompanyByEmail(company.getEmail());

        List<User> userList = userRepo.findAll();
        model.addAttribute("userList",userList);
//      System.out.println("userList" + userList.toString());
//      model.addAttribute("ListUser", companyByEmail);4
//      System.out.println("companyDetails :"+companyDetails);
        model.addAttribute("Company", company);

        return "companyProfile";
    }

//    @GetMapping("/search")
//    public String search(@RequestParam("query") String query, Model model) {
//        List<JobPost> results = jobPostServiceImpl.search(query);
//        model.addAttribute("results", results);
//        return "users";
//    }


    @GetMapping("/search/{name}")
    public String SearchByName(@PathVariable String name,  Model model){

        List<JobDto> allJobs = jobPostService.searchbyJobTitle(name);
        model.addAttribute("jobs", allJobs);
        return "users";
    }

    public List<User> getEmailsBySkills(String[] skills) {
        System.out.println("2");
        Set<String> emailSet = new HashSet<>();

        List<User> users = userRepo.findAll();
        List<User> sortedUser = new ArrayList<>();
        Set<String> skillSet = new HashSet<>(Arrays.asList(skills));

        for (User user : users) {
            String[] dbSkills = user.getSkills().split(",");
            for (String dbSkill : dbSkills) {
                if (skillSet.contains(dbSkill.trim())) {
                    System.out.println("--3");
                    sortedUser.add(user);
                    emailSet.add(user.getEmail());
                    break; // No need to check further skills for this user
                }
            }
        }


        return sortedUser;
    }

//    public Set<String> getEmailsBySkills(String[] skills)
//    {
//        System.out.println("2");
//        Set<String> emailSet = new HashSet<>();
////        List<String> emailsList = new ArrayList<>();
//
//        List<User> user = userRepo.findAll();
//
//        Iterator<User> it = user.iterator();
//
//        Set<String> set = new HashSet<>();
//        for (String s : skills) {
//            set.add(s);
//        }
//
//        while(it.hasNext()) {
//            String[] dbSkills = it.next().getSkills().split(",");
//            for (int i = 0; i < dbSkills.length; i++) {
//
//                for (String s : dbSkills) {
//                    if (set.contains(s)) {
//                        System.out.println("--3");
////                      System.out.println("it.next().getEmail() : " + it.next().getEmail());
////                      String tempEmail = it.next().getEmail();
//                        emailSet.add(it.next().getEmail());
//
//                        break;
//                    }
//                }
//            }
//        }
//        System.out.println("3");
//
//        System.out.println("emailsList : "+ emailSet.toString());
//        return emailSet;
//    }
}
