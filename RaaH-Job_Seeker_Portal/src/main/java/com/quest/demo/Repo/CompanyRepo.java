package com.quest.demo.Repo;

import com.quest.demo.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CompanyRepo extends JpaRepository<Company,Long> {

    @Override
    List<Company> findAll();

    Optional<Company> findByEmail(String email);
}
