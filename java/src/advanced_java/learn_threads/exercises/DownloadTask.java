package advanced_java.learn_threads.exercises;

import java.util.Random;

public class DownloadTask extends Thread {
    private String fileName;
    private Random random;

    public DownloadTask(String fileName) {
        this.fileName = fileName;
        this.random = new Random();
    }

    public void run() {
        try {
            int totalProgressUpdates = 10;
            int totalDownloadTime = 1000 * (random.nextInt(10) + 1);
            int sleepInterval = totalDownloadTime / totalProgressUpdates;

            System.out.println("Fazendo Download: " + fileName + ": ");

            for (int i = 1; i <= totalProgressUpdates; i++) {
                Thread.sleep(sleepInterval);
                int percentCompleted = i * 10;
                // System.out.print(percentCompleted + "% "); FIXME!
            }

            System.out.println("Download concluido: " + fileName);

        } catch (InterruptedException e) {
            System.err.println("Download interropido: " + fileName + "Erro: " + e.getMessage());
        }
    }
}
