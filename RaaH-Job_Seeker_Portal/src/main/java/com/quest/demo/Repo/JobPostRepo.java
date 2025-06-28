package com.quest.demo.Repo;

import com.quest.demo.model.JobPost;
import com.quest.demo.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface JobPostRepo extends JpaRepository<JobPost,Long> {
//    @Override
//    Optional<JobPost> findById(Long aLong);

//    List<JobPost> findByTextContaining(String location);


    @Override
    List<JobPost> findAll();

    @Override
    Optional<JobPost> findById(Long id);

    List<JobPost> findByJobTitleContaining(String name);


    @Query(value = "SELECT j FROM job_post j WHERE j.jobTitle LIKE '%' || :title || '%' ")
    List<JobPost> findByEmailLike(@Param("title") String title);
}
