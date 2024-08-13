"use strict";
class Especie {
    constructor(nome, alimentação) {
        this.nome = nome;
        this.alimentação = alimentação;
    }
}
class Animal {
    constructor(nome, especie, cor) {
        this.nome = nome;
        this.especie = especie;
        this.cor = cor;
    }
    verDados() {
        return `Nome: ${this.nome} - ${this.especie} ${this.cor}`;
    }
}
let e1 = new Especie("Gato", "Onívoro");
let a1 = new Animal("Vertmithor", e1, "Nú");
function verValor(valor) {
    return valor;
}
let n1 = verValor(30);
let palavra = verValor("Cabeçalho");
const somar = (n1, n2) => {
    return n1 + n2;
};
console.log(somar(2, 3));
let numero_texto = {
    primeiroValor: 1,
    segundoValor: "um"
};
function receberDado(dado) {
    return typeof dado === "string" ? `É um texto: ${dado}` : dado * 2;
}
let a3 = new Animal("Baaa", e1, "azul");
console.log(typeof a3);
let palavrona = "a";
palavrona = true;
// let input:HTMLInputElement = document.querySelector("input") as HTMLInputElement
let aaaaaa = "aaaaaaaaaaaaaaaaaaaa";
