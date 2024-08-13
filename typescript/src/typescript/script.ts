const section = (text ?: string): string => `\n${text ?? ''}\n${'-'.repeat(text ? 74 : 37)}`;

console.log(section("Tipos Básicos"));
let fighterName: string;
let age: number;
let isFighter: boolean;
let fightStyles: string[] = ["Yagami style of ancient martial arts, Pure instincts"];

function getFighter(fighterName: string, age: number, isFighter: boolean, fightStyles: string[]): string {
    const fighterStatus: string = isFighter ? "É um lutador" : "Não é um lutador";
    return `\nNome: ${fighterName}\nIdade:${age}\n${fighterStatus}\n${fightStyles}\n`;
}
console.log(getFighter("Iori Yagame", 20, true, fightStyles));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
type Books = {
    title: string;
    author: string;
    pages: number;
    year: number;
    isAvailable: boolean;
};

const book: Books = {
    title: "O Fantástico Mundo dos Números",
    author: "Ian Stewart",
    pages: 384,
    year: 2016,
    isAvailable: true
};

function getBook(params: { title: string, author: string, pages: number, year: number, isAvailable: boolean }): string {
    const { title, author, pages, year, isAvailable } = params;
    const availableMsg: string = isAvailable ? "está disponível." : "não está disponível.";

    return `${title}, de ${author}, com ${pages} páginas, lançado em ${year}, ${availableMsg}`;
}
console.log(getBook(book));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Funções e Parâmetros Opcionais/Default"));
function calculateCircleArea(radius: number=1): number {
    return Math.PI * Math.pow(radius, 2);
}

console.log("Raio 10:", calculateCircleArea(10));
console.log("Raio 1: ", calculateCircleArea());
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function stringTimes(text: string, times?: number): string {
    let result: string = '';
    const count: number = times != null ? times : 2;
    for (let i: number = 0; i < count; i++) {
        result += text + " ";
    }
    return result;
}

console.log(stringTimes("Teste", 5));
console.log(stringTimes("Teste"));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Interfaces"));
interface PersonRepository {
    name: string;
    age: number;
    profession: string;
}

function getPerson(person: PersonRepository): string {
    return `${person.name} tem ${person.age} anos de idade e trabalha como ${person.profession}.`;
}

const person: PersonRepository = {
    name: "Steve Wosniak",
    age: 55,
    profession: "Engenheiro Eletronico"
};
console.log(getPerson(person));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
interface ProductProps {
    name: string;
    price: number;
    category: string;
}

function getProductByCategory(products: ProductProps[], category: string): ProductProps[] {
    return products.filter(product => product.category === category);
}

const products: ProductProps[] = [
    { name: "Computador", price: 2500, category: "Eletrônicos" },
    { name: "Smartphone", price: 1500, category: "Eletrônicos" },
    { name: "Camisa", price: 50, category: "Roupas" },
    { name: "Calça", price: 200, category: "Roupas" }
];
console.log(getProductByCategory(products, "Eletrônicos"));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Classes"));
class Car {
    brand: string;
    model: string;
    year: number;

    private static carCount: number = 0;

    constructor(brand: string, model: string, year: number) {
        this.brand = brand;
        this.model = model;
        this.year = year;
        Car.carCount++;
    }

    getDescription(): string {
        return `${this.brand} ${this.model}, ano: ${this.year}`;
    }

    static getCarCount(): number {
        return Car.carCount;
    }
}
const bmw: Car = new Car("BMW", "X6", 2024);
const porshe: Car = new Car("Porshe", "Cayenne", 2023);
console.log(bmw.getDescription());
console.log(porshe.getDescription());
console.log(`\nTemos ${Car.getCarCount()} carros disponíveis.`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Herança e Polimorfismo"));
class Animal {
    sound(sound?: string): string {
        return `${sound ?? 'Algum animal faz barulho.'}`;
    }
}

class Dog extends Animal {
    sound(sound?: string): string {
        return `${super.sound(sound)} late.`;
    }
}

class Cat extends Animal {
    sound(sound?: string): string {
        return `${super.sound(sound)} mia.`;
    }
}
const dog: Dog = new Dog();
const cuteAnimal: Animal = new Cat();
const unknow: Animal = new Animal();

console.log(dog.sound("Caramelo Vida Loka"));
console.log(cuteAnimal.sound("Gato"));
console.log(unknow.sound());
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
class Employee {
    private name: string;
    private salary: number;

    constructor(name: string, salary: number) {
        this.name = name;
        this.salary = salary;
    }

    getName(): string {
        return this.name;
    }

    calculateSalary(): number {
        return this.salary;
    }
}

class HourlyEmployee extends Employee {
    private hoursWorked: number;
    private hourlyRate: number;

    constructor(name: string, hoursWorked: number, hourlyRate: number) {
        super(name, 0);
        this.hoursWorked = hoursWorked < 0 ? 0 : hoursWorked;
        this.hourlyRate = hourlyRate < 0 ? 0 : hourlyRate;
    }

    calculateSalary(): number {
        return this.hoursWorked * this.hourlyRate;
    }
}

class SalariedEmployee extends Employee {

    private static minimumSalary: number = 1412.00

    constructor(name: string, salary: number) {
        if (salary < SalariedEmployee.minimumSalary) {
            console.error(`O salário foi reajustado para o mínimo permitido por lei.`);
            salary = SalariedEmployee.minimumSalary;
        }
        super(name, salary);
    }

    calculateSalary(): number {
        return super.calculateSalary();
    }
}

const hourlyEmployee: Employee = new HourlyEmployee("Tony Gordo", 700.00, 4);
const salariedEmployee: Employee = new SalariedEmployee("Edna Krabappel", 1000.00);

console.log(`${hourlyEmployee.getName()} - salário: R$${hourlyEmployee.calculateSalary()}`);
console.log(`${salariedEmployee.getName()} - salário: R$${salariedEmployee.calculateSalary()}`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Generics"));
function getFirstElementArray<T>(arr: T[]): T | null {
    return arr.length > 0 ? arr[0] : null;
}
const numbers: number[] = [1, 2, 3, 4];
console.log(getFirstElementArray(numbers));

const consoles: string[] = ["Play Station 5", "X Box One", "Nintendo Switch"];
console.log(getFirstElementArray(consoles));

const sexyCharacters: { name: string }[] = [
    { name: "Android 18" },
    { name: "Boa Hancock" },
    { name: "Mirajane" }
];
console.log(getFirstElementArray(sexyCharacters));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
class Box<T> {
    private val: T;

    constructor(value: T) {
        this.val = value;
    }

    getValue(): T {
        return this.val;
    }

    setValue(value: T) {
        this.val = value;
    }
}

const luckBox: Box<number> = new Box<number>(111);
console.log("Luck Box:  ", luckBox.getValue());
luckBox.setValue(999);
console.log("Setada:", luckBox.getValue());

const animeBox: Box<string> = new Box<string>("Bleach");
console.log("\nAnime Box: ", animeBox.getValue());
animeBox.setValue("Full Metal Alchemist");
console.log("Setada:", animeBox.getValue());

const gameBox: Box<object> = new Box<{ name: string, year: number }>({ name: "Call of Duty", year: 2003 });
console.log("\nGame Box:", gameBox.getValue());
gameBox.setValue({ name: "Splinter Cell Blacklist" });
console.log("Setada:", gameBox.getValue());
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Tuplas e Enums"));
type Point2D = [number, number];

function geometry(point: Point2D): number {
    const [x, y] = point;
    const distance: number = Math.sqrt(x * x + y * y);
    return parseFloat(distance.toFixed(3));
}

const point: Point2D = [3, 5];
console.log("Distância:", geometry(point));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
enum WeekDayType {
    Sunday = "domingo",
    Monday = "segunda-feira",
    Tuesday = "terça-feira",
    Wednesday = "quarta-feira",
    Thursday = "quinta-feira",
    Friday = "sexta-feira",
    Saturday = "sábado"
}

const isWeekend = (day: WeekDayType): boolean => day === WeekDayType.Saturday || day === WeekDayType.Sunday;

function weekday(day: WeekDayType): string {
    return isWeekend(day) ? `${day} é final de semana.` : `${day} é dia de semana.`;
}
const today: Date = new Date();
const todayWeekDayEnum = Object.values(WeekDayType)[today.getDay()] as WeekDayType;

console.log(weekday(todayWeekDayEnum));
console.log(weekday(WeekDayType.Monday));
console.log(weekday(WeekDayType.Saturday));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Manipulação de Arrays e Objetos"));
function findMinMax(numbers: number[]): [number, number] {
    if (numbers.length === 0) return [0, 0];

    const min: number = Math.min(...numbers);
    const max: number = Math.max(...numbers);
    return [min, max];
}

const numbersArray: number[] = [33, 999, 3, 7];
const [minValue, maxValue]: [number, number] = findMinMax(numbersArray);

console.log(`Menor: ${minValue}, Maior: ${maxValue}`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
type HouseProduct = {
    name: string;
    price: number;
};

function getProductsByMinPrice(products: HouseProduct[], min: number): HouseProduct[] {
    return products.filter(product => product.price >= min);
}

const houseHoldProducts: HouseProduct[] = [
    { name: "Panela", price: 50 },
    { name: "Cafeteira", price: 300.00 },
    { name: "Saco de Lixo", price: 20 },
    { name: "Extensão Elétrica", price: 100 },
];

const filteredProducts: HouseProduct[] = getProductsByMinPrice(houseHoldProducts, 50.00);
console.log(filteredProducts);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Manipulação de Strings"));
function reverseWords(sentence: string): string {
    return sentence.split(' ').reverse().join(' ');
}
const originalString: string = "Ele comprou um presente para ela";
const reversedString: string = reverseWords(originalString).toLowerCase();
console.log(reversedString);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function countVowels(str: string): number {
    const vowels: string[] = ['a', 'e', 'i', 'o', 'u'];
    return str.toLowerCase().split('').filter(char => vowels.includes(char)).length;
}
const stringToCheck: string = "UNIX is simple. But It just needs a genius to understand its simplicity";
const vowelCount: number = countVowels(stringToCheck);
console.log(vowelCount, "vogais na frase de Dennis Ritchie");
/* ------------------------------------------------------------------------------------------------------------------ */
const error: string = "Erro ao obter dados.";
const programmerJson: string = JSON.stringify({
    id: 1,
    nome: "Dev Tranquilao",
    email: "dev.tranquilao@gmail.com"
});
async function fetchData(): Promise<string> {
    return new Promise((resolve, reject): void => {
        setTimeout(() => {
            const success = true;
            success ? resolve(JSON.parse(programmerJson)) : reject(error);
            console.log(section("Promises e Assíncrono"));
        }, 1000);
    });
}

(async (): Promise<void> => {
    try {
        const data: string = await fetchData();
        console.log(data);
    } catch {
        console.error(error);
    }
})();
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
interface GenusProps {
    id: number;
    name: string;
    family: string;
}

interface SpeciesProps {
    id: number;
    name: string;
    genusId: number;
}

const genusJson: string = JSON.stringify({
    id: 1,
    name: "Orcinus",
    family: "Delphinidae"
});

const speciesJson: string = JSON.stringify({
    id: 1,
    name: "Orcinus orca",
    genusId: 1,
});

const fetchDataToCombine = <T>(json: string, delay: number): Promise<T> =>
    new Promise((resolve, reject) =>
        setTimeout(() => resolve(JSON.parse(json)), delay)
    );

const fetchAndCombineData = async (): Promise<{ genus: GenusProps; species: SpeciesProps }> => {
    const [genus, species]: [GenusProps, SpeciesProps] = await Promise.all([
        fetchDataToCombine<GenusProps>(genusJson, 1000),
        fetchDataToCombine<SpeciesProps>(speciesJson, 1200),
    ]);
    return { genus, species };
};

(async (): Promise<void> => {
    try {
        const orcaData: { genus: GenusProps, species: SpeciesProps } = await fetchAndCombineData();
        console.log("Orca:", orcaData);
    } catch (err) {
        console.error("Erro:", err);
    }
})();
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Manipulação de DOM"));
function addDivToBody(text: string): void {
    const div: HTMLDivElement = document.createElement('div');
    div.textContent = text;
    document.body.appendChild(div);
}
addDivToBody("Este é um texto dinâmico dentro de um novo <div>.");
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
function addItemsToList(items: string[]): void {
    const ul: HTMLUListElement | null = document.querySelector('ul');

    if (ul) {
        items.forEach(item => {
            const li: HTMLLIElement = document.createElement('li');
            const spanLabel: HTMLSpanElement = document.createElement('span');
            spanLabel.className = 'js-label';
            spanLabel.textContent = ' Gerado via Typescript';
            li.textContent = item;
            li.appendChild(spanLabel);
            ul.appendChild(li);
        });
    } else {
        console.error('Nenhum elemento <ul> encontrado no DOM.');
    }
}
addItemsToList(['Item 1', 'Item 2', 'Item 3']);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Tipos Avançados"));
interface BasicInfoProps {
    id: number;
    name: string;
}

interface RoleProps {
    role: string;
}

interface PermissionsProps {
    canRead: boolean;
    canWrite: boolean;
    canDelete: boolean;
}

type UserWithPermissions = BasicInfoProps & RoleProps & PermissionsProps;

const user: UserWithPermissions = {
    id: 1,
    name: 'Alan Turing',
    role: 'Admin',
    canRead: true,
    canWrite: true,
    canDelete: true,
};
console.log(`${user.name} tem permissões: Ler - ${user.canRead}, Escrever - ${user.canWrite}, Deletar - ${user.canDelete}.`);
/* ------------------------------------------------------------------------------------------------------------------ */
function getValue<T extends object, K extends keyof T>(obj: T, key: K): T[K] {
    if (!(key in obj)) throw new Error(`Chave "${String(key)}" não existe no objeto.`);
    return obj[key];
}

const personage: { personageName: string, personageAge: number } = { personageName: 'Deadpool', personageAge: 35 };
const personageName: string = getValue(personage, 'personageName');
const personageAge: number = getValue(personage, 'personageAge');

console.log(personageName);
console.log(personageAge);

/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Type Guards e Type Assertions"));

function identifyType(value: string | number): string {
    return typeof value === 'string' || typeof value === 'number' ?
        `Você passou ${typeof value} com o valor: ${value}` : 'Tipo não suportado';
}

console.log(identifyType("Tchuqui-tchuqui!"));
console.log(identifyType(99));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
class Person {
    personName: string;
    personAge: number;

    constructor(name: string, age: number) {
        this.personName = name;
        this.personAge = age;
    }
}

class Company {
    companyName: string;
    cnpj: string;

    constructor(companyName: string, cnpj: string) {
        this.companyName = companyName;
        this.cnpj = cnpj;
    }
}

function getEntityInfo(entity: Person | Company): string {
    if (entity instanceof Person) {
        return `Pessoa: ${entity.personName} - idade: ${entity.personAge}`;
    } else if (entity instanceof Company) {
        return `Empresa: ${entity.companyName} - CNPJ: ${entity.cnpj}`;
    } else {
        return 'Instancia desconhecida.';
    }
}

const person1: Person = new Person("Jin Kasama", 30);
const company: Company = new Company("T-Systems", "12.345.678/0001-99");

console.log(getEntityInfo(person1));
console.log(getEntityInfo(company));
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section("Programação Funcional"));
type Product = {
    price: number;
    quantity: number;
};

function calculateTotal(cart: Product[]): number {
    return cart.filter(p => p.quantity > 0).reduce((total: number, p: Product) => total + p.price * p.quantity, 0);
}

const cart: Product[] = [
    { price: 10, quantity: 2 },
    { price: 20, quantity: 1 },
    { price: 5, quantity: 4 },
    { price: 15, quantity: 0 }
];

const totalValue: number = calculateTotal(cart);
console.log(`Valor total em produtos: ${totalValue} reais.`);
/* ------------------------------------------------------------------------------------------------------------------ */
console.log(section());
type ProductWithCategory = {
    name: string;
    category: string;
    price: number;
};

function findProductsByCategory(products: ProductWithCategory[], category: string): ProductWithCategory[] {
    return products.reduce((filtered: ProductWithCategory[], product: ProductWithCategory): ProductWithCategory[] =>
        product.category === category ? [...filtered, product] : filtered, [] as ProductWithCategory[]
    );
}

const productsWithCategory: ProductWithCategory[] = [
    { name: 'Mac Book Pro', category: 'Eletrônicos', price: 26000 },
    { name: 'Camisa do Real Madrid', category: 'Roupas', price: 280 },
    { name: 'iPhone', category: 'Eletrônicos', price: 5900 },
    { name: 'Camisa Dudalina', category: 'Roupas', price: 600 },
];

const electronics: ProductWithCategory[] = findProductsByCategory(productsWithCategory, 'Eletrônicos');
console.log(electronics);