package com.exercise.tripsystem;

import com.exercise.tripsystem.models.enums.UfType;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.UUID;

@SpringBootApplication
public class TripSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(TripSystemApplication.class, args);
        System.out.println("chave: " + UfType.RS); // FIXME remove
        System.out.println("valor " + UfType.RS.getUf()); // FIXME remove
        System.out.println("tchuqui-tchuqui-"+UUID.randomUUID().toString().split("-")[0]); // FIXME remove
    }

}
