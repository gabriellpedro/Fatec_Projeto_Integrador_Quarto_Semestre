import 'package:ecoponto/core/bloc/recycle_balance/recycle_balance_bloc.dart';
import 'package:ecoponto/presentation/recycle_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecoponto/pages/recycle_balance.dart'; // Import your RecycleBalancePage
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecoponto/pages/login_page.dart'; // Import your login page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide an instance of RecycleBalanceBloc
        BlocProvider(
          create: (context) => RecycleBalanceBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'EcoPonto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Use the AuthWrapper widget to handle authentication
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late String? authToken;

  @override
  void initState() {
    super.initState();
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');

    setState(() {
      authToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (authToken != null) {
      // If authenticated, show the RecycleBalance page
      return const RecycleBalance();
    } else {
      // If not authenticated, show the login page
      return LoginPage();
    }
  }
}