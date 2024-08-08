package com.example.exercicio.livro.dto;

import java.util.UUID;

public record LivroDTO(UUID id, String titulo, String autor, String genero, int ano) {
}
