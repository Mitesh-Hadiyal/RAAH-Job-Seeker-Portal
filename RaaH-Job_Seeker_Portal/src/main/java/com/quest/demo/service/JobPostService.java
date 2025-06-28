package com.quest.demo.service;

import com.quest.demo.dto.JobDto;
import com.quest.demo.model.Company;
import com.quest.demo.model.JobPost;
import com.quest.demo.model.User;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface JobPostService {
    void addJobPost(JobPost jobPost);

    List<JobPost> getPostsByCompanyId(long id);

//    List<JobPost> search(String query);

//    List<JobPost> getPostsByCompanyId(long companyId);

    List<JobDto> searchbyJobTitle(String keyword);

}
