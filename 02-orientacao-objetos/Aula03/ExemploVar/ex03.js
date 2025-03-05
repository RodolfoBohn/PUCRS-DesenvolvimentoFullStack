function testeVar() {
  var var01 = "var01" 
  {
    console.log("01a. " + var01)
    var01 = "var02"
    console.log("02a. " + var01)
  }
  var01 = "var03"
  console.log("03a. " + var01)
}

testeVar()