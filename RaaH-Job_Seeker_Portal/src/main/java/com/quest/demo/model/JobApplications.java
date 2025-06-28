package com.quest.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobApplications {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int job_app_id;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private JobPost jobPost;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    public int getJob_app_id() {
        return job_app_id;
    }

    public void setJob_app_id(int job_app_id) {
        this.job_app_id = job_app_id;
    }

    public JobPost getJobPost() {
        return jobPost;
    }

    public void setJobPost(JobPost jobPost) {
        this.jobPost = jobPost;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
