package oop.oop4.exercises.n6;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Image implements Printable {
    private String image;

    public Image(String image) {
        this.image = image;
    }

    @Override
    public void print() {
        String imagePath = "./" + image;

        try (InputStream inputStream = Image.class.getResourceAsStream(image)) {
            if (inputStream == null) {
                throw new IOException("Recurso " + image + " não encontrado.");
            }

            String outputPath = "./" + image;

            try (OutputStream outputStream = new FileOutputStream(outputPath)) {
                byte[] buffer = new byte[1024];
                int length;
                while ((length = inputStream.read(buffer)) > 0) {
                    outputStream.write(buffer, 0, length);
                }
                System.out.println(image + " copiada com sucesso para a pasta atual.");
            }
        } catch (IOException e) {
            System.err.println("Erro ao copiar " + image + ": " + e.getMessage());
        }
    }
}
