import 'medico.dart';
import 'paciente.dart';
import 'procedimento.dart';
import 'shared/especialidade.dart';
import 'shared/estado.dart';

class Consulta extends Procedimento {
  late final Especialidade tipoConsulta;
  late final double valor;

  Consulta({
    required Medico medico,
    required Paciente paciente,
    required DateTime dataAtendimento,
    required DateTime horaAtendimento,
    required StatusProcedimento statusProcedimento,
    required StatusPessoa statusPaciente,
    bool convenio = false,
    String? tipoConvenio,
    bool retorno = false,
  }) : super(
          medico: medico,
          paciente: paciente,
          dataAtendimento: dataAtendimento,
          horaAtendimento: horaAtendimento,
          statusProcedimento: statusProcedimento,
          statusPaciente: statusPaciente,
          convenio: convenio,
          tipoConvenio: tipoConvenio,
          retorno: retorno,
        ) {
    tipoConsulta = medico.especialidade;
    valor = tipoConsulta.valor;
  }
}
