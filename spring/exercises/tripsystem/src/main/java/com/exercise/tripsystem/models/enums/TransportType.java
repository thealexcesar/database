package com.exercise.tripsystem.models.enums;

public enum TransportType {
    BUS("Ônibus"),
    BOAT("Barco"),
    CAR("Carro"),
    PLANE("Avião"),
    TRAIN("Trem");

    private final String transport;

    TransportType(String transport) {
        this.transport = transport;
    }

    public String getTransport() {
        return transport;
    }
}
