package com.mslu.applicant.repos;

import com.mslu.applicant.entity.Profile;
import com.mslu.applicant.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfileRepository extends JpaRepository<Profile,Integer> {
    Profile findByUser(User user);
    Profile findById(Long id);
}
