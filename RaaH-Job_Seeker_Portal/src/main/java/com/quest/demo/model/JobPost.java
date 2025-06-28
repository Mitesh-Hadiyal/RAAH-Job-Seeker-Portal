package com.quest.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.util.List;




@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "job_post")
public class JobPost {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int job_id;
    private String jobTitle;
    private int vacancies;
    private String description;
    private String education;
    private String work_mode;
    private String experience;
    private String skills;
    private int salary;
    private String location;
    private Date date;

    @OneToMany(mappedBy = "job_app_id")
    private List<JobApplications> jobApplications;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @Override
    public String toString() {
        return "JobPost{" +
                "job_id=" + job_id +
                ", jobTitle='" + jobTitle + '\'' +
                ", vacancies=" + vacancies +
                ", description='" + description + '\'' +
                ", education='" + education + '\'' +
                ", work_mode='" + work_mode + '\'' +
                ", experience='" + experience + '\'' +
                ", salary=" + salary +
                ", location='" + location + '\'' +
                ", date=" + date +
                ", company=" + (company != null ? company.getId() + ", " + company.getName() : "null") +
                '}';
    }
}
