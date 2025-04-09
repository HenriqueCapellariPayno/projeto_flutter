import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sobre Nós',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Define a cor da seta para voltar
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Espaço abaixo do AppBar
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('image/logo_muhen.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Este é o Muhen, um marketplace intuitivo onde você poderá comprar e vender produtos de forma fácil e rápida. O projeto foi desenvolvido por Murillo Bitencourt Baptista e Henrique Capellari Payno, alunos do curso de Análise e Desenvolvimento de Sistemas da Fatec Ribeirão Preto. Viemos por meio deste, para desejar que você tenha uma ótima experiência com o nosso aplicativo!',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              height: 1.5, // Espaçamento entre linhas
              letterSpacing: 0.5, // Espaçamento entre letras
              ),
            ),
          ],
            ),
      ),
    );
  }
}
