package com.exercise.devs.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@Getter
@NoArgsConstructor(force = true)
@AllArgsConstructor
@Table(name="mutant")
public class MutantModel implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private final Long id;

    @NotBlank
    private final String name;

    @NotBlank
    private final String power;

    @Min(1)
    private final int age;

    @Min(0)
    private final int enemiesDefeated;

    private final boolean onSchoolGrounds;
}
