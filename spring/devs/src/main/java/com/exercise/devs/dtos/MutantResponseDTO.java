package com.exercise.devs.dtos;

import com.exercise.devs.domain.models.MutantModel;

public record MutantResponseDTO (String message, MutantModel mutant, boolean enter) {}
