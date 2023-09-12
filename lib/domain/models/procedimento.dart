import 'medico.dart';
import 'paciente.dart';
import 'shared/status.dart';

class Procedimento {
  static int _idCounter = 0;
  final int id;

  final Medico medico;
  final Paciente paciente;
  final DateTime dataAtendimento;
  final DateTime horaAtendimento;
  StatusProcedimento statusProcedimento;
  bool convenio;
  String? tipoConvenio;
  bool? retorno;

  Procedimento({
    required this.medico,
    required this.paciente,
    required this.dataAtendimento,
    required this.horaAtendimento,
    required this.statusProcedimento,
    this.convenio = false,
    this.tipoConvenio,
    this.retorno = false,
  }) : id = ++_idCounter;
}
