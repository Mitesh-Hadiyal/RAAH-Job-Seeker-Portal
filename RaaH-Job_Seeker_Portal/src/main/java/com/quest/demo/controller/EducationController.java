package com.quest.demo.controller;

import com.quest.demo.model.Education;
import com.quest.demo.model.User;
import com.quest.demo.service.EducationService;
import com.quest.demo.serviceImpl.EducationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EducationController {

    @Autowired
    EducationService educationService;
//    @PostMapping("/education")
//    public String addEducation(@ModelAttribute("education")Education education, Model model) {
//        educationService.addEducation(education);
//        return "users";
//    }

//    @GetMapping("/addEducation")
//    public String showForm(Model model) {
//        model.addAttribute("education", new Education());
//        return "addEducation";
//    }

//    @GetMapping("/addeducation")
//    public String goToEducation()
//    {
//        return "addEducation";
//    }
}
