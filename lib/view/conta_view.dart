import 'package:flutter/material.dart';

class ContaView extends StatefulWidget {
  const ContaView({super.key});

  @override
  State<ContaView> createState() => _ContaViewState();
}

class _ContaViewState extends State<ContaView> {
  int _currentIndex = 2; // Índice da aba atual (Conta)

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Atualiza o índice da aba atual
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, 'tela_inicial'); // Navegar para a tela inicial
        break;
      case 1:
        Navigator.pushNamed(context, 'meus_pedidos'); // Navegar para a tela de meus pedidos
        break;
      case 2:
        // Permanece na tela de conta
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Recupera o nome do usuário passado pela tela de cadastro
    final String txtNome = ModalRoute.of(context)?.settings.arguments as String? ?? 'Usuário'; // Nome padrão caso não seja fornecido
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.green,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      title: Text('Minha Conta'),
      centerTitle: true,
      actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Ação para abrir configurações
              Navigator.pushNamed(context, 'configuracoes');
            },
          ),
        ]
      ),
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Stack(
          alignment: Alignment.center,
          children: [
          CircleAvatar(
            radius: 50, // Tamanho do círculo
            backgroundImage: AssetImage('assets/images/profile.jpg'), // Caminho da imagem
            backgroundColor: Colors.grey[200], // Cor de fundo caso a imagem não carregue
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
            onTap: () {
              // Lógica para editar perfil
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.green,
              child: Icon(
              Icons.edit,
              size: 15,
              color: Colors.white,
              ),
            ),
            ),
          ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'Bem-vindo, $txtNome!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.green, width: 1.0),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
           
          },
          child: Text(
          'Produtos Favoritos',
          style: TextStyle(color: Colors.green),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.green, width: 1.0),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
          Navigator.pushNamed(context, 'sobre'); // Navegar para a tela de sobre
          },
          child: Text(
          'Sobre Nós',
          style: TextStyle(color: Colors.green),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.green, width: 1.0),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirmação'),
              content: Text('Você deseja mesmo sair da sua conta?'),
              actions: [
              TextButton(
                onPressed: () {
                Navigator.of(context).pop(); // Fechar o alerta
                },
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.black),
                  ),
              ),
              TextButton(
                onPressed: () {
                Navigator.of(context).pop(); // Fechar o alerta
                Navigator.pushNamed(context, 'home'); // Navegar para a tela inicial
                },
                child: Text('Confirmar',
                style: TextStyle(color: Colors.red),
                ),
              ),
              ],
            );
            },
          );
          },
          child: Text(
          'Sair',
          style: TextStyle(color: Colors.red),
          ),
        ),
        ],
      ),
      ),
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt, color: Colors.green),
            label: 'Meus Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green),
            label: 'Conta',
          ),
        ],
        onTap: _onItemTapped,
      ),
      );  
    }
  }





      