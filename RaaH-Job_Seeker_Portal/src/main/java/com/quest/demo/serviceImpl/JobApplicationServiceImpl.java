package com.quest.demo.serviceImpl;

import com.quest.demo.Repo.JobApplicationsRepo;
import com.quest.demo.model.JobApplications;
import com.quest.demo.service.JobApplicationsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JobApplicationServiceImpl implements JobApplicationsService{

    @Autowired
    private JobApplicationsRepo jobApplicationsRepo;


    @Override
    public void applyJob(JobApplications jobApplications) {
        jobApplicationsRepo.save(jobApplications);
    }
}
