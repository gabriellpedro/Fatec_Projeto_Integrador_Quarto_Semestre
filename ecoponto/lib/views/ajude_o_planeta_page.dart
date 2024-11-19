import 'package:flutter/material.dart';

class AjudeOPlanetaPage extends StatelessWidget {
  const AjudeOPlanetaPage({
    super.key,
    required this.titulo,
    required this.conteudo,
    required this.urlImagem,
  });

  final String titulo;
  final String conteudo;
  final String urlImagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    titulo,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(conteudo,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 64),
                  child: FilledButton(
                    onPressed: () {},
                    child: Text('SOLICITAR COLETA'),
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.network(
              urlImagem,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
