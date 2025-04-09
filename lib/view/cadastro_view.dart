import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/cadastro_controller.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final ctrl = GetIt.I.get<CadastroController>();
  bool _senhaVisivel = false;
  bool _confirmarSenhaVisivel = false;

  final TextEditingController nomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: ctrl.txtNome,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.txtEmail,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.txtSenha,
                  obscureText: !_senhaVisivel,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _senhaVisivel = !_senhaVisivel;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.txtConfirmarSenha,
                  obscureText: !_confirmarSenhaVisivel,
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmarSenhaVisivel
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmarSenhaVisivel = !_confirmarSenhaVisivel;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.txtCpf,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.badge),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.txtTelefone,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.txtEndereco,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.txtDataNascimento,
                  decoration: InputDecoration(
                    labelText: 'Data de Nascimento',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 15),
                SwitchListTile(
                  title: Text('Aceitar os termos do serviço'),
                  value: ctrl.aceito,
                  onChanged: (value) {
                    ctrl.atualizarAceito(value);
                  },
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
                    if (ctrl.txtNome.text.isEmpty ||
                        ctrl.txtEmail.text.isEmpty ||
                        ctrl.txtSenha.text.isEmpty ||
                        ctrl.txtConfirmarSenha.text.isEmpty ||
                        ctrl.txtCpf.text.isEmpty ||
                        ctrl.txtTelefone.text.isEmpty ||
                        ctrl.txtEndereco.text.isEmpty ||
                        ctrl.txtDataNascimento.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Preencha todos os campos!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    if (ctrl.aceito == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Aceite os termos do serviço!'),
                          backgroundColor: Colors.red,
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
          ),
        ));
  }
}
