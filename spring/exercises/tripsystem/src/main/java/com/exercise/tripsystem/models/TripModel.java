package com.exercise.tripsystem.models;

import com.exercise.tripsystem.models.enums.TransportType;
import com.exercise.tripsystem.models.enums.StatusType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "trips")
@Getter
@Builder
@AllArgsConstructor
public class TripModel implements Serializable {
    private final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false, unique = true)
    private String title;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private TransportType transportType;

    @Column(nullable = false)
    private int numberOfTickets;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private StatusType status;

    @Column(nullable = false)
    private String code;

    @Column(nullable = false)
    private String origin;

    @Column(nullable = false)
    private String customer;

    @Column(nullable = false)
    private LocalDateTime startDate;

    @Column(nullable = false)
    private LocalDateTime endDate;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    @ManyToOne
    @JoinColumn(name = "destination_id", nullable = false)
    private DestinationModel destination;

    public TripModel() {
        this.code = generateUniqueCode();
    }

    private String generateUniqueCode() {
        return "tchuqui-tchuqui-" + UUID.randomUUID().toString().split("-")[0];
    }
}
