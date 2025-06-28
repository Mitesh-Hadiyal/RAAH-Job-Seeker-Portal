package com.quest.demo.model;

import jakarta.persistence.*;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@NotEmpty(message = "firstName not null")
	private String firstName;
	private String lastName;
	private String password;
	private String gender;
	private String skills;
	private String address;
	@Lob
	@Column(name = "image", columnDefinition = "LONGBLOB")
	private  byte[] image;

	@Lob
	@Column(name = "resume", columnDefinition = "LONGBLOB")
	private  byte[] resume;

	private Date dob;

	@NotNull
	@Pattern(regexp = "^\\d{10}$", message = "Phone number must be exactly 10 digits")
	private String phoneNumber;
	private String email;

	// OTP fields
	private String otp;
	private LocalDateTime otpExpiry;

//	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
//	private int id;
//
//	@NotBlank(message = "First name is mandatory")
//	@NotEmpty(message = "First name is mandatory")
//	private String firstName;
//
//	@NotBlank(message = "Last name is mandatory")
//	@NotEmpty(message = "Last name is mandatory")
//	private String lastName;
//
//	@NotBlank(message = "Password is mandatory")
//	@Size(min =4, message = "Password must be in between 4 to 12")
//	private String password;
//
//	@NotBlank(message = "Gender is mandatory")
//	private String gender;
//
//	@NotBlank(message = "Address is mandatory")
//	private String address;
//
//	@Lob
//	@Column(name = "image", columnDefinition = "LONGBLOB")
//	private byte[] image;
//
//	@Past(message = "Date of birth must be in the past")
//	private Date dob;
//
//	@NotBlank(message = "Phone number is mandatory")
//	private String phoneNumber;
//
//	@NotBlank(message = "Email is mandatory")
//	@Email(message = "Email should be valid")
//	private String email;

	@OneToMany(mappedBy = "edu_id")
	private List<Education> educations;

	@OneToMany(mappedBy = "job_app_id")
	private List<JobApplications> jobApplications;
}
