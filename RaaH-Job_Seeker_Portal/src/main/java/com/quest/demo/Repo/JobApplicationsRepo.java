package com.quest.demo.Repo;

import com.quest.demo.model.JobApplications;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobApplicationsRepo extends JpaRepository<JobApplications, Integer> {
    @Override
    <S extends JobApplications> S save(S entity);


}
