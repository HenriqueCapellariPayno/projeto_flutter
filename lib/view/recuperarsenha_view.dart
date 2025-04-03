//stf + tab
import 'package:aula_navigator/controller/recuperarsenha_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SenhaView extends StatefulWidget {
  const SenhaView({super.key});

  @override
  State<SenhaView> createState() => _SenhaViewState();
}

class _SenhaViewState extends State<SenhaView> {
  final ctrl = GetIt.I.get<RecuperarSenhaController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recuperar senha'),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: ctrl.txtEmail,
                decoration: InputDecoration(
                  labelText: 'E-mail ou Número de Telefone',
                  border: OutlineInputBorder(),
                ),
              ),
          
              SizedBox(height: 40),
              TextButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 18),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {},
                
                child: Text('Enviar código'),
              ),
            ],
          ),
        ));
  }
}
