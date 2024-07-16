package oop.Game;

import java.util.Scanner;

public class Battle {
    private Person fighter1;
    private Person fighter2;
    private Scanner scanner;

    public Battle(Person fighter1, Person fighter2) {
        this.fighter1 = fighter1;
        this.fighter2 = fighter2;
        this.scanner = new Scanner(System.in);
    }

    public void simulateBattle() {
        System.out.println("Início da Batalha:");
        System.out.println(fighter1.getNome() + " vs " + fighter2.getNome());
        System.out.println("----------------------");

        boolean fighter1Turn = true;

        while (fighter1.getVida() > 0 && fighter2.getVida() > 0) {
            if (fighter1Turn) {
                performTurn(fighter1, fighter2);
            } else {
                performTurn(fighter2, fighter1);
            }
            fighter1Turn = !fighter1Turn;

            System.out.println("----------------------");
            System.out.println(fighter1.getNome() + ": " + fighter1.getVida() + " vs " +
                    fighter2.getNome() + ": " + fighter2.getVida());
            System.out.println("----------------------");
        }

        // Verifica o resultado da batalha
        if (fighter1.getVida() <= 0) {
            System.out.println(fighter2.getNome() + " venceu a batalha!");
        } else {
            System.out.println(fighter1.getNome() + " venceu a batalha!");
        }
        System.out.println("Fim da Batalha!");
    }

    private void performTurn(Person attacker, Person target) {
        System.out.println("Turno de " + attacker.getNome() + ":");

        int action = selectAction(attacker);

        switch (action) {
            case 1: // Atacar
                attacker.atacar(target);
                break;
            case 2: // Defender
                attacker.defender();
                break;
            default:
                System.out.println("Ação inválida! Tente novamente.");
                break;
        }
    }

    private int selectAction(Person person) {
        System.out.println("Escolha uma ação para " + person.getNome() + ":");
        System.out.println("1. Atacar");
        System.out.println("2. Defender");
        return scanner.nextInt();
    }
}
