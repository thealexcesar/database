package com.exercise.tripsystem.repositories;

import com.exercise.tripsystem.models.TripModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TripRepository extends JpaRepository<TripModel, Long> {
    List<TripModel> findByDestinationId(Long destinationId);
    Optional<TripModel> findByTitle(String title);
    Page<TripModel> findByCustomer(String customer, Pageable pageable);
}
