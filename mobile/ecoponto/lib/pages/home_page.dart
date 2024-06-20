// home_page.dart

import 'package:ecoponto/presentation/recycle_balance.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String? token; // Change the token to accept nullable strings

  const HomePage({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example of how to use the token in a request to your backend
                // This is just a placeholder, replace it with your actual request logic
                if (token != null) {
                  // Proceed with authenticated action
                  print('Token available: $token');
                } else {
                  // Prompt user to log in again
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
              child: Text('Fetch User Data'),
            ),
            ElevatedButton(
              onPressed: () {
                // Example of how to use the token in a request to your backend
                // This is just a placeholder, replace it with your actual request logic
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const RecycleBalance()),
            );
              },
              child: Text('Carregar materiais de usuário'),
            ),
          ],
        ),
      ),
    );
  }
}