package com.quest.demo.serviceImpl;

import com.quest.demo.Repo.CompanyRepo;
import com.quest.demo.Repo.JobPostRepo;
import com.quest.demo.dto.JobDto;
import com.quest.demo.model.Company;
import com.quest.demo.model.JobPost;
import com.quest.demo.service.JobPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Iterator;
import java.util.List;

@Service
public class JobPostServiceImpl implements JobPostService {

    @Autowired
    private JobPostRepo jobPostRepository;

    @Autowired
    private CompanyRepo companyRepository;

    @Override
    public void addJobPost(JobPost jobPost) {
        // Assume company_id is available in jobPost (e.g., set through a form)
        if (jobPost.getCompany() != null) {
            Long companyId = jobPost.getCompany().getId();
            Company company = companyRepository.findById(companyId)
                    .orElseThrow(() -> new RuntimeException("Company not found"));
            jobPost.setCompany(company);
        }
        jobPostRepository.save(jobPost);
    }

    @Override
    public List<JobPost> getPostsByCompanyId(long id) {

        List<JobPost> all = jobPostRepository.findAll();
        System.out.println("impl...." +all.size());
        Iterator<JobPost> it = all.iterator();

        JobPost jobPost = null;
        int c=0;
        while (it.hasNext())
        {
            System.out.println("impl....in while");
            System.out.println("it.next() : "+it.next());
            System.out.println("it.next().getCompany().getId() : "+it.next().getCompany().getId());
            System.out.println("IIIIDDDDD ::::"+id);

            if(it.next().getCompany().getId() == id){
                System.out.println("IFFFFFFF");
                try {
                     jobPost = it.next();
                }catch (Exception ex)
                {
                    System.out.println("Exception : "+ex);
                }

                System.out.println("JOBPOST :"+jobPost.toString());
                all.add(jobPost);
                System.out.println("C : "+c);
            }
        }
        System.out.println("impl....END" +all.size());
        System.out.println("Enddddddddddddddd count : "+c);

        System.out.println("byId : "+all.toString());
        return all;
    }

    public List<JobPost> findJobsByEmailLike(String title) {
        return jobPostRepository.findByEmailLike(title);
    }

    @Override
    public List<JobDto> searchbyJobTitle(String keyword) {
        return null;
    }

//    @Override
//    public List<JobPost> search(String query) {
//        // Implement your search logic here, e.g., querying a database
//        return jobPostRepository.findByTextContaining(query);
//    }


    public JobPost getJobpostByID(int id)
    {
        List<JobPost> jobPostList = jobPostRepository.findAll();
        JobPost jobPost = new JobPost();
        Iterator<JobPost> it = jobPostList.iterator();
        while (it.hasNext()) {
            if (it.next().getJob_id() == id) {
                jobPost = it.next();
                System.out.println("POST : :  : "+jobPost);
            }
        }
        return jobPost;
    }
}
