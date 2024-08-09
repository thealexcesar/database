package com.exercise.tripsystem.models.enums;

public enum StatusType {
    AVAILABLE("Disponível"),
    CANCELLED("Cancelado"),
    FULLY_BOOKED("Esgotado");

    private final String status;

    StatusType(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
