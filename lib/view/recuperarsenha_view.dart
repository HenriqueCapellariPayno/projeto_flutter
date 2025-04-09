//stf + tab
import 'package:flutter/material.dart';

class SenhaView extends StatefulWidget {
  const SenhaView({super.key});

  @override
  State<SenhaView> createState() => _SenhaViewState();
}

class _SenhaViewState extends State<SenhaView> {

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
