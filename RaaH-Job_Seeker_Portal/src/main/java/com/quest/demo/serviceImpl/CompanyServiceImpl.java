package com.quest.demo.serviceImpl;

import com.quest.demo.Repo.CompanyRepo;
import com.quest.demo.execption.ResourceNotFoundException;
import com.quest.demo.model.Company;
import com.quest.demo.model.User;
import com.quest.demo.service.CompanyService;
import com.quest.demo.service.SendEmailService;
import com.sendgrid.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.xml.validation.Validator;
import java.util.List;
import java.util.Optional;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyRepo companyRepo;
    @Autowired
    private SendEmailService sendEmailService;


    @Override
    public Company registerCompany(Company company, String email) {
        System.out.println("emter in service impl");
        Company companyUser=null;
        try {
            companyUser = this.companyRepo.findByEmail(email).get();
        }
        catch (Exception e){
            System.out.println("Exception finding enail addresss");
        }

        System.out.println("companyUser "+companyUser);
        Company save=null;
        if(companyUser==null){
            System.out.println("Email is empty");
            save = this.companyRepo.save(company);
        }else{
            System.out.println("throwing execption");
           new RuntimeException("Email Address already Present !!!!!");
        }
        Response sendEmail = sendEmailService.sendEmail(company.getEmail());
        return save;
    }

    @Override
    public void deleteUserByEmail(String email)
    {
        System.out.println("email"+email);
        Company company = companyRepo.findByEmail(email).orElseThrow(()->new ResourceNotFoundException("User Not Found by Email "+email));
        companyRepo.delete(company);
    }

    @Override
    public void deleteCompany(long id) {
        this.companyRepo.deleteById(id);
    }

    @Override
    public Company updateCompany(long id, Company company) {
     Company companyUser=this.companyRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Email Address Not Found"));

        Company save = this.companyRepo.save(company);
        return save;
    }

    @Override
    public Company getCompanyByEmail(String email) {
     Company companyUser  =this.companyRepo.findByEmail(email).get();
        return companyUser;
    }

    @Override
    public boolean validaterUser(String email, String password) {
     Company company =companyRepo.findByEmail(email).orElseThrow(()-> new ResourceNotFoundException("Email I'd Not Found::" +email));

        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        if(bCryptPasswordEncoder.matches(password, company.getPassword())){
            return true;
        }
//        if (company.getPassword().equals(password)) {
//            return true;
//        }
        return false;

}

    @Override
    public List<Company> getAllCompany() {
      List<Company> companies=this.companyRepo.findAll();
      return  companies;
    }
}
