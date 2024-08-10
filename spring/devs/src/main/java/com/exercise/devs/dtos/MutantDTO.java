package com.exercise.devs.dtos;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

public record MutantDTO(
        Long id,
        @NotBlank(message = "O nome é obrigatório.") String name,
        @NotBlank(message = "O poder é obrigatório.") String power,
        @Min(value = 1, message = "A idade deve ser maior que zero.") int age,
        @Min(value = 0, message = "O número de inimigos derrotados não pode ser negativo.") int enemiesDefeated,
        boolean onSchoolGrounds) {
}
