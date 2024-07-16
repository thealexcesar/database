package assignments.rpg.service;

import assignments.rpg.domain.Character;
import assignments.rpg.domain.Warrior;
import assignments.rpg.domain.Mage;
import assignments.rpg.domain.Archer;
import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BattleTest extends TestCase {

    public void testDetermineTurnOrder() {
        Warrior warrior = new Warrior("Warrior", 100, 20, 10, 0, 0.1);
        Mage mage = new Mage("Mage", 80, 15, 5, 30, 0.05);
        Archer archer = new Archer("Archer", 90, 18, 7, 0, 0.15);

        List<Character> players = new ArrayList<>();
        players.add(warrior);

        List<Character> enemies = new ArrayList<>();
        enemies.add(mage);
        enemies.add(archer);

        Scanner scanner = new Scanner(System.in);
        Battle battle = new Battle(players, enemies, scanner);
        List<Character> turnOrder = battle.determineTurnOrder();

        assertEquals(warrior, turnOrder.get(0));
        assertEquals(archer, turnOrder.get(1));
        assertEquals(mage, turnOrder.get(2));
    }

    public void testStartBattle() {
        Warrior warrior = new Warrior("Warrior", 100, 20, 10, 0, 0.1);
        Mage mage = new Mage("Mage", 80, 15, 5, 30, 0.05);
        Archer archer = new Archer("Archer", 90, 18, 7, 0, 0.15);

        List<Character> players = new ArrayList<>();
        players.add(warrior);

        List<Character> enemies = new ArrayList<>();
        enemies.add(mage);
        enemies.add(archer);

        Scanner scanner = new Scanner(System.in);
        Battle battle = new Battle(players, enemies, scanner);
        battle.startBattle();

        boolean playersDefeated = players.isEmpty();
        boolean enemiesDefeated = enemies.isEmpty();

        assertTrue(playersDefeated || enemiesDefeated);
    }
}
