import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // CrossAxisAlignment para centralizar o texto e os botões
        children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0), // Espaço entre o texto e a imagem
          child: Text(
            'Bem-vindo(a) a Muhen!',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0), // Espaço entre a imagem e os botões
          child: Image.asset(
            'assets/logo.png', // Caminho da imagem
            width: 150, // Largura da imagem
            height: 150, // Altura da imagem  
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0), // Espaço entre o texto e o botão
          child: Text(
            'Já possui cadastro? Faça seu Login!',
            style: TextStyle(fontSize: 16),
          ),
        ),
        TextButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 135, vertical: 18),
            textStyle: TextStyle(fontSize: 18),
          ),
          onPressed: () {
          Navigator.pushNamed(context, 'login');
          },
          child: Text('Login'),
        ),
        SizedBox(height: 25), // Espaço maior entre os botões
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0), // Espaço entre o texto e o botão
          child: Text(
            'Cadastre-se agora mesmo!',
            style: TextStyle(fontSize: 16),
          ),
        ),
        TextButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 120, vertical: 19),
            textStyle: TextStyle(fontSize: 18),
          ),
          onPressed: () {
          Navigator.pushNamed(context, 'cadastro');
          },
          child: Text('Cadastrar'),
        ),
        ],
      ),
      ),
    );
  }
  }
