package com.example.exercicio.livro.repository;

import com.example.exercicio.livro.model.LivroModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface LivroRepository extends JpaRepository<LivroModel, UUID> {
    List<LivroModel> findByGenero(String genero);
}
