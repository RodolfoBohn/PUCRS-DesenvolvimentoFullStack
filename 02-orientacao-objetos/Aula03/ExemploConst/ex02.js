function testeConst() {
  const const01 = {propriedade: "valor"}
  console.log("01a. " + const01.propriedade)

  const01.propriedade = "Novo valor"
  console.log("01b. " + const01.propriedade)
}

testeConst()