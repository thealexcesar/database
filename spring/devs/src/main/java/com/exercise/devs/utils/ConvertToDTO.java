package com.exercise.devs.utils;

import com.exercise.devs.dtos.MutantDTO;
import com.exercise.devs.domain.models.MutantModel;

public class ConvertToDTO {

    public static MutantDTO mutant(MutantModel m) {
        return new MutantDTO(m.getId(), m.getName(), m.getPower(), m.getAge(), m.getEnemiesDefeated(), m.isOnSchoolGrounds());
    }
}
