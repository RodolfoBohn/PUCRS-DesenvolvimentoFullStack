const pessoa = {nome: "Edson Moreno", idade: 42};
const {idade: aIdade, nome, peso: oPeso=100} = pessoa;

console.log("O nome é: "  + nome)
console.log("A idade é: " + aIdade)
console.log("O peso é: "  + oPeso)