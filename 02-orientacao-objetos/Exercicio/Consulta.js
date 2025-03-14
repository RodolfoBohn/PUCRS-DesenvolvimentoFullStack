export class Consulta {
  #medico
  constructor(dataConsulta, paciente, observacao = null) {
    this.dataConsulta = dataConsulta
    this.paciente = paciente
    this.observacao = observacao
  }

  set medico(medico) {
    this.#medico = medico
  }

  get medico() {
    return this.#medico
  }
}