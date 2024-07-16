package oop.assignments.rpg.service;

import assignments.rpg.domain.Character;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

public class Battle {

    private List<Character> players;
    private List<Character> enemies;
    private Scanner scanner;

    public Battle(List<Character> players, List<Character> enemies, Scanner scanner) {
        this.players = players;
        this.enemies = enemies;
        this.scanner = scanner;
    }

    public List<Character> determineTurnOrder() {
        List<Character> turnOrder = new ArrayList<>(players);
        turnOrder.addAll(enemies);
        turnOrder.sort(Comparator.comparingInt(Character::getStrength).reversed());
        return turnOrder;
    }

    public void startBattle() {
        while (!isBattleOver()) {
            for (Character character : determineTurnOrder()) {
                if (character.getScore() > 0) {
                    character.applyEffects();
                    if (character.getScore() > 0) {
                        if (players.contains(character)) {
                            playerTurn(character);
                        } else {
                            enemyTurn(character);
                        }
                    }
                }
                checkAndRemoveDefeatedCharacters();
                if (isBattleOver()) break;
            }
        }
        endBattle();
    }

    private void playerTurn(Character player) {
        while (true) {
            try {
                System.out.printf("\nTurno de %s. Escolha uma ação:\n", player.getName());
                System.out.println("1. Atacar");
                System.out.println("2. Usar habilidade");
                System.out.println("3. Defender");
                System.out.println("4. Correr");
                System.out.print("Digite o número da opção: ");
                int choice = Integer.parseInt(scanner.nextLine());

                Character target = selectTarget(player);
                if (target == null) {
                    System.out.println("Nenhum alvo disponível.");
                    return;
                }

                switch (choice) {
                    case 1:
                        player.attack(target);
                        return;
                    case 2:
                        if (!player.getAbilities().isEmpty()) {
                            player.performAction(target);
                        } else {
                            System.out.println("Nenhuma habilidade disponível. Atacando normalmente.");
                            player.attack(target);
                        }
                        return;
                    case 3:
                        System.out.printf("%s se defende e reduz o dano recebido no próximo turno.%n", player.getName());
                        player.setDefense(player.getDefense() + 10);
                        return;
                    case 4:
                        if (Math.random() < 0.5) {
                            System.out.printf("%s conseguiu fugir!%n", player.getName());
                            players.remove(player);
                        } else {
                            System.out.printf("%s falhou ao tentar fugir.%n", player.getName());
                        }
                        return;
                    default:
                        System.out.println("Opção inválida. Tente novamente.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida. Digite um número.");
            }
        }
    }

    private void enemyTurn(Character enemy) {
        Character target = selectTarget(enemy);
        if (target != null) {
            enemy.performAction(target);
        }
    }

    private Character selectTarget(Character character) {
        List<Character> targets = new ArrayList<>();
        if (enemies.contains(character)) {
            targets.addAll(players);
        } else {
            targets.addAll(enemies);
        }
        targets.removeIf(target -> target.getScore() <= 0);
        return targets.isEmpty() ? null : targets.get(0);
    }

    private void checkAndRemoveDefeatedCharacters() {
        players.removeIf(player -> player.getScore() <= 0);
        enemies.removeIf(enemy -> enemy.getScore() <= 0);
    }

    private boolean isBattleOver() {
        return players.isEmpty() || enemies.isEmpty();
    }

    private void endBattle() {
        System.out.println("\nBatalha finalizada!");
    }
}
