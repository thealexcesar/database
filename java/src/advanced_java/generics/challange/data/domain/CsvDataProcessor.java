package advanced_java.generics.challange.data.domain;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

public class CsvDataProcessor implements DataProcessor<CsvData> {

    @Override
    public List<CsvData> process(String filePath) {
        try {
            return Files.lines(Paths.get(filePath))
                    .map(line -> line.split(","))
                    .map(CsvData::new)
                    .collect(Collectors.toList());
        } catch (IOException e) {
            throw new RuntimeException("Falha ao processar o arquivo CSV: " + filePath, e);
        }
    }

    @Override
    public void analyze(List<CsvData> data) {
        System.out.println("\nAnalisando dados do CSV:\n-----------------------------------------------");
        data.forEach(System.out::println);
    }
}
