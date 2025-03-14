import { Consulta } from "./Consulta.js";

export class ConsultaEspecialista extends Consulta {
  constructor(dataConsulta, paciente, especialidade, observacao = null) {
    super(dataConsulta, paciente, observacao)
    this.especialidade = especialidade
  }

  set medico(medico) {
    if(medico.especialidades?.some(especialidade => especialidade === this.especialidade)) {
      super.medico = medico
    }
    else {
      throw new Error("O médico não possui a especialidade necessária.")
    }
  }

  get medico() {
    return super.medico
  }
}