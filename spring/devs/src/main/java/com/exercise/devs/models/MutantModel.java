package com.exercise.devs.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Getter
@NoArgsConstructor(force = true)
@AllArgsConstructor
@Builder(toBuilder = true)
@Table(name = "mutant")
public class MutantModel implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "O nome é obrigatório.")
    private String name;

    @Column(nullable = false)
    @NotBlank(message = "O poder é obrigatório.")
    private String power;

    @Column(nullable = false)
    @Min(value = 1, message = "A idade deve ser maior que zero.")
    private int age;

    @Column(nullable = false)
    @Min(value = 0, message = "O número de inimigos derrotados não pode ser negativo.")
    private int enemiesDefeated;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(nullable = false)
    private boolean onSchoolGrounds;
}
