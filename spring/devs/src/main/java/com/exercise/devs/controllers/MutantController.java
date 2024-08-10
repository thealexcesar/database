package com.exercise.devs.controllers;

import com.exercise.devs.dtos.MutantDTO;
import com.exercise.devs.models.MutantModel;
import com.exercise.devs.repositories.MutantRepository;
import com.exercise.devs.service.MutantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/mutants")
public class MutantController {
    private final MutantService mutantService;
    private final MutantRepository mutantRepository;

    @Autowired
    public MutantController(MutantService mutantService, MutantRepository mutantRepository) {
        this.mutantService = mutantService;
        this.mutantRepository = mutantRepository;
    }

    @PostMapping("/create")
    public ResponseEntity<MutantDTO> createMutant(@RequestBody MutantDTO mutantDTO, UriComponentsBuilder uriBuilder) {
        MutantModel savedMutant = mutantService.saveMutant(mutantDTO);

        String location = uriBuilder.path("/mutants/create/{id}")
                .buildAndExpand(savedMutant.getId())
                .toUriString();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", location);

        return new ResponseEntity<>(convertToDTO(savedMutant), headers, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<MutantDTO>> listAll(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "3") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<MutantModel> mutantPage = mutantRepository.findAll(pageable);
        List<MutantDTO> dtoList = mutantPage.getContent().stream().map(this::convertToDTO).collect(Collectors.toList());
        HttpHeaders headers = createPaginationHeaders(mutantPage);

        return ResponseEntity.ok().headers(headers).body(dtoList);
    }

    @GetMapping("/onschool")
    public ResponseEntity<List<MutantDTO>> findAllOnSchoolGrounds(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "3") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<MutantModel> mutantsPage = mutantService.findAllMutantsOnSchoolGrounds(pageable);
        List<MutantDTO> dtoList = mutantsPage.getContent().stream().map(this::convertToDTO).collect(Collectors.toList());
        HttpHeaders headers = createPaginationHeaders(mutantsPage);

        return ResponseEntity.ok().headers(headers).body(dtoList);
    }

    @PostMapping("/{id}/enter-school")
    public ResponseEntity<MutantDTO> enterSchool(@PathVariable Long id, @RequestBody String password) {
        MutantModel updatedMutant = mutantService.enterSchool(id, password);
        return ResponseEntity.ok(convertToDTO(updatedMutant));
    }

    @PostMapping("/{id}/exit-school")
    public ResponseEntity<Void> exitSchool(@PathVariable Long id) {
        mutantService.exitSchool(id);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/should-enlist/{id}")
    public ResponseEntity<Boolean> shouldEnlist(@PathVariable Long id) {
        boolean enlist = mutantService.shouldEnlistInEspada(id);
        return ResponseEntity.ok(enlist);
    }

    private MutantDTO convertToDTO(MutantModel m) {
        return new MutantDTO(m.getName(),m.getPower(),m.getAge(),m.getEnemiesDefeated(),m.isOnSchoolGrounds());
    }

    private static HttpHeaders createPaginationHeaders(Page<?> page) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Total-Pages", String.valueOf(page.getTotalPages()));
        headers.add("X-Total-Elements", String.valueOf(page.getTotalElements()));
        headers.add("X-Current-Page", String.valueOf(page.getNumber() + 1));
        headers.add("X-Page-Size", String.valueOf(page.getSize()));
        return headers;
    }
}
