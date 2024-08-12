package com.exercise.devs.controllers;

import com.exercise.devs.dtos.MutantDTO;
import com.exercise.devs.domain.models.MutantModel;
import com.exercise.devs.domain.service.MutantService;
import com.exercise.devs.dtos.MutantResponseDTO;
import com.exercise.devs.utils.ConvertToDTO;
import com.exercise.devs.utils.PaginationHeaders;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class MutantController {

    private final MutantService mutantService;

    @PostMapping
    @Transactional
    public ResponseEntity<MutantDTO> createMutant(@Valid @RequestBody MutantDTO mutantDTO, UriComponentsBuilder uriBuilder) {
        MutantModel savedMutant = mutantService.saveMutant(mutantDTO);
        String location = uriBuilder.path("/mutants/{id}").buildAndExpand(savedMutant.getId()).toUriString();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Location", location);

        return new ResponseEntity<>(ConvertToDTO.mutant(savedMutant), headers, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<MutantDTO>> listAll(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "3") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<MutantModel> mPage = mutantService.findAllMutants(pageable);
        List<MutantDTO> dtoList = mPage.getContent().stream().map(ConvertToDTO::mutant).collect(Collectors.toList());
        HttpHeaders headers = PaginationHeaders.createPaginationHeaders(mPage);

        return ResponseEntity.ok().headers(headers).body(dtoList);
    }

    @GetMapping("/onschool")
    public ResponseEntity<List<MutantDTO>> findAllOnSchoolGrounds(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "3") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<MutantModel> mPage = mutantService.findAllMutantsOnSchoolGrounds(pageable);
        List<MutantDTO> dtoList = mPage.getContent().stream().map(ConvertToDTO::mutant).collect(Collectors.toList());
        HttpHeaders headers = PaginationHeaders.createPaginationHeaders(mPage);

        return ResponseEntity.ok().headers(headers).body(dtoList);
    }

    @GetMapping("/onschool/count")
    public ResponseEntity<Long> countMutantsInSchool() {
        long count = mutantService.countMutantsOnSchoolGrounds();
        return ResponseEntity.ok(count);
    }

    @PostMapping("/{id}/enter-school")
    @Transactional
    public ResponseEntity<MutantResponseDTO> enterSchool(@PathVariable Long id, @RequestBody String password) {
        MutantModel updatedMutant = mutantService.enterSchool(id, password);
        return ResponseEntity.ok(new MutantResponseDTO("Mutante entrou na escola com sucesso", updatedMutant, true));
    }

    @PostMapping("/{id}/exit-school")
    @Transactional
    public ResponseEntity<MutantResponseDTO> exitSchool(@PathVariable Long id) {
        MutantModel updatedMutant = mutantService.exitSchool(id);
        return ResponseEntity.ok(new MutantResponseDTO("Mutante saiu da escola com sucesso", updatedMutant, false));
    }

    @GetMapping("/should-enlist/{id}")
    public ResponseEntity<Boolean> shouldEnlist(@PathVariable Long id) {
        boolean enlist = mutantService.shouldEnlistInEspada(id);
        return ResponseEntity.ok(enlist);
    }

    @GetMapping("/{id}/enemies-defeated")
    public ResponseEntity<String> calculateEnemiesDefeated(@PathVariable Long id) {
        String response = mutantService.calculateEnemiesDefeated(id);
        return ResponseEntity.ok(response);
    }
}
