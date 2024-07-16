package assignments.rpg.domain;

import junit.framework.TestCase;

public class WarriorTest extends TestCase {

    public void testIsWeakTo() {
        Warrior warrior = new Warrior("Warrior", 100, 20, 10, 0, 0.1);
        assertFalse(warrior.isWeakTo(AbilityType.FIRE));
        assertTrue(warrior.isWeakTo(AbilityType.MAGIC));
    }

    public void testAttack() {
        Warrior warrior = new Warrior("Guerreiro", 100, 20, 10, 0, 0.1);
        Enemy enemy = new Enemy("Goblin", 50, 10, 5, "Monster", 20, 20, 10);

        warrior.attack(enemy);
        assertEquals(35, enemy.getScore());
    }

    public void testGetWeaponType() {
        Warrior warrior = new Warrior("Guerreiro", 100, 20, 10, 0, 0.1);
        warrior.setWeaponType("Espada");

        assertEquals("Espada", warrior.getWeaponType());
    }

    public void testSetWeaponType() {
        Warrior warrior = new Warrior("Guerreiro", 100, 20, 10, 0, 0.1);
        warrior.setWeaponType("Martelo");

        assertEquals("Martelo", warrior.getWeaponType());
    }
}
