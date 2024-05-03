// ignore_for_file: prefer_const_constructors

import 'package:ecoponto/pages/widgets/HomePage_Widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Testes',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              buildCustomContainerButtom1(),
              SizedBox(height: 15),
              buildCustomContainerButtom2(),
              SizedBox(height: 15),
              SizedBox(
                // Asegura que o MapCardWidget tem um tamanho definido
                height: 600, // Ajuste conforme necessário
                width: double.infinity,
                child: MapCardWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
