package com.example.gameshop.dtos;

import com.example.gameshop.models.CategoryNames;
import jakarta.validation.constraints.NotNull;

import java.util.UUID;

public record CategoryDTO (
        @NotNull UUID id,
        @NotNull CategoryNames name
) {}
