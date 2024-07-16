package oop.oop4.examples;

import oop.oop4.examples.interfaces.GuitarPlayer;
import oop.oop4.examples.interfaces.Singer;

public class Main {
    public static void main(String[] args) {
        /* Interfaces and Static
         --------------------------------------------------------------------------------------- */
        Singer s = new Singer();
        Singer.sing();
        s.play();
        final int VOICE_QTT = Singer.VOICE_QTT;
        int singerCounters = Singer.backVocals;
        System.out.printf("%d cantor(es) e %d Back Vocal(s) para cada \n", VOICE_QTT, singerCounters);

        GuitarPlayer g = new GuitarPlayer();
        g.play();
        /* End Interfaces and Static ----------------------------------------------------------- */
    }
}
