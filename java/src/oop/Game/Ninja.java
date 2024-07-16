package oop.Game;

public class Ninja extends Person {
    // Atributos específicos de Ninja

    public Ninja(String nome, int vida) {
        super(nome, Village.KONOHA, Clan.UZUMAKI, vida, 100, 50, 30, 40, 50, 60,
                SpecialType.HOKAGE, SpecialAbility.RINNEGAN, JutsuType.NINJUTSU, 30);
        // Inicialização específica de Ninja, se necessário
    }

    @Override
    public void atacar(Person alvo) {
        int dano = calcularDano(alvo);
        alvo.receberDano(dano);
        System.out.println(getNome() + " atacou " + alvo.getNome() + " causando " + dano + " de dano.");
    }

    @Override
    public void defender() {
        System.out.println(getNome() + " está se defendendo.");
        // Lógica de defesa do Ninja, se necessário
    }

    @Override
    public void receberDano(int dano) {
        System.out.println(getNome() + " recebeu " + dano + " de dano.");
        super.receberDano(dano); // Chama o método da classe Person para atualizar a vida
    }
}
