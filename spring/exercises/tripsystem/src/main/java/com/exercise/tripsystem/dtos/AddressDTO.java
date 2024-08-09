package com.exercise.tripsystem.dtos;

public record AddressDTO(
        Long id,
        String cep,
        String street,
        Integer number,
        String neighborhood,
        String city,
        String state,
        String referencePoint
) {}
