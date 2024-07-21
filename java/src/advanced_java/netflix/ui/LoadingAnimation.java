package advanced_java.netflix.ui;

public class LoadingAnimation implements Runnable {
    private volatile boolean running = true;

    public void stop() {
        running = false;
    }

    @Override
    public void run() {
        String[] animation = {".", "..", "..."};
        int index = 0;

        while (running) {
            System.out.print("\rCarregando " + animation[index % animation.length]);
            index++;

            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
