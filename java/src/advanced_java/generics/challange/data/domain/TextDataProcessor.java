package advanced_java.generics.challange.data.domain;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

public class TextDataProcessor implements DataProcessor<TextData> {

    @Override
    public List<TextData> process(String filePath) {
        try {
            return Files.lines(Paths.get(filePath))
                    .map(TextData::new)
                    .collect(Collectors.toList());
        } catch (IOException e) {
            throw new RuntimeException("Falha ao processar o arquivo de texto: " + filePath, e);
        }
    }

    @Override
    public void analyze(List<TextData> data) {
        System.out.println("\nAnalisando dados de texto:\n-----------------------------------------------");
        data.forEach(System.out::println);
    }
}
