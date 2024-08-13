class Especie{
    nome:string 
    alimentação:string 

    constructor(nome:string, alimentação:string){
        this.nome = nome
        this.alimentação = alimentação
    }

}

class Animal{
    nome:string;
    especie:Especie;
    cor:string;

    constructor(nome:string, especie:Especie, cor:string){
        this.nome = nome
        this.especie = especie
        this.cor = cor 
    }

    verDados():string {
        return `Nome: ${this.nome} - ${this.especie} ${this.cor}` 
    }

}

let e1:Especie =  new Especie("Gato","Onívoro")
let a1:Animal =  new Animal("Vertmithor",e1, "Nú")


function verValor<T>(valor:T):T{
    return valor
}
let n1 =  verValor<number>(30)
let palavra =  verValor<string>("Cabeçalho")

const somar = (n1:number, n2:number) => {
    return n1+n2
}

console.log(somar(2,3))

interface Dupla<T,U>{
    primeiroValor:T,
    segundoValor:U
}
let numero_texto:Dupla<number, string> = {
    primeiroValor: 1,
    segundoValor: "um"
}


function receberDado(dado:string | number) : string | number {
    return typeof dado === "string" ? `É um texto: ${dado}` : dado * 2
}

let a3: Animal = new Animal("Baaa",e1,"azul")
console.log(typeof a3)

let palavrona:any = "a"
palavrona = true

// let input:HTMLInputElement = document.querySelector("input") as HTMLInputElement

let aaaaaa =  "aaaaaaaaaaaaaaaaaaaa"

