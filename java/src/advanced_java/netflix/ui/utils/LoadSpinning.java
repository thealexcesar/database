package advanced_java.netflix.ui.utils;

public class LoadSpinning implements Runnable {
    private volatile boolean running = true;
    private final long minimumRunTime;
    private final String[] spinner = {"|", "/", "\u2014", "\\"};

    public LoadSpinning(long minimumRunTime) {
        this.minimumRunTime = minimumRunTime;
    }

    public void stop() {
        running = false;
    }

    @Override
    public void run() {
        long startTime = System.currentTimeMillis();
        int index = 0;

        while (running) {
            System.out.print("\rCarregando " + spinner[index % spinner.length]);
            index++;

            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }

            if (System.currentTimeMillis() - startTime >= minimumRunTime) {
                stop();
            }
        }
        System.out.println();
    }
}
