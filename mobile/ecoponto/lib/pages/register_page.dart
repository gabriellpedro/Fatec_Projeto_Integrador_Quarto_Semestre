// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _senhaConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 40,
          right: 40,
        ),
        color: Colors.white12,
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 224,
                height: 224,
                child: const Image(
                  image:
                      AssetImage('assets/images/ecoponto_with_brand_out.png'),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'email@email.com',
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Digite u e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _senhaController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Digite uma senha',
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                validator: (senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Digite uma senha';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senhaConfirmController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirme sua senha',
                  labelText: 'Confirme a senha',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                validator: (senha) {
                  if (senha == _senhaController.text ||
                      senha == null ||
                      senha.isEmpty) {
                    return 'Digite as duas senhas iguais';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.3, 1],
                    colors: const [
                      Color.fromARGB(100, 86, 171, 47),
                      Color.fromARGB(100, 168, 224, 99),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          ' Cadastrar-se',
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
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 40,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Já possuo conta',
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
