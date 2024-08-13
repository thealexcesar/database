let nome:string = "Pedro"
let idade:number = 10
let teste = "1"

let alunos:string[] = ["aa","bb","cc"]
alunos.push("g") //adiciona item ao vetor/lista

let teste2:[string,number,boolean] = ["Mauro",20,true]

console.log(`Nome: ${teste2[0]} Idade: ${teste2[1]} Tem Cachorro: ${ teste2[2] ? "sim": "nao"}`)

enum Direcao{
    Cima,
    Baixo,
    Esquerda,
    Direita
}

let diorecaoAtual: Direcao = Direcao.Cima

console.log(diorecaoAtual) // saida -> 0
console.log(Direcao[0])// -> "Cima"

enum Cores{
    Vermelho = "VERMELHO",
    Verde = "VERDE",
    Azul = "Azul"
}

let corFavorita:Cores = Cores.Verde
console.log(corFavorita)

enum Comandos{
    Pulo = "A",
    Ataque = "S",
    Defesa = "SHIFT"
}

enum Misturado{
    Numero = 1,
    Texto = "ABC"
}

enum Status{
    Ativo,
    Inativo,
    Suspenso
}

enum Tamanho{
    Pequeno = 32,
    Medio = 38,
    Grande = 44
}

interface Aluno {
    nome:string,
    idade:number,
    matricula:number
}

let aluno1:Aluno = {
    nome: "marcio",
    idade: 10,
    matricula: 544548
}

let cep: String | Number  = 2222222

type Id = String | Number

type User = {
    id:Id,
    email:string
}

let user1: User = {
    id:1,
    email: "blili@gmail.com"
}

type Teste3 = 2

let meuNumero:"booo" = "booo"
