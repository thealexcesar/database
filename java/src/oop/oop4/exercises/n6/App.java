package oop.oop4.exercises.n6;

public class App {
    public static void main(String[] args) {
        Printable documento = new Document("Escrevendo no documento .txt com Java", "document.txt");
        Printable imagem = new Image("img.jpg");

        documento.print();
        imagem.print();
    }
}
