//package com.quest.demo.controller;
//
//import com.quest.demo.Repo.UserRepo;
//import com.quest.demo.model.User;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import java.util.List;
//
//@Controller
//public class adminController {
//
//    @Autowired
//    private UserRepo userRepo;
//
//    @GetMapping("/admin")
//    public String adminPage()
//    {
//        List<User> allUsers = userRepo.findAll();
//        model.addAttribute("allUsers", allUsers);
//        return "/admin";
//    }
//}
