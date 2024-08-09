package com.exercise.tripsystem.controllers;

import com.exercise.tripsystem.dtos.DestinationDTO;
import com.exercise.tripsystem.models.DestinationModel;
import com.exercise.tripsystem.repositories.DestinationRepository;
import com.exercise.tripsystem.utils.errors.ErrorResponse;
import com.exercise.tripsystem.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/destinations")
public class DestinationController {

    @Autowired
    private DestinationRepository destinationRepository;

    @GetMapping
    public ResponseEntity<List<DestinationDTO>> getAllTripsFiltered(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "3") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<DestinationModel> destinationPage = destinationRepository.findAll(pageable);
        List<DestinationDTO> destinations = destinationPage.getContent().stream().map(this::convertToDTO).collect(Collectors.toList());
        HttpHeaders headers = Pagination.createPaginationHeaders(destinationPage);

        return ResponseEntity.ok().headers(headers).body(destinations);
    }

    @GetMapping("/{id}")
    public ResponseEntity<DestinationDTO> getDestinationById(@PathVariable Long id) {
        return destinationRepository.findById(id).map(destination -> ResponseEntity.ok(
                convertToDTO(destination))).orElse(ResponseEntity.notFound().build()
        );
    }

    /**
     * Retorna uma lista de destinos por país.
     * @param country O nome do país para filtrar os destinos.
     * @param page Qual página você quer ver (começa em 1).
     * @param size Quantos destinos você quer ver por página.
     * @param sortBy O campo pelo qual os destinos devem ser ordenados (por exemplo, "createdAt").
     * @return Uma lista paginada de destinos no país especificado.
     */
    @GetMapping("/country/{country}")
    public ResponseEntity<List<DestinationDTO>> getDestinationsByCountry(
            @PathVariable String country,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy) {

        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<DestinationModel> destinationPage = destinationRepository.findByCountry(country, pageable);
        List<DestinationDTO> destinationDTOs = destinationPage.getContent().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        HttpHeaders headers = Pagination.createPaginationHeaders(destinationPage);

        return ResponseEntity.ok().headers(headers).body(destinationDTOs);
    }

    @PostMapping
    public ResponseEntity<?> createDestination(@RequestBody DestinationDTO destinationDTO) {
        Optional<DestinationModel> existingDestination = destinationRepository.findByName(destinationDTO.name());

        if (existingDestination.isPresent()) {
            String message = "Já existe um destino com o nome '" + destinationDTO.name() + "'.";
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ErrorResponse(message));
        }
        DestinationModel destination = DestinationModel.builder()
                .name(destinationDTO.name())
                .city(destinationDTO.city())
                .uf(destinationDTO.uf())
                .country(destinationDTO.country())
                .createdAt(LocalDateTime.now())
                .build();

        DestinationModel savedDestination = destinationRepository.save(destination);
        DestinationDTO savedDestinationDTO = convertToDTO(savedDestination);

        return ResponseEntity.status(HttpStatus.CREATED).body(savedDestinationDTO);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateDestination(@PathVariable Long id, @RequestBody DestinationDTO destinationDTO) {
        try {
            Optional<DestinationModel> existingDestination = destinationRepository.findById(id);
            if (!existingDestination.isPresent())
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Destino com ID: \""+id+"\" não encontrado.");

            DestinationModel destinationToUpdate = existingDestination.get();
            destinationToUpdate = DestinationModel.builder()
                    .id(destinationToUpdate.getId())
                    .name(destinationDTO.name())
                    .city(destinationDTO.city())
                    .uf(destinationDTO.uf())
                    .country(destinationDTO.country())
                    .createdAt(destinationToUpdate.getCreatedAt())
                    .build();

            destinationRepository.save(destinationToUpdate);
            return ResponseEntity.ok(convertToDTO(destinationToUpdate));
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("O nome do Destino deve ser único.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Erro interno: "+e.getMessage());
        }
    }


    private DestinationDTO convertToDTO(DestinationModel destination) {
        return new DestinationDTO(destination.getId(),destination.getName(),destination.getCity(),destination.getUf(), destination.getCountry());
    }
}
