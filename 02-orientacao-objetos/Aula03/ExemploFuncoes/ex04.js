// Função anônima como parâmetro

function decision(question, doOK, doCancel) {
  if (question=="OK") doOK()
  else doCancel();
}
decision(
  "OK", 
  () => { console.log( "You agreed." ); }, 
  () => { console.log( "You canceled the execution." ); }
  );

decision(
  "Cancel", 
  function () { console.log( "You agreed." ); }, 
  function () { console.log( "You canceled the execution." ); }
);