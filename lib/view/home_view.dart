import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cadastro');
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 20), // Espaço maior entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
  }
