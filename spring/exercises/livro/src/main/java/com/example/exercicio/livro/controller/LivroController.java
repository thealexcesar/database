package com.example.exercicio.livro.controller;

import com.example.exercicio.livro.dto.LivroDTO;
import com.example.exercicio.livro.dto.LivroUpdateDTO;
import com.example.exercicio.livro.model.LivroModel;
import com.example.exercicio.livro.repository.LivroRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.List;
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
    public ResponseEntity<List<LivroDTO>> getAllLivros(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<LivroModel> livrosPage = livroRepository.findAll(pageable);
        List<LivroDTO> livrosDTO = livrosPage.getContent().stream().map(this::convertToDTO).collect(Collectors.toList());

        HttpHeaders headers = createPaginationHeaders(livrosPage);

        return ResponseEntity.ok().headers(headers).body(livrosDTO);
    }

    @GetMapping("/genero/{genero}")
    public ResponseEntity<List<LivroDTO>> getLivrosByGenero(@PathVariable String genero) {
        List<LivroDTO> livrosDTO = livroRepository.findByGenero(genero)
                .stream().map(this::convertToDTO).collect(Collectors.toList());

        if (livrosDTO.isEmpty()) return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        return ResponseEntity.ok(livrosDTO);
    }

    @PostMapping
    public ResponseEntity<LivroDTO> addLivro(@RequestBody LivroDTO livroDTO) {
        LivroModel livro = new LivroModel(
                null,
                livroDTO.titulo(),
                livroDTO.autor(),
                livroDTO.genero(),
                livroDTO.ano(),
                LocalDateTime.now()
        );
        LivroModel savedLivro = livroRepository.save(livro);
        URI location = UriComponentsBuilder.fromPath("/livro/{id}").buildAndExpand(savedLivro.getId()).toUri();
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(location);

        return ResponseEntity.status(HttpStatus.CREATED).headers(headers).body(convertToDTO(savedLivro));
    }

    @PutMapping("/{id}")
    public ResponseEntity<LivroDTO> updateLivro(@PathVariable UUID id, @RequestBody LivroUpdateDTO livroUpdateDTO) {
        return livroRepository.findById(id).map(livroExistente -> {
            LivroModel livroAtualizado = new LivroModel(
                    livroExistente.getId(),
                        livroUpdateDTO.titulo(),
                        livroUpdateDTO.autor(),
                        livroUpdateDTO.genero(),
                        livroUpdateDTO.ano(),
                        livroExistente.getCreatedAt()
            );
            LivroModel savedLivro = livroRepository.save(livroAtualizado);
            return ResponseEntity.ok(convertToDTO(savedLivro));
        }).orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).body(null));
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
        return new LivroDTO(
                livro.getId(),
                livro.getTitulo(),
                livro.getAutor(),
                livro.getGenero(),
                livro.getAno(),
                livro.getCreatedAt()
        );
    }

    private static HttpHeaders createPaginationHeaders(Page<LivroModel> livrosPage) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Pages", String.valueOf(livrosPage.getTotalPages()));
        headers.add("X-Total-Elements", String.valueOf(livrosPage.getTotalElements()));
        headers.add("X-Current-Page", String.valueOf(livrosPage.getNumber() + 1));
        headers.add("X-Page-Size", String.valueOf(livrosPage.getSize()));
        return headers;
    }

}
