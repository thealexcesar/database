package com.exercise.devs.controllers;

import com.exercise.devs.domain.models.MutantModel;
import com.exercise.devs.domain.service.MutantService;
import com.exercise.devs.dtos.MutantDTO;
import com.exercise.devs.exceptions.UnauthorizedException;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(MutantController.class)
public class MutantControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private MutantService mutantService;

    @Captor
    private ArgumentCaptor<MutantDTO> mutantCaptor;

    @Test
    public void testCreateMutant_Success() throws Exception {
        MutantDTO mutantDTO = new MutantDTO(null, "Mustang", "Alquimia de Fogo", 30, 50, false);

        MutantModel savedMutant = MutantModel.builder()
                .id(1L)
                .name(mutantDTO.name())
                .power(mutantDTO.power())
                .age(mutantDTO.age())
                .enemiesDefeated(mutantDTO.enemiesDefeated())
                .onSchoolGrounds(mutantDTO.onSchoolGrounds())
                .build();

        when(mutantService.saveMutant(any(MutantDTO.class))).thenReturn(savedMutant);

        String responseContent = mockMvc.perform(post("/mutants").contentType(MediaType.APPLICATION_JSON)
                        .content("{ \"name\": \"Mustang\", \"power\": \"Alquimia de Fogo\", \"age\": 30, \"enemiesDefeated\": 50, \"onSchoolGrounds\": false }"))
                .andExpect(status().isCreated()).andExpect(header().string("Location", "http://localhost/mutants/1")).andReturn().getResponse().getContentAsString();
        verify(mutantService).saveMutant(mutantCaptor.capture());

        String expectedResponse = "{\"id\":1,\"name\":\"Mustang\",\"power\":\"Alquimia de Fogo\",\"age\":30,\"enemiesDefeated\":50,\"onSchoolGrounds\":false}";
        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }

    @Test
    public void testEnterSchool_Success() throws Exception {
        LocalDateTime createdAt = LocalDateTime.now();
        MutantModel mutant = MutantModel.builder()
                .id(1L)
                .name("Mustang")
                .power("Alquimia de Fogo")
                .age(30)
                .enemiesDefeated(50)
                .createdAt(createdAt)
                .onSchoolGrounds(true)
                .build();

        when(mutantService.enterSchool(eq(1L), eq("glnyply"))).thenReturn(mutant);
        String responseContent = mockMvc.perform(post("/mutants/1/enter-school")
                        .contentType(MediaType.TEXT_PLAIN)
                        .content("glnyply"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        String expectedResponse = String.format(
                "{\"message\":\"Mutante entrou na escola com sucesso\",\"mutant\":{\"id\":1,\"name\":\"Mustang\",\"power\":\"Alquimia de Fogo\"," +
                        "\"age\":30,\"enemiesDefeated\":50,\"createdAt\":\"%s\",\"onSchoolGrounds\":true},\"enter\":true}", createdAt);

        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }

    @Test
    public void testExitSchool_Success() throws Exception {
        LocalDateTime createdAt = LocalDateTime.now();

        MutantModel mutant = MutantModel.builder()
                .id(1L)
                .name("Mustang")
                .power("Alquimia de Fogo")
                .age(30)
                .enemiesDefeated(50)
                .createdAt(createdAt)
                .onSchoolGrounds(false)
                .build();

        when(mutantService.exitSchool(eq(1L))).thenReturn(mutant);

        String responseContent = mockMvc.perform(post("/mutants/1/exit-school"))
                .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();

        String expectedResponse = String.format(
                "{\"message\":\"Mutante saiu da escola com sucesso\",\"mutant\":{\"id\":1,\"name\":\"Mustang\",\"power\":\"Alquimia de Fogo\"," +
                        "\"age\":30,\"enemiesDefeated\":50,\"createdAt\":\"%s\",\"onSchoolGrounds\":false},\"enter\":false}",createdAt);

        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }


    @Test
    public void testCountMutantsInSchool() throws Exception {
        when(mutantService.countMutantsOnSchoolGrounds()).thenReturn(5L);

        String responseContent = mockMvc.perform(get("/mutants/onschool/count"))
                .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();

        String expectedResponse = "5";
        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }

    @Test
    public void testListMutantsInSchool() throws Exception {
        MutantModel mutant1 = MutantModel.builder()
                .id(1L)
                .name("Mustang")
                .power("Alquimia de Fogo")
                .age(30)
                .enemiesDefeated(50)
                .onSchoolGrounds(true)
                .build();

        MutantModel mutant2 = MutantModel.builder()
                .id(2L)
                .name("Cyclops")
                .power("Optic Blast")
                .age(28)
                .enemiesDefeated(20)
                .onSchoolGrounds(true)
                .build();

        Page<MutantModel> page = new PageImpl<>(List.of(mutant1, mutant2));
        when(mutantService.findAllMutantsOnSchoolGrounds(any(Pageable.class))).thenReturn(page);
        String responseContent = mockMvc.perform(get("/mutants/onschool").param("page", "1")
                        .param("size", "2")).andExpect(status().isOk()).andReturn().getResponse().getContentAsString();

        String expectedResponse = "[{\"id\":1,\"name\":\"Mustang\",\"power\":\"Alquimia de Fogo\",\"age\":30,\"enemiesDefeated\":50,\"onSchoolGrounds\":true}," +
                "{\"id\":2,\"name\":\"Cyclops\",\"power\":\"Optic Blast\",\"age\":28,\"enemiesDefeated\":20,\"onSchoolGrounds\":true}]";

        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }

    @Test
    public void testShouldEnlistInEspada_True() throws Exception {
        when(mutantService.shouldEnlistInEspada(eq(1L))).thenReturn(true);

        String responseContent = mockMvc.perform(get("/mutants/should-enlist/1"))
                .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();

        String expectedResponse = "true";
        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }

    @Test
    public void testShouldEnlistInEspada_False() throws Exception {
        when(mutantService.shouldEnlistInEspada(eq(1L))).thenReturn(false);

        String responseContent = mockMvc.perform(get("/mutants/should-enlist/1"))
                .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();

        String expectedResponse = "false";
        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }

    @Test
    public void testCalculateEnemiesDefeated() throws Exception {
        String expected = "Alienígenas derrotados: 13.40, Demônios derrotados: 21.60";
        when(mutantService.calculateEnemiesDefeated(eq(1L)))
                .thenReturn(expected);

        String responseContent = mockMvc.perform(get("/mutants/1/enemies-defeated"))
                .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();

        assertEquals(expected, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expected);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }

    @Test
    public void testEnterSchool_Unauthorized() throws Exception {
        when(mutantService.enterSchool(eq(1L), eq("wrongpassword")))
                .thenThrow(new UnauthorizedException("Falha na autenticação."));

        String responseContent = mockMvc.perform(post("/mutants/1/enter-school")
                        .contentType(MediaType.TEXT_PLAIN).content("wrongpassword"))
                .andExpect(status().isUnauthorized()).andReturn().getResponse().getContentAsString();

        String expectedResponse = "Falha na autenticação.";
        assertEquals(expectedResponse, responseContent);
        System.out.println("\n\u001B[33mEsperado: " + "\u001B[0m" + expectedResponse);
        System.out.println("\u001B[32mRetorno: " + "\u001B[0m" + responseContent);
    }
}
