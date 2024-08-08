package com.example.exercicio.livro.dto;

import java.time.LocalDate;

public record LivroUpdateDTO(String titulo, String autor, String genero, int ano, LocalDate createdAt) {
}
