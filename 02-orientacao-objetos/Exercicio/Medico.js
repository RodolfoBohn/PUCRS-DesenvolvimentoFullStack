import { Usuario } from "./Usuario.js";

export class Medico extends Usuario {
  #crm
  #especialidades = []
  constructor(nome, email, dataNascimento, crm) {
    super(nome, email, dataNascimento)
    this.#crm = crm
  }

  get crm() {
    return this.#crm
  }

  addEspecialidade(especialidade) {
    this.#especialidades.push(especialidade)
  }

  get especialidades() {
    return this.#especialidades
  }
}