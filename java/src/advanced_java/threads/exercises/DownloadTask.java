package advanced_java.threads.exercises;

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

            System.out.println("Fazendo Download: " + fileName);

            int progress = 0;
            while (progress <= 100) {
                Thread.sleep(sleepInterval);
                String progressBar = "=".repeat(progress / 10) + " ".repeat(10 - progress / 10);
                System.out.print("\r" + progress + "% [" + progressBar + "]");
                progress += 10;
            }
            System.out.println("\nDownload concluído: " + fileName);

        } catch (InterruptedException e) {
            System.err.println("Download interrompido: " + fileName + " Erro: " + e.getMessage());
        }
    }

}
