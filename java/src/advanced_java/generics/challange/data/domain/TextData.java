package advanced_java.generics.challange.data.domain;

public class TextData {
    private final String content;

    public TextData(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    @Override
    public String toString() {
        return "Conteúdo: " + content;
    }
}
