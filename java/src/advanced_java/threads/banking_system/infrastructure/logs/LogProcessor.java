package advanced_java.threads.banking_system.infrastructure.logs;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.Callable;

public class LogProcessor implements Callable<Integer> {
    private final String filePath;
    private final String word;

    public LogProcessor(String filePath, String word) {
        this.filePath = filePath;
        this.word = word;
    }

    @Override
    public Integer call() {
        int count = 0;
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                count += countOccurrences(line, word);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return count;
    }

    private int countOccurrences(String line, String word) {
        int count = 0;
        int index = 0;
        while ((index = line.indexOf(word, index)) != -1) {
            count++;
            index += word.length();
        }
        return count;
    }
}
