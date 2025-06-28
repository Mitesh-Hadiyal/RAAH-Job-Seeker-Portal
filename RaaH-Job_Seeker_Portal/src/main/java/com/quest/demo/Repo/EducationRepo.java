package com.quest.demo.Repo;

import com.quest.demo.model.Education;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EducationRepo extends JpaRepository<Education, Long> {

}
