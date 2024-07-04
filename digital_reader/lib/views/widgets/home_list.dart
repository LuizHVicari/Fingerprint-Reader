import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Coletor de Digitais',
              style: TextStyle(
                fontSize: 30
              )),
            Text(
              'Esse aplicativo tem como objetivo facilitar a coleta de dados para o projeto de pesquisa InfantID, como as digitais são um dados sensíveis, é necessário manter a seguraça do sistema. Dessa forma, o uso desse aplicativo ou acesso dos dados produzidos é estritamente para os envolvidos no projeto.',
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}