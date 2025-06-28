package com.quest.demo.controller;

import com.quest.demo.Repo.CompanyRepo;
import com.quest.demo.Repo.JobPostRepo;
import com.quest.demo.Repo.UserRepo;
import com.quest.demo.model.Company;
import com.quest.demo.model.JobPost;
import com.quest.demo.model.User;
import com.quest.demo.service.CompanyService;
import com.quest.demo.service.JobPostService;
import com.quest.demo.service.SendEmailService;
import com.quest.demo.serviceImpl.JobPostServiceImpl;
import com.sendgrid.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import org.springframework.http.ResponseEntity;

@Controller
public class CompanyController {
    @Autowired
    private CompanyService companyService;
    @Autowired
    private CompanyRepo companyRepo;
    @Autowired
    private JobPostRepo jobPostRepo;
    @Autowired
    private SendEmailService sendEmailService;
    @Autowired
    private JobPostServiceImpl jobPostServiceImpl;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private JobPostService jobPostService;

//    @PostMapping("/registercompany")
//    public String registerCompany(
//            @ModelAttribute("company") Company company,
//            Model model) {
//
////        if (!imageFile.isEmpty()) {
////            try {
////                Blob imageBlob = new javax.sql.rowset.serial.SerialBlob(imageFile.getBytes());
////                company.setImage(imageBlob);
////            } catch (IOException | SQLException e) {
////                e.printStackTrace();
////            }
////        }
//        System.out.println("ent#############er in a contrpller");
//        System.out.println(company.toString());
//        System.out.println( company.getEmail());
//        this.companyService.registerCompany(company, company.getEmail());
//        return "loginCompany";
//    }

    @PostMapping("/registercompany")
    public String registerCompany(
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("mobile") String mobile,
            @RequestParam("address") String address,
            @RequestParam("established_year") Date established_year,
            @RequestParam("website") String website,
            @RequestParam("image") MultipartFile image)throws IOException {

        Company company = new Company();

        BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
        String encryptedPWD = bCrypt.encode(password);

        company.setName(name);
        company.setEmail(email);
        company.setAddress(address);
        company.setMobile(mobile);
        company.setWebsite(website);
        company.setPassword(encryptedPWD);
        company.setEstablised_year(established_year);
        company.setImage(image.getBytes());

        System.out.println("In Company Registration");
        this.companyRepo.save(company);

//        this.companyService.registerCompany(company, company.getEmail());
        Response sendEmail = sendEmailService.sendEmail(email);

        return "loginCompany";
    }




    @GetMapping("/image/{email}")
    public ResponseEntity<byte[]> getCompanyImage(@PathVariable String email) {
        Company company = companyRepo.findByEmail(email).orElseThrow(() -> new RuntimeException("Company not found"));
        byte[] image = company.getImage();

        System.out.println("Emaill : "+email);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);  // Change to the appropriate image type if needed
        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }

    @PostMapping("/logincompany")
    public String loginAction(@ModelAttribute("company") Company company, BindingResult result , Model model) {
        boolean validaterUser = companyService.validaterUser(company.getEmail(),company.getPassword());
        if(!validaterUser) {
            model.addAttribute("errorMessage", "Invalid Email or Password");
            result.rejectValue("email", "error.user", "Invalid email or password.");
            return "loginCompany";
        }

        Company company1 = companyRepo.findByEmail(company.getEmail()).get();

        Company companyDetails = this.companyService.getCompanyByEmail(company.getEmail());

        List<User> userList = userRepo.findAll();

        model.addAttribute("userList",userList);
//        System.out.println("userList" + userList.toString());
//        model.addAttribute("ListUser", companyByEmail);4
//        System.out.println("companyDetails :"+companyDetails);
        model.addAttribute("Company", companyDetails);

//        List<JobPost> jobPostList = company.getJobPostList();
//        System.out.println("jobPostList :----------"+jobPostList);

//        List<JobPost> allJobPost = jobPostRepo.findAll();
//        System.out.println("JOBPOSTSSSSS : "+allJobPost);

//        List<Optional<JobPost>> myJob = null;
//        Iterator<JobPost> it = allJobPost.iterator();
//        while(it.hasNext())
//        {
//            if(it.next().getCompany().getId() == company.getId())
//            {
//                int jobIds = it.next().getJob_id();
//                myJob.add(jobPostRepo.findById((long) jobIds));
//            }
//        }
//        System.out.println(myJob.toString());


//        List<JobPost> jobPostList11 =  this.jobPostService.getPostsByCompanyId(companyDetails.getId());
//        model.addAttribute("jobPostList111",jobPostList11);

//        Optional<JobPost> jobPostList = this.jobPostRepo.findById(company.getId());
//        model.addAttribute("jobPostList",jobPostList);
//        System.out.println("jobPostList :----------"+jobPostList);

//        List<JobPost> comapanyPosts = jobPostServiceImpl.getPostsByCompanyId(company1.getId());

//        System.out.println("comapanyPosts : "+comapanyPosts);



        return "companyProfile";

    }

//    @PostMapping("/registercompany")
//    public String registerCompany(@ModelAttribute("company") Company companyUser,
//                                  Model model)
//    {
//        System.out.println("********registerCompany Controller");
//        Company company = this.companyService.registerCompany(companyUser, companyUser.getEmail());
//        return "loginCompany";
//    }

    @GetMapping("/deletecompany/{id}")
    public String deleteUser(@PathVariable("id") long id) {
        System.out.println("******** deleteUser Controller");

        companyService.deleteCompany(id);
        return "redirect:/main";
    }

    @PostMapping("/updatecompany/{id}")
    public String UpdateUser(@PathVariable("id") long id,@ModelAttribute("company") Company company,
                             Model model){
        System.out.println("******** UpdateUser Controller");

        companyService.updateCompany(id,company);

        return "redirect:/companyProfile";

    }

    @RequestMapping("/logincompany")
    public String MainPage() {

        return "loginCompany";

    }

    @GetMapping("/deleteemails/{email}")
    public String deleteUserByEmail(@PathVariable("email") String email)
    {

        String emailID = email.substring(1, email.length() - 1);
        System.out.println("EMAIL "+emailID);
        companyService.deleteUserByEmail(emailID);
        return "companyProfile";
    }

    @RequestMapping("/signupcompany")
    public String signUpCompany() {

        return "signupCompany";

    }
}
