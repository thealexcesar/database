"use strict";
let nome = "Pedro";
let idade = 10;
let teste = "1";
let alunos = ["aa", "bb", "cc"];
alunos.push("g"); //adiciona item ao vetor/lista
let teste2 = ["Mauro", 20, true];
console.log(`Nome: ${teste2[0]} Idade: ${teste2[1]} Tem Cachorro: ${teste2[2] ? "sim" : "nao"}`);
var Direcao;
(function (Direcao) {
    Direcao[Direcao["Cima"] = 0] = "Cima";
    Direcao[Direcao["Baixo"] = 1] = "Baixo";
    Direcao[Direcao["Esquerda"] = 2] = "Esquerda";
    Direcao[Direcao["Direita"] = 3] = "Direita";
})(Direcao || (Direcao = {}));
let diorecaoAtual = Direcao.Cima;
console.log(diorecaoAtual); // saida -> 0
console.log(Direcao[0]); // -> "Cima"
var Cores;
(function (Cores) {
    Cores["Vermelho"] = "VERMELHO";
    Cores["Verde"] = "VERDE";
    Cores["Azul"] = "Azul";
})(Cores || (Cores = {}));
let corFavorita = Cores.Verde;
console.log(corFavorita);
var Comandos;
(function (Comandos) {
    Comandos["Pulo"] = "A";
    Comandos["Ataque"] = "S";
    Comandos["Defesa"] = "SHIFT";
})(Comandos || (Comandos = {}));
var Misturado;
(function (Misturado) {
    Misturado[Misturado["Numero"] = 1] = "Numero";
    Misturado["Texto"] = "ABC";
})(Misturado || (Misturado = {}));
var Status;
(function (Status) {
    Status[Status["Ativo"] = 0] = "Ativo";
    Status[Status["Inativo"] = 1] = "Inativo";
    Status[Status["Suspenso"] = 2] = "Suspenso";
})(Status || (Status = {}));
var Tamanho;
(function (Tamanho) {
    Tamanho[Tamanho["Pequeno"] = 32] = "Pequeno";
    Tamanho[Tamanho["Medio"] = 38] = "Medio";
    Tamanho[Tamanho["Grande"] = 44] = "Grande";
})(Tamanho || (Tamanho = {}));
let aluno1 = {
    nome: "marcio",
    idade: 10,
    matricula: 544548
};
let cep = 2222222;
let user1 = {
    id: 1,
    email: "blili@gmail.com"
};
let meuNumero = "booo";
