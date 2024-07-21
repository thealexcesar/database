package advanced_java.threads.banking_system.infrastructure.logs;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class LogFileHandler {
    private final String filePath;

    public LogFileHandler(String filePath) {
        this.filePath = filePath;
    }

    public synchronized void writeLog(String logEntry) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(logEntry);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
