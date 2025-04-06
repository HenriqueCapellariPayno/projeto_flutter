import 'package:flutter/material.dart';

class MeusPedidosView extends StatelessWidget {
  const MeusPedidosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          PedidoCard(
            status: 'Pedido Recebido',
            descricao: 'Seu pedido foi recebido e está sendo processado.',
            icon: Icons.receipt,
            color: Colors.blue,
          ),
          PedidoCard(
            status: 'A Caminho',
            descricao: 'Seu pedido está a caminho.',
            icon: Icons.local_shipping,
            color: Colors.orange,
          ),
          PedidoCard(
            status: 'Entregue',
            descricao: 'Seu pedido foi entregue com sucesso.',
            icon: Icons.check_circle,
            color: Colors.green,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Define "Meus Pedidos" como selecionado
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              // Já estamos na tela "Meus Pedidos"
              break;
            case 2:
              Navigator.pushNamed(context, '/conta');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Meus Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Conta',
          ),
        ],
      ),
    );
  }
}

class PedidoCard extends StatelessWidget {
  final String status;
  final String descricao;
  final IconData icon;
  final Color color;

  const PedidoCard({
    required this.status,
    required this.descricao,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
          size: 40.0,
        ),
        title: Text(
          status,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(descricao),
      ),
    );
  }
}