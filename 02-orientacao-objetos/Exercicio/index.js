import { Consulta } from "./Consulta.js"
import { ConsultaEspecialista } from "./ConsultaEspecialista.js"
import { Medico } from "./Medico.js"
import { Paciente } from "./Paciente.js"

const pacienteUm = new Paciente("Pedro", "pedro@email.com", new Date('1998-04-25'))
const pacienteDois = new Paciente("Luan", "luan@email.com", new Date('1963-04-25'))

const medicoUm = new Medico("Silvino", "silvino@email.com", new Date('1963-09-25'), 12345)
const medicoDois = new Medico("Valdemar", "valdemar@email.com", new Date('1981-06-28'), 6578)

medicoDois.addEspecialidade("cardiologia")

const consultaUm = new Consulta(new Date('2025-03-27'), pacienteUm)
const consultaDois = new ConsultaEspecialista(new Date('2025-06-27'), pacienteDois, "cardiologia")

consultaUm.medico = medicoUm

// Espera-se erro pelo médico não ter a especialidade
try {
  consultaDois.medico = medicoUm
} catch(erro) {
  console.log(erro.message)
}

try {
  consultaDois.medico = medicoDois
  console.log(`Dr. ${consultaDois.medico.nome} será o médico`)
} catch(erro) {
  console.log(erro.message)
}