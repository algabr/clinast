import 'package:clinast/presentation/screens/modal/funcionario.dart';
import 'package:flutter/material.dart';

import '../widgets/tabela.dart';
import '../widgets/titulo_pagina.dart';

// CRIA A LISTA DE TITULOS DAS COLUNAS
final List<String> tituloColunas = [
  'NOME',
  'DATA NASC',
  'CIDADE',
  'CEP',
  'TELEFONE',
  'TURNO',
  'FUNÇÃO',
];

class FuncionariosPage extends StatefulWidget {
  const FuncionariosPage({
    required this.colunas,
    required this.itens,
    super.key,
  });

  final List<String> colunas;
  final List<Map<String, dynamic>> itens;

  @override
  State<FuncionariosPage> createState() => _FuncionariosPageState();
}

void handleExportarClick() {}

void handleNovoItemClick(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const FuncionarioModal();
    },
  );
}

class _FuncionariosPageState extends State<FuncionariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // TITULO DA PAGINA
          TituloPagina(
            "FUNCIONÁRIOS",
            "Lista de funcionários:",
            onExportar: handleExportarClick,
            onNovoItem: () => handleNovoItemClick(context),
          ),

          // ESPACAMENTO DO TITULO PRO CORPO
          const SizedBox(height: 16),

          // CORPO DA PAGINA
          Expanded(
            child: Center(
              // CHAMANDO O WIDGET TABELA
              child: TabelaDinamica(
                colunas: tituloColunas,
                itens: const [],
              ),
            ),
          )
        ],
      ),
    );
  }
}
