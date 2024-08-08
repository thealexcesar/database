package com.example.gameshop.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.math.BigDecimal;
import java.util.UUID;

public record ProductDTO (
        @NotBlank UUID id,
        @NotBlank String name,
        @NotNull BigDecimal price
) {}
