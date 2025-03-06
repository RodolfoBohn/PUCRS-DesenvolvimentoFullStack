//Função vinculada a uma variável como parâmetro

function decision(question, doOK, doCancel) {
  if (question=="OK") doOK()
  else doCancel();
}

let beOK = function showOk() { console.log( "You agreed." ); }

let beCancel = function showCancel() { console.log( "You canceled the execution." ); }

decision("OK", beOK, beCancel);
decision("Cancel", beOK, beCancel);