package com.mslu.applicant.repos;

import com.mslu.applicant.entity.User;
import com.mslu.applicant.entity.references.TypeDocument;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
    User findByDocTypeAndDocSeriesAndDocNumberOrEmail(TypeDocument id, String series, String number, String email);
    User findByDocTypeAndDocSeriesAndDocNumber(TypeDocument id, String series, String number);

    User findByActivationCode(String code);
}
