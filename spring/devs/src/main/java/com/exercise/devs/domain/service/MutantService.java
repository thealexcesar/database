package com.exercise.devs.domain.service;

import com.exercise.devs.domain.repositories.MutantRepository;
import com.exercise.devs.dtos.MutantDTO;
import com.exercise.devs.exceptions.UnauthorizedException;
import com.exercise.devs.domain.models.MutantModel;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class MutantService {

    private static final String ENIGMA_JAOBSOB_PASSWORD = "glnyply";

    private final MutantRepository mutantRepository;

    public Page<MutantModel> findAllMutants(Pageable pageable) {
        return mutantRepository.findAll(pageable);
    }

    public Page<MutantModel> findAllMutantsOnSchoolGrounds(Pageable pageable) {
        return mutantRepository.findAllByOnSchoolGroundsTrue(pageable);
    }

    public long countMutantsOnSchoolGrounds() {
        return mutantRepository.countByOnSchoolGroundsTrue();
    }

    public boolean shouldEnlistInEspada(Long mutantId) {
        MutantModel mutant = getMutantById(mutantId);
        return calculateAliensDefeated(mutant.getEnemiesDefeated()) > 20;
    }

    public MutantModel enterSchool(Long mutantId, String password) {
        if (!authenticateMutant(password)) throw new UnauthorizedException("Falha na autenticação.");
        return updateSchoolEntryStatus(mutantId, true);
    }

    public MutantModel exitSchool(Long mutantId) {
        return updateSchoolEntryStatus(mutantId, false);
    }

    public MutantModel saveMutant(MutantDTO mutantDTO) {
        MutantModel mutant;
        if (mutantDTO.id() == null) {
            mutant = MutantModel.builder()
                    .name(mutantDTO.name())
                    .power(mutantDTO.power())
                    .age(mutantDTO.age())
                    .enemiesDefeated(mutantDTO.enemiesDefeated())
                    .onSchoolGrounds(mutantDTO.onSchoolGrounds())
                    .createdAt(LocalDateTime.now())
                    .build();
        } else {
            MutantModel existingMutant = getMutantById(mutantDTO.id());
            mutant = existingMutant.toBuilder()
                    .name(mutantDTO.name())
                    .power(mutantDTO.power())
                    .age(mutantDTO.age())
                    .enemiesDefeated(mutantDTO.enemiesDefeated())
                    .onSchoolGrounds(mutantDTO.onSchoolGrounds())
                    .createdAt(existingMutant.getCreatedAt())
                    .build();
        }
        return mutantRepository.save(mutant);
    }


    public String calculateEnemiesDefeated(Long mutantId) {
        MutantModel mutant = getMutantById(mutantId);
        double aliens = calculateAliensDefeated(mutant.getEnemiesDefeated());
        double demons = calculateDemonsDefeated(mutant.getEnemiesDefeated());

        return String.format("Alienígenas derrotados: %.2f, Demônios derrotados: %.2f", aliens, demons);
    }

    private double calculateAliensDefeated(int enemiesDefeated) {
        return enemiesDefeated * 0.268;
    }

    private double calculateDemonsDefeated(int enemiesDefeated) {
        return enemiesDefeated * 0.432;
    }

    private boolean authenticateMutant(String password) {
        return ENIGMA_JAOBSOB_PASSWORD.equals(password);
    }

    public MutantModel updateSchoolEntryStatus(Long mutantId, boolean entering) {
        MutantModel mutant = getMutantById(mutantId);
        mutant = mutant.toBuilder().onSchoolGrounds(entering).build();
        return mutantRepository.save(mutant);
    }

    private MutantModel getMutantById(Long mutantId) {
        return mutantRepository.findById(mutantId).orElseThrow(() -> new RuntimeException("Mutante não encontrado"));
    }
}
