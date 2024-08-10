package com.exercise.devs.controllers;

import com.exercise.devs.dtos.MutantDTO;
import com.exercise.devs.models.MutantModel;
import com.exercise.devs.service.MutantService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/mutants")
public class MutantController {

    private final MutantService mutantService;

    public MutantController(MutantService mutantService) {
        this.mutantService = mutantService;
    }

    @PostMapping("/create")
    public ResponseEntity<MutantModel> createMutant(@RequestBody MutantDTO mutantDTO) {
        MutantModel mutant = new MutantModel(
                null,
                mutantDTO.name(),
                mutantDTO.power(),
                mutantDTO.age(),
                mutantDTO.enemiesDefeated(),
                false
        );
        MutantModel savedMutant = mutantService.saveMutant(mutant);
        return ResponseEntity.ok(savedMutant);
    }

    @GetMapping("/onschoolgrounds")
    public ResponseEntity<List<MutantModel>> findAllOnSchoolGrounds() {
        List<MutantModel> mutants = mutantService.findAllMutantsOnSchoolGrounds();
        return ResponseEntity.ok(mutants);
    }

    @PostMapping("/{id}/enter-school")
    public ResponseEntity<MutantModel> enterSchool(@PathVariable Long id, @RequestBody String password) {
        if (mutantService.authenticateMutant(password)) {
            MutantModel updatedMutant = mutantService.updateSchoolEntryStatus(id, true);
            return ResponseEntity.ok(updatedMutant);
        } else {
            return ResponseEntity.status(403).body(null);
        }
    }

    @PostMapping("/{id}/exit-school")
    public ResponseEntity<Void> exitSchool(@PathVariable Long id) {
        mutantService.updateSchoolEntryStatus(id, false);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/should-enlist/{id}")
    public ResponseEntity<Boolean> shouldEnlist(@PathVariable Long id) {
        boolean enlist = mutantService.shouldEnlistInEspada(id);
        return ResponseEntity.ok(enlist);
    }
}