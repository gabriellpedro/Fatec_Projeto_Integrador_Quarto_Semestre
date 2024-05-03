// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
        color: Color.fromARGB(50, 103, 80, 164),
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
        color: Color.fromARGB(50, 103, 80, 164),
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
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: 1000,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  'https://pixelz.cc/wp-content/uploads/edd/2018/06/super-mario-world-map-uhd-4k-wallpaper.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 86, 140, 86),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YourNewPage()),
                  );
                },
                child: const Text('Ver pontos de coleta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YourNewPage extends StatelessWidget {
  const YourNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Mapa"),
      ),
      body: Center(
        child: Text("Aqui vão os detalhes do mapa!"),
      ),
    );
  }
}
