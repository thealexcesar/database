package com.example.gameshop.controllers;

import com.example.gameshop.models.ProductModel;
import com.example.gameshop.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/product")
public class ProductController {
    @Autowired
    ProductRepository productRepository;

    @GetMapping
    public ResponseEntity<List<ProductModel>> getAllProducts() {
        return ResponseEntity.status(HttpStatus.OK).body(productRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductModel> getProductById(@PathVariable(value="id") UUID id) {
        Optional<ProductModel> product = productRepository.findById(id);
        ResponseEntity response = ResponseEntity.status(HttpStatus.OK).body(product);
        if (product.isEmpty()) response = ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produto não encontrado.");
        return response;
    }

    @PostMapping
    public ResponseEntity<ProductModel> addProduct(@RequestBody ProductModel product) {
        return ResponseEntity.status(HttpStatus.CREATED).body(productRepository.save(product));
    }

    /* @PutMapping("/{id}")
    public ResponseEntity<Object> updateProduct(@PathVariable(value = "id") UUID id, @RequestBody ProductModel updatedProduct) {
        Optional<ProductModel> product = productRepository.findById(id);
        if (product.isEmpty()) return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produto não encontrado.");

        ProductModel existingProduct = product.get();
        existingProduct.setName(updatedProduct.getName());
        existingProduct.setPrice(updatedProduct.getPrice());

        return ResponseEntity.status(HttpStatus.OK).body(productRepository.save(existingProduct));
    }*/


    @DeleteMapping("/{id}")
    public ResponseEntity<ProductModel> deleteProduct(@PathVariable(value="id") UUID id) {
        Optional<ProductModel> product = productRepository.findById(id);
        if (product.isEmpty()) {
            System.out.println("Nao encontrado");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(product.orElse(new ProductModel()));
        } else {
            productRepository.deleteById(id);
            return ResponseEntity.status(HttpStatus.OK).body(product.get());
        }
    }
}
