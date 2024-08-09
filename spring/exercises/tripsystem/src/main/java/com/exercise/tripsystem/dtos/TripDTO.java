package com.exercise.tripsystem.dtos;

import java.time.LocalDateTime;

public record TripDTO(
        Long id,
        String title,
        String description,
        String transportType,
        int numberOfTickets,
        String status,
        String origin,
        Long destinationId,
        LocalDateTime startDate,
        LocalDateTime endDate,
        LocalDateTime createdAt,
        String customer
) {}
