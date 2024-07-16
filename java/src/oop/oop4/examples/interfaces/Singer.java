package oop.oop4.examples.interfaces;

public class Singer implements Musician {
    public static int backVocals = 0;
    public static final int VOICE_QTT = 1;
    public Singer() {
        backVocals++;
        backVocals++;
    }

    @Override
    public void play() {
        System.out.println("Vocalista canta.");
    }

    public static void sing() {
        System.out.println("La la la...");
    }
}
