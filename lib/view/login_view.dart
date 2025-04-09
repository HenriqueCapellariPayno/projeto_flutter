import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/gestures.dart';

import '../controller/cadastro_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ctrl = GetIt.I.get<CadastroController>();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: ctrl.txtNome,
                decoration: InputDecoration(
                  labelText: 'Nome de Usuário ou E-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: ctrl.txtEmail,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              SwitchListTile(
                title: Text('Aceitar os termos do serviço'),
                value: ctrl.aceito,
                onChanged: (value) {
                  ctrl.atualizarAceito(value);
                },
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Esqueci minha senha',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, 'recuperar_senha');
                    },
                ),
              ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  text: 'Não tem uma conta? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Cadastre-se agora',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, 'cadastro');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              TextButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 135, vertical: 18),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  if (!ctrl.aceito) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Atenção!'),
                        content: Text('Você precisa aceitar os termos do serviço.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }
                  if (ctrl.txtNome.text.isEmpty || ctrl.txtEmail.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Erro'),
                        content: Text('Todos os campos devem ser preenchidos.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }
                  Navigator.pushNamed(context, 'tela_inicial');
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ));
  }
}
