package com.mslu.applicant.repos;

import com.mslu.applicant.entity.Log;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LogRepository extends JpaRepository<Log, Long> {
}
