// Criação de objeto
const pessoa = {}

const pessoa1 = {
  nome: "Rodolfo",
  idade: 27
}

console.log(pessoa1)

const pessoa2 = {
  nome: "Rodolfo",
  idade: 27,
  saudar: function() {
    console.log("Olá!")
  }
}

console.log(pessoa2)
pessoa2.saudar()

//Como acessar propriedades
console.log(pessoa2.idade)
console.log(pessoa2["nome"])
pessoa2["saudar"]() 

//Atribuição
pessoa2.nome = "Letícia"
console.log(pessoa2.nome)

pessoa2["idade"] = 26
console.log(pessoa2.nome)

//Métodos com atributos
pessoa1.saudar = function(nome) {console.log(`Olá ${nome}!`)}

pessoa1.saudar("Rodolfo")

//Mais exemplos de objetos
const empregado = {
  salariobase: 5000, 
  valorHoraExtra:50, 
  qteHorasExtras: 2, 
  calculaSalario: function() {
    return this.salariobase + (this.qteHorasExtras * this.valorHoraExtra)
  }
}

console.log(empregado.calculaSalario())

const empregado1 = {
  salariobase: 7000, 
  valorHoraExtra:70, 
  qteHorasExtras: 2, 
  calculaSalario: function() {
    return this.salariobase + (this.qteHorasExtras * this.valorHoraExtra)
  }
}

console.log(empregado1.calculaSalario())

empregado1.saudar = function() {console.log("Olá")}

console.log(empregado)
console.log(empregado1)

