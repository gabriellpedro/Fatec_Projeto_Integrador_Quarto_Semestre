import 'package:ecoponto/src/pages/home_page.dart';
import 'package:ecoponto/src/pages/login_page.dart';
import 'package:ecoponto/src/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoPonto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.righteousTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/map': (context) => const MapPage(),
      },
    );
  }
}
