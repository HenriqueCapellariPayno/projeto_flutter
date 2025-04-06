import 'package:flutter/material.dart';

class ContaView extends StatelessWidget {
  const ContaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        title: Text('Minha Conta'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bem-vindo, [Nome de Usuário]',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de editar perfil
              },
              child: Text('Editar Perfil'),
            ),
            ElevatedButton(
              onPressed: () {
                // Exibir informações sobre a aplicação
              },
              child: Text('Sobre Nós'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Meus Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Conta',
          ),
        ],
        onTap: (index) {
          // Lógica para navegar entre as telas
          switch (index) {
            case 0:
              // Navegar para a tela inicial
              Navigator.pushNamed(context, 'tela_inicial');  
              break;
            case 1:
              // Permanecer na tela de conta
              break;
            case 2:
              // Navegar para a tela de configurações
              break;
          }
        },
      ),
    );
  }
}