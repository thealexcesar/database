package advanced_java.threads.exercises;

public class Main {
    public static void main(String[] args) {
        DownloadTask download1 = new DownloadTask("file1.txt");
        DownloadTask download2 = new DownloadTask("file2.txt");
        DownloadTask download3 = new DownloadTask("file3.txt");
        DownloadTask download4 = new DownloadTask("file4.txt");

        download1.start();
        download2.start();
        download3.start();
        download4.start();

        try {
            download1.join();
            download2.join();
            download3.join();
            download4.join();
        } catch (InterruptedException e) {
            System.err.println("Thread principal interrompida");
        }

        System.out.println("Todos os downloads foram concluídos");
    }
}
