package com.exercise.devs.service;

import com.exercise.devs.dtos.MutantDTO;
import com.exercise.devs.models.MutantModel;
import com.exercise.devs.repositories.MutantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MutantService {

    private static final String ENIGMA_JAOBSOB_PASSWORD = "Treinamento";
    private final MutantRepository mutantRepository;

    public Page<MutantModel> findAllMutants(Pageable pageable) {
        return mutantRepository.findAll(pageable);
    }

    public Page<MutantModel> findAllMutantsOnSchoolGrounds(Pageable pageable) {
        return mutantRepository.findAllByOnSchoolGroundsTrue(pageable);
    }

    public double calculateAliensDefeated(int enemiesDefeated) {
        return enemiesDefeated * 0.268;
    }

    public double calculateDemonsDefeated(int enemiesDefeated) {
        return enemiesDefeated * 0.432;
    }

    public boolean shouldEnlistInEspada(Long mutantId) {
        MutantModel mutant = mutantRepository.findById(mutantId)
                .orElseThrow(() -> new RuntimeException("Mutant not found"));
        return calculateAliensDefeated(mutant.getEnemiesDefeated()) > 20;
    }

    public boolean authenticateMutant(String password) {
        System.out.println("Senha recebida: " + password);
        System.out.println("Senha esperada: " + ENIGMA_JAOBSOB_PASSWORD);
        return ENIGMA_JAOBSOB_PASSWORD.equals(password);
    }

    public MutantModel enterSchool(Long mutantId, String password) {
        if (!authenticateMutant(password)) {
            throw new RuntimeException("Authentication failed");
        }
        return updateSchoolEntryStatus(mutantId, true);
    }

    public void exitSchool(Long mutantId) {
        updateSchoolEntryStatus(mutantId, false);
    }

    private MutantModel updateSchoolEntryStatus(Long mutantId, boolean entering) {
        MutantModel mutant = mutantRepository.findById(mutantId)
                .orElseThrow(() -> new RuntimeException("Mutant not found"));

        MutantModel updatedMutant = MutantModel.builder()
                .id(mutant.getId())
                .name(mutant.getName())
                .power(mutant.getPower())
                .age(mutant.getAge())
                .enemiesDefeated(mutant.getEnemiesDefeated())
                .onSchoolGrounds(entering)
                .createdAt(mutant.getCreatedAt())
                .build();

        return mutantRepository.save(updatedMutant);
    }

    public MutantModel saveMutant(MutantDTO mutantDTO) {
        MutantModel mutant = MutantModel.builder()
                .name(mutantDTO.name())
                .power(mutantDTO.power())
                .age(mutantDTO.age())
                .enemiesDefeated(mutantDTO.enemiesDefeated())
                .onSchoolGrounds(false)
                .build();

        return mutantRepository.save(mutant);
    }
}
