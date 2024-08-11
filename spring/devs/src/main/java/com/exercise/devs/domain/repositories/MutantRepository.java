package com.exercise.devs.domain.repositories;

import com.exercise.devs.domain.models.MutantModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MutantRepository extends JpaRepository<MutantModel, Long> {
    Page<MutantModel> findAllByOnSchoolGroundsTrue(Pageable pageable);
    long countByOnSchoolGroundsTrue();
}
