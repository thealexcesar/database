package oop.Game;

import java.util.Random;

public abstract class Person {
    private String nome;
    private Village aldeia;
    private Clan clan;
    private int vida;
    private int chakra;
    private int ataque;
    private int defesa;
    private int velocidade;
    private int inteligencia;
    private int resistencia;
    private SpecialType tipoEspecial;
    private SpecialAbility habilidadeEspecial;
    private int experiencia;
    private JutsuType tipoJutsu;
    private int mana;

    public Person(String nome, Village aldeia, Clan clan, int vida, int chakra, int ataque, int defesa,
                  int velocidade, int inteligencia, int resistencia, SpecialType tipoEspecial,
                  SpecialAbility habilidadeEspecial, JutsuType tipoJutsu, int mana) {
        this.nome = nome;
        this.aldeia = aldeia;
        this.clan = clan;
        this.vida = vida;
        this.chakra = chakra;
        this.ataque = ataque;
        this.defesa = defesa;
        this.velocidade = velocidade;
        this.inteligencia = inteligencia;
        this.resistencia = resistencia;
        this.tipoEspecial = tipoEspecial;
        this.habilidadeEspecial = habilidadeEspecial;
        this.experiencia = 0;
        this.tipoJutsu = tipoJutsu;
        this.mana = mana;
    }

    public String getNome() {
        return nome;
    }

    public int getVida() {
        return vida;
    }

    protected int calcularDano(Person alvo) {
        int dano = this.ataque - alvo.defesa;
        return dano > 0 ? dano : 0;
    }

    public void atacar(Person alvo) {
        int dano = calcularDano(alvo);
        alvo.receberDano(dano);
        System.out.println(this.nome + " atacou " + alvo.nome + " causando " + dano + " de dano.");
    }

    public void receberDano(int dano) {
        this.vida -= dano;
        if (this.vida < 0) {
            this.vida = 0;
        }
        System.out.println(this.nome + " recebeu " + dano + " de dano.");
    }

    public void usarHabilidadeEspecial(Person alvo) {
        if (this.habilidadeEspecial == SpecialAbility.SHARINGAN) {
            System.out.println(this.nome + " ativou Sharingan contra " + alvo.nome);
        } else if (this.habilidadeEspecial == SpecialAbility.RINNEGAN) {
            System.out.println(this.nome + " ativou Rinnegan contra " + alvo.nome);
        } else if (this.habilidadeEspecial == SpecialAbility.AMATERASU) {
            System.out.println(this.nome + " lançou Amaterasu contra " + alvo.nome);
        }
    }

    public void defender() {
        int defesaAdicional = 10;
        this.defesa += defesaAdicional;
        System.out.println(this.nome + " está defendendo.");
    }

    public void fugir() {
        Random rand = new Random();
        boolean escapou = rand.nextBoolean();
        if (escapou) {
            System.out.println(this.nome + " conseguiu fugir da batalha!");
        } else {
            System.out.println(this.nome + " tentou fugir, mas não conseguiu!");
        }
    }

    public void ganharExperiencia(int quantidade) {
        this.experiencia += quantidade;
        System.out.println(this.nome + " ganhou " + quantidade + " de experiência.");
    }

    @Override
    public String toString() {
        return "Person{" +
                "nome='" + nome + '\'' +
                ", aldeia=" + aldeia +
                ", clan=" + clan +
                ", vida=" + vida +
                ", chakra=" + chakra +
                ", ataque=" + ataque +
                ", defesa=" + defesa +
                ", velocidade=" + velocidade +
                ", inteligencia=" + inteligencia +
                ", resistencia=" + resistencia +
                ", tipoEspecial=" + tipoEspecial +
                ", habilidadeEspecial=" + habilidadeEspecial +
                ", experiencia=" + experiencia +
                ", tipoJutsu=" + tipoJutsu +
                ", mana=" + mana +
                '}';
    }
}
