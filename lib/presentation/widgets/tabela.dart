import 'package:flutter/material.dart';

class TabelaDinamica extends StatefulWidget {
  final List<String> colunas;
  final List<Map<String, dynamic>> itens;

  const TabelaDinamica({
    Key? key,
    required this.colunas,
    required this.itens,
  }) : super(key: key);

  @override
  State<TabelaDinamica> createState() => _TabelaDinamicaState();
}

class _TabelaDinamicaState extends State<TabelaDinamica> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          DataTable(
            columns: [
              ...widget.colunas.map(
                (titulo) {
                  return DataColumn(
                    label: Text(
                      titulo,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ).toList(),
              const DataColumn(
                label: Text(
                  'AÇÕES',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: widget.itens.reversed.map(
              (linha) {
                return DataRow(
                  cells: [
                    ...widget.colunas.map(
                      (coluna) {
                        return DataCell(
                          Text(
                            linha[coluna].toString(),
                          ),
                        );
                      },
                    ).toList(),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {
                              // HANDLE VIEW CLICK
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // HANDLE EDIT CLICK
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              linha['ativo'] = false;
                              // HANDLE DELETE CLICK
                              setState(() {
                                widget.itens.remove(linha);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
