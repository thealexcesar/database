package com.exercise.tripsystem.controllers;

import com.exercise.tripsystem.dtos.TripDTO;
import com.exercise.tripsystem.utils.errors.ErrorResponse;
import com.exercise.tripsystem.utils.errors.NotFoundException;
import com.exercise.tripsystem.models.DestinationModel;
import com.exercise.tripsystem.models.TripModel;
import com.exercise.tripsystem.models.enums.TransportType;
import com.exercise.tripsystem.models.enums.StatusType;
import com.exercise.tripsystem.repositories.DestinationRepository;
import com.exercise.tripsystem.repositories.TripRepository;
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
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/trips")
public class TripController {

    @Autowired
    private TripRepository tripRepository;

    @Autowired
    private DestinationRepository destinationRepository;

    @GetMapping
    public ResponseEntity<List<TripDTO>> getAllTripsFiltered(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy
    ) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<TripModel> tripPage = tripRepository.findAll(pageable);
        List<TripDTO> trips = tripPage.getContent().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        HttpHeaders headers = Pagination.createPaginationHeaders(tripPage);

        return ResponseEntity.ok().headers(headers).body(trips);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TripDTO> getTripById(@PathVariable Long id) {
        return tripRepository.findById(id)
                .map(trip -> ResponseEntity.ok(convertToDTO(trip)))
                .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Retorna todas as viagens filtrando por Cliente.
     * @param page Qual página dos resultados você quer (começa em 1).
     * @param size Quantas viagens você quer ver por página.
     * @param sortBy O campo pelo qual as viagens devem ser ordenadas (por exemplo, "createdAt").
     * @return Uma lista paginada de viagens para o cliente especificado.
     */
    @GetMapping("/customer/{customer}")
    public ResponseEntity<List<TripDTO>> getTripsByCustomer(
            @PathVariable String customer,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy) {

        Pageable pageable = PageRequest.of(page - 1, size, Sort.by(sortBy));
        Page<TripModel> tripPage = tripRepository.findByCustomer(customer, pageable);
        List<TripDTO> tripDTOs = tripPage.getContent().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        HttpHeaders headers = Pagination.createPaginationHeaders(tripPage);

        return ResponseEntity.ok().headers(headers).body(tripDTOs);
    }

    @PostMapping
    public ResponseEntity<?> createTrip(@RequestBody TripDTO tripDTO, UriComponentsBuilder uriBuilder) {
        Optional<TripModel> existingTrip = tripRepository.findByTitle(tripDTO.title());
        if (existingTrip.isPresent()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Já existe uma viagem com o título '" + tripDTO.title() + "'.");
        }

        DestinationModel destination = destinationRepository.findById(tripDTO.destinationId())
                .orElseThrow(() -> new NotFoundException("Destino não encontrado com ID: " + tripDTO.destinationId()));

        TripModel trip = TripModel.builder()
                .title(tripDTO.title())
                .description(tripDTO.description())
                .transportType(TransportType.valueOf(tripDTO.transportType()))
                .numberOfTickets(tripDTO.numberOfTickets())
                .status(StatusType.valueOf(tripDTO.status()))
                .origin(tripDTO.origin())
                .destination(destination)
                .startDate(tripDTO.startDate())
                .endDate(tripDTO.endDate())
                .customer(tripDTO.customer())
                .createdAt(LocalDateTime.now())
                .build();

        TripModel savedTrip = tripRepository.save(trip);

        URI location = uriBuilder.path("/trips/{id}").buildAndExpand(savedTrip.getId()).toUri();
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(location);

        return ResponseEntity.created(location).body(convertToDTO(savedTrip));
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateTrip(@PathVariable Long id, @RequestBody TripDTO tripDTO) {
        try {
            TripModel trip = tripRepository.findById(id)
                    .orElseThrow(() -> new NotFoundException("Viagem não encontrada com ID: " + id));

            DestinationModel destination = destinationRepository.findById(tripDTO.destinationId())
                    .orElseThrow(() -> new NotFoundException("Destino não encontrado com ID: " + tripDTO.destinationId()));

            TripModel updatedTrip = TripModel.builder()
                    .id(trip.getId())
                    .title(tripDTO.title())
                    .description(tripDTO.description())
                    .transportType(TransportType.valueOf(tripDTO.transportType()))
                    .numberOfTickets(tripDTO.numberOfTickets())
                    .status(StatusType.valueOf(tripDTO.status()))
                    .origin(tripDTO.origin())
                    .destination(destination)
                    .startDate(tripDTO.startDate())
                    .endDate(tripDTO.endDate())
                    .customer(tripDTO.customer())
                    .createdAt(trip.getCreatedAt())
                    .build();

            TripModel savedTrip = tripRepository.save(updatedTrip);

            return ResponseEntity.ok(convertToDTO(savedTrip));
        } catch (NotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ErrorResponse("Não encontrado: " + e.getMessage()));
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(new ErrorResponse("Conflito de dados: " + e.getMessage()));
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ErrorResponse("Dados inválidos: " + e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new ErrorResponse("Erro interno: " + e.getMessage()));
        }
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTrip(@PathVariable Long id) {
        TripModel trip = tripRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Viagem com ID: \"" + id+"\" não encontrada."));

        tripRepository.delete(trip);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/destinations/{destinationId}/trips")
    public ResponseEntity<List<TripDTO>> getTripsByDestination(@PathVariable Long destinationId) {
        List<TripModel> trips = tripRepository.findByDestinationId(destinationId);
        List<TripDTO> tripDTOs = trips.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(tripDTOs);
    }

    private TripDTO convertToDTO(TripModel trip) {
        return new TripDTO(
                trip.getId(),
                trip.getTitle(),
                trip.getDescription(),
                trip.getTransportType().getTransport(),
                trip.getNumberOfTickets(),
                trip.getStatus().getStatus(),
                trip.getOrigin(),
                trip.getDestination().getId(),
                trip.getStartDate(),
                trip.getEndDate(),
                trip.getCreatedAt(),
                trip.getCustomer()
        );
    }
}
