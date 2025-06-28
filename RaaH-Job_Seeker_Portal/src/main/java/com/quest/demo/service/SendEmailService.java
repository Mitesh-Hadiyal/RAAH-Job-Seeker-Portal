package com.quest.demo.service;

import org.springframework.stereotype.Service;

import com.sendgrid.Response;

@Service
public interface SendEmailService {
	
	public Response sendEmail(String email);

	public Response sendEmailForgotPassword(String email,String otp,String userName);
	public Response sendEmailToProfileMatch(String email,String userName,String jobTitle,String location,String company);

}
