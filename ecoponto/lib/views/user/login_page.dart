import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/views/home_page.dart';
import 'package:flutter_ecommerce/views/user/register_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ecommerce/providers/auth_provider.dart'; // Make sure to import the authProvider

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final authProvider = Provider<AuthService>((ref) {
    return AuthService();
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white12,
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                width: 224,
                height: 224,
                child: Image(
                  image: AssetImage('images/ecoponto_with_brand_out.png'),
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'email@email.com',
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                style: const TextStyle(fontSize: 15),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Digite seu e-mail';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: _senhaController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Digite sua senha',
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                style: const TextStyle(fontSize: 15),
                validator: (senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Digite sua senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black38),
                  ),
                  child: const Text("Recuperar senha"),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color.fromARGB(100, 86, 171, 47),
                      Color.fromARGB(100, 168, 224, 99),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          ' Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 28,
                          width: 28,
                          child: Icon(Icons.done),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final authService = ref.read(authProvider);
                        final success = await authService.login(
                          _emailController.text,
                          _senhaController.text,
                        );

                        if (success) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to login')),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text(
                    'Cadastre-se',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
