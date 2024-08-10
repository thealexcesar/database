package com.exercise.devs.service;

import com.exercise.devs.models.MutantModel;
import com.exercise.devs.repositories.MutantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MutantService {

    private static final String ENIGMA_JAOBSOB_PASSWORD = "Treinamento";

    @Autowired
    private MutantRepository mutantRepository;

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
        return ENIGMA_JAOBSOB_PASSWORD.equals(password);
    }

    public MutantModel updateSchoolEntryStatus(Long mutantId, boolean entering) {
        MutantModel mutant = mutantRepository.findById(mutantId).orElseThrow(() -> new RuntimeException("Mutant not found"));

        MutantModel updatedMutant = new MutantModel(
                mutant.getId(),
                mutant.getName(),
                mutant.getPower(),
                mutant.getAge(),
                mutant.getEnemiesDefeated(),
                entering
        );

        return mutantRepository.save(updatedMutant);
    }

    public List<MutantModel> findAllMutantsOnSchoolGrounds() {
        return mutantRepository.findAllByOnSchoolGroundsTrue();
    }

    public MutantModel saveMutant(MutantModel mutant) {
        return mutantRepository.save(mutant);
    }
}
