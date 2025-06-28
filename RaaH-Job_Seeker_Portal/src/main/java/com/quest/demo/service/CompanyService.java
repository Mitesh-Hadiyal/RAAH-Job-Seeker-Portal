package com.quest.demo.service;

import com.quest.demo.model.Company;

import java.util.List;

public interface CompanyService {
    Company registerCompany(Company company, String email);
    void deleteCompany(long id);
    Company updateCompany(long id, Company company);
    Company getCompanyByEmail(String email);
    void deleteUserByEmail(String email);

    boolean validaterUser(String email,String password);

    List<Company> getAllCompany();
}
