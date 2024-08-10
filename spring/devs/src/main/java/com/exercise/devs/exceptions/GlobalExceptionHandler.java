package com.exercise.devs.exceptions;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<List<ValidationErrorDetails>> handleValidationExceptions(MethodArgumentNotValidException ex) {
        List<ValidationErrorDetails> errors = ex.getBindingResult().getFieldErrors()
                .stream().map(ValidationErrorDetails::new).collect(Collectors.toList());
        return ResponseEntity.badRequest().body(errors);
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<String> handleDataIntegrityViolationException(DataIntegrityViolationException ex) {
        return ResponseEntity.status(409).body("Nome do mutante já existe. Tente outro.");
    }

    @ExceptionHandler(UnauthorizedException.class)
    public ResponseEntity<String> handleUnauthorizedException(UnauthorizedException ex) {
        return ResponseEntity.status(401).body(ex.getMessage());
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleGeneralException(Exception ex) {
        return ResponseEntity.status(500).body("Erro interno no servidor: " + ex.getMessage());
    }

    private record ValidationErrorDetails(String field, String message) {
        public ValidationErrorDetails(FieldError error) {
            this(error.getField(), error.getDefaultMessage());
        }
    }
}
