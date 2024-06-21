// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class InitialImageWidget extends StatelessWidget {
  const InitialImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/images/img_home.PNG'),
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class buildCustomContainerButtom1 extends StatelessWidget {
  const buildCustomContainerButtom1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 700,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromARGB(11, 103, 80, 164),
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Título do Conteúdo 1',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Descrição adicional aqui - 1',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 86, 140, 86),
            ),
            onPressed: () {},
            child: const Text(
              'Produtos reciclados 1',
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class buildCustomContainerButtom2 extends StatelessWidget {
  const buildCustomContainerButtom2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 700,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromARGB(11, 103, 80, 164),
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Título do Conteúdo - 2',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Descrição adicional aqui - 2',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 86, 140, 86),
            ),
            onPressed: () {},
            child: const Text(
              'Produtos reciclados',
            ),
          ),
        ],
      ),
    );
  }
}

class MapCardWidget extends StatelessWidget {
  const MapCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1000,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(11, 103, 80, 164),
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/images/leme_map.png'),
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 86, 140, 86),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/map');
              },
              child: const Text('Ver pontos de coleta'),
            ),
          ],
        ),
      ),
    );
  }
}
