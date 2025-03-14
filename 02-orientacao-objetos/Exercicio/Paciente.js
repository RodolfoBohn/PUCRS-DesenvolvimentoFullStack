import { Usuario } from "./Usuario.js";

export class Paciente extends Usuario {
  #consultas = []
  constructor(nome, email, dataNascimento){
    super(nome, email, dataNascimento)
  }

   addConsulta(consulta) {
    this.#consultas.push(consulta)
  }

  get consultas() {
    return this.#consultas
  }
}