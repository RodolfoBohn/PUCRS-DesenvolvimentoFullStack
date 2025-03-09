import { UmaClasse } from "./UmaClasse.mjs";

const umaClasse = new UmaClasse("Primeiro atributo")

const {capturaPrimeiroAtributo: umAtributo, outroAtributo} = umaClasse;

console.log("um Atributo: " + umAtributo)
console.log("Outro Atributo: " + outroAtributo)