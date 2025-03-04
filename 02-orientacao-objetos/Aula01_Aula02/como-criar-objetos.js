//Como criar objetos

//Literal: como fizemos anteriormente
console.log("Literal")


const pessoa = {
  nome: "Rodolfo",
  idade: 27,
  saudar: function() {
    console.log("Olá!")
  }
}

console.log(pessoa)

//Fábricas de objetos: Função que cria e retorna um objeto
console.log("Fábricas de objetos")

function criaFuncionario(salarioBase, qtdeHorasExtras, valorHoraExtra) {
  return {
    salarioBase, 
    qtdeHorasExtras, 
    valorHoraExtra, 
    calculaSalario: function() {
      return this.salarioBase + (this.qtdeHorasExtras * this.valorHoraExtra)
    }
  }
}

const funcionario = criaFuncionario(5000, 10, 45)
const funcionario1 = criaFuncionario(7500, 10, 86)

console.log(funcionario)
console.log(funcionario1)

// Construtores: função que cria um objeto
console.log("Construtores")

function Pessoa() {
  this.nome = "João"
  this.anoDeNascimento = 1990
  this.profissao = "Estudante"
  this.calculaIdade = function() {
    return new Date().getUTCFullYear - this.anoDeNascimento
  }
}

const pessoa1 = new Pessoa()
console.log(pessoa1)
pessoa1.calculaIdade()

function Pessoa1(nome, anoNascimento, profissao) {
  this.nome = nome
  this.anoDeNascimento = anoNascimento
  this.profissao = profissao
  this.calculaIdade = function() {
    return new Date().getUTCFullYear - this.anoDeNascimento
  }
}

const pessoa2 = new Pessoa1("Alberto", 1965, "Aposentado")

console.log(pessoa2)
pessoa2.calculaIdade()

// Protótipos
//Mecanismo de herança entre objetos
//Através da chamada cadeia de protótipos
console.log('Protótipos')

function descobreTipo(objeto) {
  if("Object" == objeto.constructor.name) {
    console.log("É um objeto raiz")
  } else {
    console.log(`É um objeto do tipo ${objeto.constructor.name}`)
  }
}

descobreTipo(pessoa1)
descobreTipo(pessoa2)

//Como acessar o protóptipo
console.log(Object.getPrototypeOf(pessoa1))
console.log(Object.getPrototypeOf(pessoa2))

// __proto__ (na console do chrome)

//Criando a partir de protótipos
const pessoa3 = Object.create(pessoa1)
console.log(pessoa3)
console.log(pessoa3.nome)

//Herança prototipada
Pessoa.prototype.saudar = function() {
  console.log("Olá!")
}

pessoa1?.saudar()
//pessoa 2 não tem a função saudar, por ser oriunda de outro construtor
pessoa2.saudar?.()
pessoa3?.saudar()

//CLASSES
console.log("Classes")

// Modelos para criar objetos
// Em JS, a classe pode ter somente um constructor, diferente de outras linguagens de programação
// Em JS, a classe é uma simplificação da função construtora

class PessoaClass {
  constructor(nome, anoDeNascimento, profissao) {
    this.nome = nome
    this.anoDeNascimento = anoDeNascimento
    this.profissao = profissao
  }

  ola() {
    console.log("Olá, sou " + this.nome)
  }

  calculaIdade() {
    console.log((new Date().getUTCFullYear() - this.anoDeNascimento))
  }
}

const pessoa4 = new PessoaClass("João", 1990, "Estudante")

pessoa4.ola()
pessoa4.calculaIdade()

//Herança e polimorfismo com classes

class Estudante extends PessoaClass {
  constructor(nome, anoDeNascimento, matricula) {
    super(nome, anoDeNascimento, "Estudante")
    this.matricula = matricula
  }
  ola() {
    console.log(`Eu sou o estudante ${this.nome}`)
  }
}

const aluno1 = new Estudante("João", 1999, 12345)

aluno1.ola()
console.log(aluno1.matricula)

class Professor extends PessoaClass {
  constructor(nome, anoDeNascimento, titulacao) {
    super(nome, anoDeNascimento, "professor")
    this.titulacao = titulacao
  }
  ola() {
    super.ola()
    console.log("Sou o professor de vocês")
  }
}

const prof1 = new Professor("Marta", 1970, "Mestre")

prof1.ola()
console.log(prof1.titulacao)

// Atributos privados e Associação
class Nota {
  constructor(disciplina, nota) {
    this.disciplina = disciplina
    this.nota = nota
  }
}

class EstudantePriv extends PessoaClass {
  #matricula;
  #notas = []
  constructor(nome, anoDeNascimento, matricula) {
    super(nome, anoDeNascimento, "Estudante")
    this.#matricula = matricula
  }
  ola() {
    console.log(`Eu sou o estudante ${this.nome}`)
  }
  getMatricula() {
    return this.#matricula
  }
  getNotas() {
    return this.#notas
  }

  addNota(nota) {
    this.#notas.push(nota)
  }
}

const aluno2 = new EstudantePriv("Carlos", 1995, 1234)
// aluno2.#matricula -> causa erro

console.log(aluno2)
console.log(aluno2.getMatricula())

const nota1 = new Nota("OO", 10)
aluno2.addNota(nota1)
console.log(aluno2.getNotas())