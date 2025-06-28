package com.quest.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.util.List;


import java.sql.Blob;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @NotNull
    @Size(min=5 , message = "atleast 5 character")
    private String name;
    private String email;
    private String password;

    @Size(min = 5,message = "atleast 5 digit")
    private String mobile;
    private String address;
    private Date establised_year;
    private String website;
    @Lob
    @Column(name = "image", columnDefinition = "LONGBLOB")
    private  byte[] image;


    @OneToMany(mappedBy = "job_id")
    private List<JobPost> jobPostList;

    @OneToMany(mappedBy = "job_app_id")
    private List<JobApplications> jobApplications;

}
