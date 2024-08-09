package com.exercise.tripsystem.dtos;

import com.exercise.tripsystem.models.enums.UfType;

public record DestinationDTO(
        Long id,
        String name,
        String city,
        UfType uf,
        String country
) {}
