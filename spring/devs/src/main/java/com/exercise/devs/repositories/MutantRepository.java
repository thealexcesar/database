package com.exercise.devs.repositories;

import com.exercise.devs.models.MutantModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MutantRepository extends JpaRepository<MutantModel, Long> {
    List<MutantModel> findAllByOnSchoolGroundsTrue();
}
