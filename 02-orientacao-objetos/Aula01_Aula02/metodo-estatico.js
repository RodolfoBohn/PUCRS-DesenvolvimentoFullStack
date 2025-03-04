class ValidaCPF {
  static TAMANHO_VALIDO = 11

  static validar(cpf) {
    return cpf.length == this.TAMANHO_VALIDO
  }
}

// Não é preciso instanciar a classe para acessar os métodos estáticos
// Se instanciada, o método estático é o mesmo para todos os objetos da classe

console.log(ValidaCPF.TAMANHO_VALIDO)
console.log(ValidaCPF.validar('1234567890'))
console.log(ValidaCPF.validar('12345678901'))