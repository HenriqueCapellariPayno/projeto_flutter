import 'package:flutter/material.dart';

class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  _CarrinhoViewState createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  final List<Map<String, dynamic>> _itensCarrinho = [];
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final List<Map<String, dynamic>>? itens =
      ModalRoute.of(context)?.settings.arguments as List<Map<String, dynamic>>?;
    if (itens != null) {
    setState(() {
      _itensCarrinho.addAll(itens);
    });
  }
}

  void _adicionarAoCarrinho(String nome, double preco, imagePath) {
    setState(() {
      _itensCarrinho.add({'nome': nome, 'preco': preco, imagePath: imagePath});
    });
  }

  void _removerItem(int index) {
    setState(() {
      _itensCarrinho.removeAt(index);
    });
  }

  double _calcularTotal() {
    return _itensCarrinho.fold(0.0, (total, item) => total + item['preco']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white, // Define a cor da seta para voltar
        ),
      ),
      body: Column(
        children: [
          Expanded(
        child: ListView.builder(
          itemCount: _itensCarrinho.length,
          itemBuilder: (context, index) {
            final item = _itensCarrinho[index];
            return ListTile(
          title: Text(item['nome']),
          subtitle: Text('R\$ ${item['preco'].toStringAsFixed(2)}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _removerItem(index),
          ),
            );
          },
        ),
          ),
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'R\$ ${_calcularTotal().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
          onPressed: () {
            // Lógica para finalizar a compra
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Compra finalizada!')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Cor do botão
            foregroundColor: Colors.white, // Cor do texto
          ),
          child: Text('Finalizar Compra'),
            ),
          ],
        ),
          ),
        ],
      
      ),
    );
  }
}
