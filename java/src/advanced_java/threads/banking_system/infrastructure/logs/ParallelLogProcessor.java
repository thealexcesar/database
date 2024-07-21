package advanced_java.threads.banking_system.infrastructure.logs;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

public class ParallelLogProcessor {
    private final ExecutorService executorService;

    public ParallelLogProcessor(int numberOfThreads) {
        this.executorService = Executors.newFixedThreadPool(numberOfThreads);
    }

    public int processLogs(List<String> filePaths, String word) throws InterruptedException, ExecutionException {
        List<Future<Integer>> futures = new ArrayList<>();
        for (String filePath : filePaths) {
            LogProcessor logProcessor = new LogProcessor(filePath, word);
            futures.add(executorService.submit(logProcessor));
        }

        int totalOccurrences = 0;
        for (Future<Integer> future : futures) {
            totalOccurrences += future.get();
        }

        executorService.shutdown();
        executorService.awaitTermination(1, TimeUnit.HOURS);

        return totalOccurrences;
    }
}
