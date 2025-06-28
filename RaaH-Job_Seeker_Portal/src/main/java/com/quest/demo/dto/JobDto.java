package com.quest.demo.dto;

import com.quest.demo.model.Company;
import com.quest.demo.model.JobApplications;
import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class JobDto {


    private int job_id;
    private String jobTitle;
    private int vacancies;
    private String description;
    private String education;
    private String work_mode;
    private String experience;
    private int salary;
    private String location;
    private Date date;
    private List<JobApplications> jobApplications;
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

