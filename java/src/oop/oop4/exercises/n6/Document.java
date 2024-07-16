package oop.oop4.exercises.n6;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Document implements Printable {
    private String content;
    private String file;

    public Document(String content, String file) {
        this.content = content;
        this.file = file;
    }

    @Override
    public void print() {
        String documentoPath = "./" + file;

        try (PrintWriter writer = new PrintWriter(new FileWriter(documentoPath))) {
            writer.println(content);
            System.out.println(file + " criado com sucesso na pasta atual.");
        } catch (IOException e) {
            System.err.println("Erro ao criar " + file + ": " + e.getMessage());
        }
    }
}
