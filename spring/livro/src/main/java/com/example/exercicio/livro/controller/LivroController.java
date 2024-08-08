package com.example.exercicio.livro.controller;

import com.example.exercicio.livro.dto.LivroDTO;
import com.example.exercicio.livro.dto.LivroUpdateDTO;
import com.example.exercicio.livro.model.LivroModel;
import com.example.exercicio.livro.repository.LivroRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/livro")
@Validated
public class LivroController {
    private final LivroRepository livroRepository;

    public LivroController(LivroRepository livroRepository) {
        this.livroRepository = livroRepository;
    }

    @GetMapping
    public ResponseEntity<List<LivroDTO>> getAllLivros() {
        List<LivroDTO> livrosDTO = livroRepository.findAll().stream().map(this::convertToDTO).collect(Collectors.toList());
        return ResponseEntity.ok(livrosDTO);
    }

    @GetMapping("/genero/{genero}")
    public ResponseEntity<List<LivroDTO>> getLivrosByGenero(@PathVariable String genero) {
        List<LivroDTO> livrosDTO = livroRepository.findByGenero(genero).stream().map(this::convertToDTO).collect(Collectors.toList());
        if (livrosDTO.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        return ResponseEntity.ok(livrosDTO);
    }

    @PostMapping
    public ResponseEntity<LivroDTO> addLivro(@RequestBody LivroDTO livroDTO) {
        LivroModel livro = new LivroModel(null, livroDTO.titulo(), livroDTO.autor(), livroDTO.genero(), livroDTO.ano());
        LivroModel savedLivro = livroRepository.save(livro);
        return ResponseEntity.status(HttpStatus.CREATED).body(convertToDTO(savedLivro));
    }

    @PutMapping("/{id}")
    public ResponseEntity<LivroDTO> updateLivro(@PathVariable UUID id, @RequestBody LivroUpdateDTO livroUpdateDTO) {
        Optional<LivroModel> livroOptional = livroRepository.findById(id);

        if (livroOptional.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        LivroModel livroExistente = livroOptional.get();

        LivroModel livroAtualizado = new LivroModel(
                livroExistente.getId(),livroUpdateDTO.titulo(),livroUpdateDTO.autor(),livroUpdateDTO.genero(),livroUpdateDTO.ano()
        );

        LivroModel savedLivro = livroRepository.save(livroAtualizado);
        return ResponseEntity.ok(convertToDTO(savedLivro));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteLivro(@PathVariable UUID id) {
        if (!livroRepository.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Livro não encontrado.");
        }
        livroRepository.deleteById(id);
        return ResponseEntity.ok("Livro deletado com sucesso.");
    }

    private LivroDTO convertToDTO(LivroModel livro) {
        return new LivroDTO(livro.getId(),livro.getTitulo(),livro.getAutor(),livro.getGenero(),livro.getAno());
    }
}
