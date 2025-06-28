package com.quest.demo.serviceImpl;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.quest.demo.service.SendEmailService;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;

@Service
public class SendEmailServiceImpl implements SendEmailService{
	
	@Value("${SENDGRID_API_KEY}")
	private String SENDGRID_API_KEY;
	
	
	
	public Response sendEmail(String email) {
		Email from = new Email("your-email-id");
		String subject = "Welcome to RAAH!";
		Email to = new Email(email);
		Content content = new Content("text/plain", "Dear User,\n\nWelcome to Raah!\n\nWe are thrilled to have you join our community. Your account has been successfully created, and you can now start exploring all the features and benefits that we have to offer.\n\nHere are a few quick tips to help you get started:\n\nExplore: Discover new and exciting content tailored just for you.\n\nProfile: Complete your profile to get the most out of our personalized features.\n\nCommunity: Connect with like-minded individuals and join discussions.\n\nSupport: If you need any help, visit our Help Center or contact our support team.\n\nTo log in to your account, simply visit our login page and enter your credentials.\n\nIf you have any questions or need assistance, please don't hesitate to reach out to us at support@raah.com. We're here to help!\n\nBest regards,\nThe RAAH Team\n");
		Mail mail = new Mail(from, subject, to, content);
		
		    SendGrid sg = new SendGrid(SENDGRID_API_KEY);
		    Request request = new Request();
		    try {
		      request.setMethod(Method.POST);
		      request.setEndpoint("mail/send");
		      request.setBody(mail.build());
		      Response response = sg.api(request);
		      
		      return response;
		    } catch (IOException ex) {
		      System.out.println("Email not a sent..!!!");
		      return null;
		    }
	}

	public Response sendEmailToProfileMatch(String email,String userName,String jobTitle,String location,String company) {
		Email from = new Email("your-email-id");
		String subject = "Welcome to RAAH!";
		Email to = new Email(email);
		String emailBody = "Dear " + userName + ",\n\n"
				+ "We hope this message finds you well.\n\n"
				+ "We are thrilled to inform you that your profile matches an exciting job opportunity we currently have at "
				+ company + ". Based on your skills and experience, we believe you could be a great fit for the role of "
				+ jobTitle + ".\n\n"
				+ "Here are some details about the position:\n\n"
				+ "Position : " + jobTitle + "\n"
				+ "Company : " + company + "\n"
				+ "Location : " + location + "\n"
				+ "Job Type : Full-Time\n\n\n"
				+ "We're here to help!\n\nBest regards,\nThe RAAH Team\n";


		Content content = new Content("text/plain", emailBody);
		Mail mail = new Mail(from, subject, to, content);

		SendGrid sg = new SendGrid(SENDGRID_API_KEY);
		Request request = new Request();
		try {
			request.setMethod(Method.POST);
			request.setEndpoint("mail/send");
			request.setBody(mail.build());
			Response response = sg.api(request);

			return response;
		} catch (IOException ex) {
			System.out.println("Email not a sent..!!!");
			return null;
		}
	}



	public Response sendEmailForgotPassword(String email,String otp,String userName) {
		Email from = new Email("your-email-id");
		String subject = "Welcome to RAAH!";
		Email to = new Email(email);
		String emailBody = "Dear "+userName+"\n\n" +
				"We received a request to reset your password. Use the OTP below to reset your password. This OTP is valid for the next 10 minutes.\n\n" +
				"Your OTP is: " + otp + "\n\n" +
				"If you did not request a password reset, please ignore this email or contact support if you have any concerns.\n\n" +
				"Best regards,\n" +
				"The RAAH Team";


		Content content = new Content("text/plain", emailBody);
		Mail mail = new Mail(from, subject, to, content);

		SendGrid sg = new SendGrid(SENDGRID_API_KEY);
		Request request = new Request();
		try {
			request.setMethod(Method.POST);
			request.setEndpoint("mail/send");
			request.setBody(mail.build());
			Response response = sg.api(request);

			return response;
		} catch (IOException ex) {
			System.out.println("Email not a sent..!!!");
			return null;
		}
	}

}
