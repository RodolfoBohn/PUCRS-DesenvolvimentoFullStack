const pessoa1 = {
  nome: "Rodolfo",
  idade: 27
}

const pessoa2 = pessoa1

//Ao alterar o nome de pessoa 2, altera também de pessoa 1, pois ambas tem a mesma referência
pessoa2.nome = "Antônio"

//Ao copiar pessoa 1 dentro de um novo objeto, desfaz a referência
const pessoa3 = { ...pessoa1 }
pessoa3.nome = "Letícia"

console.log(pessoa1)
console.log(pessoa2)
console.log(pessoa3)
