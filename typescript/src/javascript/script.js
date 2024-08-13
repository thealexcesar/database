"use strict";
const section = (text) => `\n${text !== null && text !== void 0 ? text : ''}\n${'-'.repeat(text ? 74 : 37)}`;
console.log(section("Tipos Básicos"));
let fighterName;
let age;
let isFighter;
let fightStyles = ["Yagami style of ancient martial arts, Pure instincts"];
function getFighter(fighterName, age, isFighter, fightStyles) {
    const fighterStatus = isFighter ? "É um lutador" : "Não é um lutador";
    return `\nNome: ${fighterName}\nIdade:${age}\n${fighterStatus}\n${fightStyles}\n`;
}
console.log(getFighter("Iori Yagame", 20, true, fightStyles));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
const book = {
    title: "O Fantástico Mundo dos Números",
    author: "Ian Stewart",
    pages: 384,
    year: 2016,
    isAvailable: true
};
function getBook(params) {
    const { title, author, pages, year, isAvailable } = params;
    const availableMsg = isAvailable ? "está disponível." : "não está disponível.";
    return `${title}, de ${author}, com ${pages} páginas, lançado em ${year}, ${availableMsg}`;
}
console.log(getBook(book));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Funções e Parâmetros Opcionais/Default"));
function calculateCircleArea(radius = 1) {
    return Math.PI * Math.pow(radius, 2);
}
console.log("Raio 10:", calculateCircleArea(10));
console.log("Raio 1: ", calculateCircleArea());
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function stringTimes(text, times) {
    let result = '';
    const count = times != null ? times : 2;
    for (let i = 0; i < count; i++) {
        result += text + " ";
    }
    return result;
}
console.log(stringTimes("Teste", 5));
console.log(stringTimes("Teste"));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Interfaces"));
function getPerson(person) {
    return `${person.name} tem ${person.age} anos de idade e trabalha como ${person.profession}.`;
}
const person = {
    name: "Steve Wosniak",
    age: 55,
    profession: "Engenheiro Eletronico"
};
console.log(getPerson(person));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function getProductByCategory(products, category) {
    return products.filter(product => product.category === category);
}
const products = [
    { name: "Computador", price: 2500, category: "Eletrônicos" },
    { name: "Smartphone", price: 1500, category: "Eletrônicos" },
    { name: "Camisa", price: 50, category: "Roupas" },
    { name: "Calça", price: 200, category: "Roupas" }
];
console.log(getProductByCategory(products, "Eletrônicos"));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Classes"));
class Car {
    constructor(brand, model, year) {
        this.brand = brand;
        this.model = model;
        this.year = year;
        Car.carCount++;
    }
    getDescription() {
        return `${this.brand} ${this.model}, ano: ${this.year}`;
    }
    static getCarCount() {
        return Car.carCount;
    }
}
Car.carCount = 0;
const bmw = new Car("BMW", "X6", 2024);
const porshe = new Car("Porshe", "Cayenne", 2023);
console.log(bmw.getDescription());
console.log(porshe.getDescription());
console.log(`\nTemos ${Car.getCarCount()} carros disponíveis.`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Herança e Polimorfismo"));
class Animal {
    sound(sound) {
        return `${sound !== null && sound !== void 0 ? sound : 'Algum animal faz barulho.'}`;
    }
}
class Dog extends Animal {
    sound(sound) {
        return `${super.sound(sound)} late.`;
    }
}
class Cat extends Animal {
    sound(sound) {
        return `${super.sound(sound)} mia.`;
    }
}
const dog = new Dog();
const cuteAnimal = new Cat();
const unknow = new Animal();
console.log(dog.sound("Caramelo Vida Loka"));
console.log(cuteAnimal.sound("Gato"));
console.log(unknow.sound());
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
class Employee {
    constructor(name, salary) {
        this.name = name;
        this.salary = salary;
    }
    getName() {
        return this.name;
    }
    calculateSalary() {
        return this.salary;
    }
}
class HourlyEmployee extends Employee {
    constructor(name, hoursWorked, hourlyRate) {
        super(name, 0);
        this.hoursWorked = hoursWorked < 0 ? 0 : hoursWorked;
        this.hourlyRate = hourlyRate < 0 ? 0 : hourlyRate;
    }
    calculateSalary() {
        return this.hoursWorked * this.hourlyRate;
    }
}
class SalariedEmployee extends Employee {
    constructor(name, salary) {
        if (salary < SalariedEmployee.minimumSalary) {
            console.error(`O salário foi reajustado para o mínimo permitido por lei.`);
            salary = SalariedEmployee.minimumSalary;
        }
        super(name, salary);
    }
    calculateSalary() {
        return super.calculateSalary();
    }
}
SalariedEmployee.minimumSalary = 1412.00;
const hourlyEmployee = new HourlyEmployee("Tony Gordo", 700.00, 4);
const salariedEmployee = new SalariedEmployee("Edna Krabappel", 1000.00);
console.log(`${hourlyEmployee.getName()} - salário: R$${hourlyEmployee.calculateSalary()}`);
console.log(`${salariedEmployee.getName()} - salário: R$${salariedEmployee.calculateSalary()}`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Generics"));
function getFirstElementArray(arr) {
    return arr.length > 0 ? arr[0] : null;
}
const numbers = [1, 2, 3, 4];
console.log(getFirstElementArray(numbers));
const consoles = ["Play Station 5", "X Box One", "Nintendo Switch"];
console.log(getFirstElementArray(consoles));
const sexyCharacters = [
    { name: "Android 18" },
    { name: "Boa Hancock" },
    { name: "Mirajane" }
];
console.log(getFirstElementArray(sexyCharacters));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
class Box {
    constructor(value) {
        this.val = value;
    }
    getValue() {
        return this.val;
    }
    setValue(value) {
        this.val = value;
    }
}
const luckBox = new Box(111);
console.log("Luck Box:  ", luckBox.getValue());
luckBox.setValue(999);
console.log("Setada:", luckBox.getValue());
const animeBox = new Box("Bleach");
console.log("\nAnime Box: ", animeBox.getValue());
animeBox.setValue("Full Metal Alchemist");
console.log("Setada:", animeBox.getValue());
const gameBox = new Box({ name: "Call of Duty", year: 2003 });
console.log("\nGame Box:", gameBox.getValue());
gameBox.setValue({ name: "Splinter Cell Blacklist" });
console.log("Setada:", gameBox.getValue());
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Tuplas e Enums"));
function geometry(point) {
    const [x, y] = point;
    const distance = Math.sqrt(x * x + y * y);
    return parseFloat(distance.toFixed(3));
}
const point = [3, 5];
console.log("Distância:", geometry(point));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
var WeekDayType;
(function (WeekDayType) {
    WeekDayType["Sunday"] = "domingo";
    WeekDayType["Monday"] = "segunda-feira";
    WeekDayType["Tuesday"] = "ter\u00E7a-feira";
    WeekDayType["Wednesday"] = "quarta-feira";
    WeekDayType["Thursday"] = "quinta-feira";
    WeekDayType["Friday"] = "sexta-feira";
    WeekDayType["Saturday"] = "s\u00E1bado";
})(WeekDayType || (WeekDayType = {}));
const isWeekend = (day) => day === WeekDayType.Saturday || day === WeekDayType.Sunday;
function weekday(day) {
    return isWeekend(day) ? `${day} é final de semana.` : `${day} é dia de semana.`;
}
const today = new Date();
const todayWeekDayEnum = Object.values(WeekDayType)[today.getDay()];
console.log(weekday(todayWeekDayEnum));
console.log(weekday(WeekDayType.Monday));
console.log(weekday(WeekDayType.Saturday));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Manipulação de Arrays e Objetos"));
function findMinMax(numbers) {
    if (numbers.length === 0)
        return [0, 0];
    const min = Math.min(...numbers);
    const max = Math.max(...numbers);
    return [min, max];
}
const numbersArray = [33, 999, 3, 7];
const [minValue, maxValue] = findMinMax(numbersArray);
console.log(`Menor: ${minValue}, Maior: ${maxValue}`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function getProductsByMinPrice(products, min) {
    return products.filter(product => product.price >= min);
}
const houseHoldProducts = [
    { name: "Panela", price: 50 },
    { name: "Cafeteira", price: 300.00 },
    { name: "Saco de Lixo", price: 20 },
    { name: "Extensão Elétrica", price: 100 },
];
const filteredProducts = getProductsByMinPrice(houseHoldProducts, 50.00);
console.log(filteredProducts);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Manipulação de Strings"));
function reverseWords(sentence) {
    return sentence.split(' ').reverse().join(' ');
}
const originalString = "Ele comprou um presente para ela";
const reversedString = reverseWords(originalString).toLowerCase();
console.log(reversedString);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function countVowels(str) {
    const vowels = ['a', 'e', 'i', 'o', 'u'];
    return str.toLowerCase().split('').filter(char => vowels.includes(char)).length;
}
const stringToCheck = "UNIX is simple. But It just needs a genius to understand its simplicity";
const vowelCount = countVowels(stringToCheck);
console.log(vowelCount, "vogais na frase de Dennis Ritchie");
/* ------------------------------------------------------------------------------------------------------------------ */
const error = "Erro ao obter dados.";
const programmerJson = JSON.stringify({
    id: 1,
    nome: "Dev Tranquilao",
    email: "dev.tranquilao@gmail.com"
});
async function fetchData() {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const success = true;
            success ? resolve(JSON.parse(programmerJson)) : reject(error);
            console.log(section("Promises e Assíncrono"));
        }, 1000);
    });
}
(async () => {
    try {
        const data = await fetchData();
        console.log(data);
    }
    catch (_a) {
        console.error(error);
    }
})();
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
const genusJson = JSON.stringify({
    id: 1,
    name: "Orcinus",
    family: "Delphinidae"
});
const speciesJson = JSON.stringify({
    id: 1,
    name: "Orcinus orca",
    genusId: 1,
});
const fetchDataToCombine = (json, delay) => new Promise((resolve, reject) => setTimeout(() => resolve(JSON.parse(json)), delay));
const fetchAndCombineData = async () => {
    const [genus, species] = await Promise.all([
        fetchDataToCombine(genusJson, 1000),
        fetchDataToCombine(speciesJson, 1200),
    ]);
    return { genus, species };
};
(async () => {
    try {
        const orcaData = await fetchAndCombineData();
        console.log("Orca:", orcaData);
    }
    catch (err) {
        console.error("Erro:", err);
    }
})();
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Manipulação de DOM"));
function addDivToBody(text) {
    const div = document.createElement('div');
    div.textContent = text;
    document.body.appendChild(div);
}
addDivToBody("Este é um texto dinâmico dentro de um novo <div>.");
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function addItemsToList(items) {
    const ul = document.querySelector('ul');
    if (ul) {
        items.forEach(item => {
            const li = document.createElement('li');
            const spanLabel = document.createElement('span');
            spanLabel.className = 'js-label';
            spanLabel.textContent = ' Gerado via Typescript';
            li.textContent = item;
            li.appendChild(spanLabel);
            ul.appendChild(li);
        });
    }
    else {
        console.error('Nenhum elemento <ul> encontrado no DOM.');
    }
}
addItemsToList(['Item 1', 'Item 2', 'Item 3']);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Tipos Avançados"));
const user = {
    id: 1,
    name: 'Alan Turing',
    role: 'Admin',
    canRead: true,
    canWrite: true,
    canDelete: true,
};
console.log(`${user.name} tem permissões: Ler - ${user.canRead}, Escrever - ${user.canWrite}, Deletar - ${user.canDelete}.`);
/* ------------------------------------------------------------------------------------------------------------------ */
function getValue(obj, key) {
    if (!(key in obj))
        throw new Error(`Chave "${String(key)}" não existe no objeto.`);
    return obj[key];
}
const personage = { personageName: 'Deadpool', personageAge: 35 };
const personageName = getValue(personage, 'personageName');
const personageAge = getValue(personage, 'personageAge');
console.log(personageName);
console.log(personageAge);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Type Guards e Type Assertions"));
function identifyType(value) {
    return typeof value === 'string' || typeof value === 'number' ?
        `Você passou ${typeof value} com o valor: ${value}` : 'Tipo não suportado';
}
console.log(identifyType("Tchuqui-tchuqui!"));
console.log(identifyType(99));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
class Person {
    constructor(name, age) {
        this.personName = name;
        this.personAge = age;
    }
}
class Company {
    constructor(companyName, cnpj) {
        this.companyName = companyName;
        this.cnpj = cnpj;
    }
}
function getEntityInfo(entity) {
    if (entity instanceof Person) {
        return `Pessoa: ${entity.personName} - idade: ${entity.personAge}`;
    }
    else if (entity instanceof Company) {
        return `Empresa: ${entity.companyName} - CNPJ: ${entity.cnpj}`;
    }
    else {
        return 'Instancia desconhecida.';
    }
}
const person1 = new Person("Jin Kasama", 30);
const company = new Company("T-Systems", "12.345.678/0001-99");
console.log(getEntityInfo(person1));
console.log(getEntityInfo(company));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Programação Funcional"));
function calculateTotal(cart) {
    return cart.filter(p => p.quantity > 0).reduce((total, p) => total + p.price * p.quantity, 0);
}
const cart = [
    { price: 10, quantity: 2 },
    { price: 20, quantity: 1 },
    { price: 5, quantity: 4 },
    { price: 15, quantity: 0 }
];
const totalValue = calculateTotal(cart);
console.log(`Valor total em produtos: ${totalValue} reais.`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function findProductsByCategory(products, category) {
    return products.reduce((filtered, product) => product.category === category ? [...filtered, product] : filtered, []);
}
const productsWithCategory = [
    { name: 'Mac Book Pro', category: 'Eletrônicos', price: 26000 },
    { name: 'Camisa do Real Madrid', category: 'Roupas', price: 280 },
    { name: 'iPhone', category: 'Eletrônicos', price: 5900 },
    { name: 'Camisa Dudalina', category: 'Roupas', price: 600 },
];
const electronics = findProductsByCategory(productsWithCategory, 'Eletrônicos');
console.log(electronics);
