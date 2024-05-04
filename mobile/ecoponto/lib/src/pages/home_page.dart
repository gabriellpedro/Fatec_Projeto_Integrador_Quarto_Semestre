// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecoponto/src/navigation/home_bottom_navigation.dart';
import 'package:ecoponto/src/pages/widgets/HomePage_Widgets.dart';
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
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Pontos de coleta'),
                subtitle: const Text(
                  'Navegue para os pontos de coletas mais próximos',
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed('/map');
                },
              )
            ],
          ),
        ),
      ),
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
                height: 350,
                width: double.infinity,
                child: MapCardWidget(),
              ),
              // BottomNavigationPage(),
            ],
          ),
        ),
      ),
    );
  }
}
