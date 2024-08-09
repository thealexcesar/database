package com.exercise.tripsystem.repositories;

import com.exercise.tripsystem.models.DestinationModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface DestinationRepository extends JpaRepository<DestinationModel, Long> {
    Optional<DestinationModel> findByName(String name);
    Page<DestinationModel> findAll(Pageable pageable);
    Page<DestinationModel> findByCountry(String country, Pageable pageable);
}
